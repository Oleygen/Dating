//
//  Router.swift
//  Dating
//
//  Created by Gennady  Oleynik  on 8/31/19.
//  Copyright © 2019 Gennady  Oleynik . All rights reserved.
//

import Foundation

class NetRouter<Endpoint: EndPointType>: NetworkRouter {
    private var task: URLSessionTask?
    
    func request(_ route: Endpoint, completion: @escaping NetworkRouterCompletion) {
        let session = URLSession.shared
        do {
            let request = try self.buildRequest(from: route)
            task = session.dataTask(with: request, completionHandler: { (data, response, error) in
                completion(data, response, error)
            })
        } catch {
            completion(nil, nil, error)
        }
        self.task?.resume()
    }
    
    func cancel() {
        self.task?.cancel()
    }
    
    private func buildRequest(from route: Endpoint) throws -> URLRequest {
        var request = URLRequest(url: route.baseURL.appendingPathComponent(route.path), cachePolicy: .reloadIgnoringLocalAndRemoteCacheData, timeoutInterval: 10.0)
        
        request.httpMethod = route.httpMethod.rawValue
        do {
            switch route.task {
            case .request:
                request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            case .requestParameters(let bodyParameters, let urlParameters):
                try self.configureParameters(bodyParameters: bodyParameters, urlParameters: urlParameters, request: &request)
            case .requestParametersAndHeaders(let bodyParameters, let urlParameters, let additionalHeaders):
                self.addAdditionalHeaders(additionalHeaders, request: &request)
                try self.configureParameters(bodyParameters: bodyParameters, urlParameters: urlParameters, request: &request)
            case .requestObject(let bodyObject, let urlParameters):
                request.setValue("application/json", forHTTPHeaderField: "Content-Type")

                try self.configureParameters(bodyObject: bodyObject, urlParameters: urlParameters, request: &request)
            case .requestObjectAndHeaders(let bodyObject, let urlParameters, let additionalHeaders):
                request.setValue("application/json", forHTTPHeaderField: "Content-Type")

                self.addAdditionalHeaders(additionalHeaders, request: &request)
                try self.configureParameters(bodyObject: bodyObject, urlParameters: urlParameters, request: &request)
            }
            return request
        } catch {
            throw error
        }
    }
    
    private func configureParameters(bodyObject: Codable?, urlParameters: Parameters?, request: inout URLRequest) throws {
        do {
            if let bodyObject = bodyObject {
                try JSONParameterEncoder.encode(urlRequest: &request, with: bodyObject)
            }
            
            
            if let urlParameters = urlParameters {
                try URLParameterEncoding.encode(urlRequest: &request, with: urlParameters)
            }
        } catch {
            throw error
        }
    }
    
    fileprivate func configureParameters(bodyParameters: Parameters?, urlParameters: Parameters?, request: inout URLRequest) throws {
        do {
            if let bodyParameters = bodyParameters {
                try JSONParameterEncoder.encode(urlRequest: &request, with: bodyParameters)
            }
            if let urlParameters = urlParameters {
                try URLParameterEncoding.encode(urlRequest: &request, with: urlParameters)
            }
        } catch {
            throw error
        }
    }
    
    fileprivate func addAdditionalHeaders(_ additionalHeaders: HTTPHeaders?, request: inout URLRequest) {
        guard let headers = additionalHeaders else { return }
        for (key, value) in headers {
            request.setValue(value, forHTTPHeaderField: key)
        }
    }    
}
