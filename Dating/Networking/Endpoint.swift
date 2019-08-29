//
//  Endpoint.swift
//  loc
//
//  Created by oleygen ua on 1/24/19.
//  Copyright © 2019 oleygen. All rights reserved.
//

import Foundation


extension ApplicationError {
    public enum Endpoint: Error {
        case requestMappingFailure
    }
}

public enum RequestMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case patch = "PATCH"
    case delete = "DELETE"
}

public enum URLPath: String {
    case appInstalled = "AppInstalled"
    case registerPushToken = "SetDeviceToken"
    case getAllTemplates = "GetAllTemplates"
    case createShake = "CreateShake"
    case saveDraft = "CreateShakeEdit"
    case getShake = "FindShake"
    case findShakesForUser = "FindShakesForUser"
    case findInvitedShakes = "FindShakesInvitedTo"
    case findShakesWithCode = "FindShakeByInvitationCode"
    case createCustomKeyForStripe = "" // TODO: -
    case register = "RegisterUser"
    case login = "Login"
    case getPublishCode = "AddToShakeInvitations"
    case getShakeSignatures = "GetShakeSignatures"
    case addSignatureToShake = "AddSignatureToShake"
    case setPKForUser = "SetPKForUser"
    case findFriends = "FindUserFriends"
    case createComment = "CreateShakeComment"
    case declineShake = "ShakeDeclined"
    case archiveShake = "ShakeArchived"
    case revokeShake = "RevokeShake"
    case setValidityConditions = "SetValidityConditions"
}


open class Endpoint {
    
    static let baseURL = "http://"
    static let APIKey = "jf9;2000kl1$-r1023"
    
    public let path: URLPath
    public let method: RequestMethod
    public let task: Task
    public let httpHeaderFields: [String : String]?
    
    public var urlParameters: [Any]?
    
    public init(path: URLPath,
                method: RequestMethod,
                task: Task,
                httpHeaderFields: [String: String]?,
                urlParameters: [Any]? = nil) {
        self.path = path
        self.method = method
        self.task = task
        self.httpHeaderFields = httpHeaderFields
        self.urlParameters = urlParameters
    }
    
    public func urlRequest() throws -> URLRequest {
        guard let unwrappedUrl = url, let requestURL = Foundation.URL(string: unwrappedUrl) else {
            throw ApplicationError.Endpoint.requestMappingFailure
        }
        
        var request = URLRequest(url: requestURL)
        request.httpMethod = method.rawValue
        request.allHTTPHeaderFields = httpHeaderFields
        
        switch task {
        case .requestPlain, .uploadFile:
            return request
        case .requestData(let data):
            request.httpBody = data
            return request
            //        case requestJSONEncodable(encodable):
            //            return try request.encoded(encodable: encodable)
            //
            //        /// A request body set with `Encodable` type and custom encoder
            //        case requestCustomJSONEncodable(Encodable, encoder: JSONEncoder)
            //
            //        /// A requests body set with data, combined with url parameters.
            //        case requestCompositeData(bodyData: Data, urlParameters: [String: Any])
        }
    }
    
    public var url: String? {
        var string: String!
        string = "\(Endpoint.baseURL)/\(path.rawValue)/\(Endpoint.APIKey)"
        string = string.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        
        
        if let parameters = urlParameters {
            parameters.forEach { parameter in
                let strParameter = "\(parameter)"
                if let escaped = strParameter.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) {
                    string.append("/\(escaped)")
                } else {
                    fatalError("parameter invalid")
                }
            }
        }

        return string
    }
}
