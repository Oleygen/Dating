//
//  EndPointType.swift
//  Dating
//
//  Created by Gennady  Oleynik  on 8/30/19.
//  Copyright © 2019 Gennady  Oleynik . All rights reserved.
//

import Foundation

protocol EndPointType {
    var baseURL: URL { get }
    var path: String { get }
    var httpMethod: HTTPMethod { get }
    var task: HTTPTask { get }
    var headers: HTTPHeaders? { get }
    
    var environmentalBaseURL: String { get }
}

extension EndPointType {
    var environmentalBaseURL: String {
        switch NetworkManager.environment {
        case .prod:
            return "http://185.53.131.167/glace-api"
        case .dev:
            return "http://185.53.131.167/glace-api"
        }
    }
    
    var baseURL: URL {
        guard let url = URL(string: environmentalBaseURL) else {
            fatalError("baseURL could not be configured.")
        }
        return url
    }
}
