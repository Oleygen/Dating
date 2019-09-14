//
//  HTTPTask.swift
//  Dating
//
//  Created by Gennady  Oleynik  on 8/30/19.
//  Copyright © 2019 Gennady  Oleynik . All rights reserved.
//

import Foundation

public typealias HTTPHeaders = [String:String]

public enum HTTPTask {
    case request
    case requestParameters(bodyParameters: Parameters?, urlParameters: Parameters?)
    case requestObject(bodyObject: Codable?, urlParameters: Parameters?)
    case requestParametersAndHeaders(bodyParameters: Parameters?, urlParameters: Parameters?, additionHeaders: HTTPHeaders?)
    case requestObjectAndHeaders(bodyObject: Codable?, urlParameters: Parameters?, additionHeaders: HTTPHeaders?)
}
