//
//  NetworkManager.swift
//  Dating
//
//  Created by Gennady  Oleynik  on 8/31/19.
//  Copyright © 2019 Gennady  Oleynik . All rights reserved.
//

import Foundation

struct NetworkManager {
    enum NetworkResponse: String {
        case success
        case authenticationError = "Authentication error"
        case badRequest = "Bad Request"
        case outdated = "The URL you requested is outdated"
        case failed = "Network request failed"
        case noData = "Response returned with no data to decode"
        case unableToDecode = "We could not decode the response"
    }
    
    enum Result<String> {
        case success
        case failure(String)
    }
    
    static let environment: NetworkEnvironment = .dev
    let router = NetRouter<AuthAPI>()
    
    func handleNetworkResponse(_ response: HTTPURLResponse) -> Result<String> {
        switch response.statusCode {
        case 200...299:
            return .success
        case 401...499:
            return .failure(NetworkResponse.authenticationError.rawValue)
        case 500...599:
            return .failure(NetworkResponse.badRequest.rawValue)
        case 600:
            return .failure(NetworkResponse.outdated.rawValue)
        default: return .failure(NetworkResponse.failed.rawValue)
        }
    }
}
