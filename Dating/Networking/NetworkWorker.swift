//
//  NetworkWorker.swift
//  loc
//
//  Created by oleygen ua on 1/24/19.
//  Copyright © 2019 oleygen. All rights reserved.
//

import Foundation
typealias SuccessHandler = () -> Void
typealias FailureHandler =  (Error) -> Void

typealias DecodableSuccessHandler = (Decodable) -> Void
typealias DecodableFailureHandler = (Error) -> Void

class NetworkWorker {
    private let session: URLSession
    private weak var delegateQueue: OperationQueue?
    
    init() {
        let queue = OperationQueue()
        queue.maxConcurrentOperationCount = 1
        self.delegateQueue = queue
        self.session = URLSession(configuration: URLSessionConfiguration.default, delegate: nil, delegateQueue: queue)
    }
    
    func fetch(with endpoint: Endpoint, successHandler: @escaping SuccessHandler, failureHandler: @escaping FailureHandler) {
        do {
            let task = try decodingTask(with: endpoint, successHandler: successHandler, failureHandler: { networkError in
                DispatchQueue.main.async {
                    failureHandler(networkError)
                }
            })
            task.resume()
        } catch {
            failureHandler(error)
        }
    }
    
    func fetch<T:Decodable>(with endpoint: Endpoint, decode: @escaping (Decodable) -> T, successHandler: @escaping DecodableSuccessHandler, failureHandler: @escaping FailureHandler) {
        do {
            let task = try decodingTask(with: endpoint, decodingType: T.self, successHandler: { decodable in
                let result = decode(decodable)
                successHandler(result)
            }) { networkError in
                DispatchQueue.main.async {
                    failureHandler(networkError)
                }
            }
            task.resume()
        } catch {
            failureHandler(error)
        }
        
    }
    private func decodingTask(with endpoint: Endpoint, successHandler: @escaping SuccessHandler, failureHandler: @escaping FailureHandler) throws -> URLSessionDataTask {
        let urlRequest = try endpoint.urlRequest()
        return performTask(urlRequest: urlRequest, successHandler: successHandler, failureHandler: failureHandler)
    }
    
    private func decodingTask<T:Decodable>(with endpoint: Endpoint, decodingType: T.Type, successHandler: @escaping DecodableSuccessHandler, failureHandler: @escaping DecodableFailureHandler) throws -> URLSessionDataTask {
        let urlRequest = try endpoint.urlRequest()
        return performTask(urlRequest: urlRequest, decodingType: T.self, successHandler: successHandler, failureHandler: failureHandler)
    }
    
    private func performTask(urlRequest: URLRequest, successHandler: @escaping SuccessHandler, failureHandler: @escaping DecodableFailureHandler) -> URLSessionDataTask {
        let task = session.dataTask(with: urlRequest) { (data, response, error) in
            if let httpResponse = response as? HTTPURLResponse {
                if httpResponse.statusCode >= 200 && httpResponse.statusCode < 300 {
                    if data != nil {
                        successHandler()
                    } else {
                        failureHandler(ApplicationError.Network.noData)
                    }
                } else {    
                    if let data = data {
                        do {
                            let networkError = try JSONDecoder().decode(ApplicationError.Network.self, from: data)
                            failureHandler(networkError)
                        } catch {
                            failureHandler(ApplicationError.Network.errorDecodeFailure)
                        }
                    } else {
                        failureHandler(ApplicationError.Network.noErrorData)
                    }
                }
            } else {
                failureHandler(ApplicationError.Network.notHTTPResponse)
            }
        }
        return task
    }
    
    private func performTask<T: Decodable>(urlRequest: URLRequest, decodingType: T.Type, successHandler: @escaping DecodableSuccessHandler, failureHandler: @escaping DecodableFailureHandler) -> URLSessionDataTask {
        let task = session.dataTask(with: urlRequest) { (data, response, error) in
            if let httpResponse = response as? HTTPURLResponse {
                if httpResponse.statusCode >= 200 && httpResponse.statusCode < 300 {
                    if let data = data {
                        do {
                             let model = try JSONDecoder().decode(decodingType, from: data)
                            successHandler(model)
                        } catch {
                            failureHandler(ApplicationError.Network.jsonDecodeFailure)
                        }
                    } else {
                        failureHandler(ApplicationError.Network.noData)
                    }
                } else {
                    if let data = data {
                        do {
                            let networkError = try JSONDecoder().decode(ApplicationError.Network.self, from: data)
                            failureHandler(networkError)
                        } catch {
                            failureHandler(ApplicationError.Network.errorDecodeFailure)
                        }
                    } else {
                        failureHandler(ApplicationError.Network.noErrorData)
                    }
                }
            } else {
                failureHandler(ApplicationError.Network.notHTTPResponse)
            }
        }
        return task
    }
    
    func invalidate() {
        delegateQueue?.cancelAllOperations()
        session.invalidateAndCancel()
    }
}
