//
//  AuthEndPoint.swift
//  Dating
//
//  Created by Gennady  Oleynik  on 8/31/19.
//  Copyright © 2019 Gennady  Oleynik . All rights reserved.
//

import Foundation

enum NetworkEnvironment {
    case prod
    case dev
}

public enum AuthAPI {
    case createUser(user: UserNetworkModel)
    case login(loginModel: LoginNetworkModel)
}

extension AuthAPI: EndPointType {
    var path: String {
        switch self {
        case .createUser:
            return "/users/create"
        case .login:
            return "/users/login"
        }
    }
    var httpMethod: HTTPMethod {
        return .post
    }
    
    var task: HTTPTask {
        switch self {
        case .createUser(let userModel):
            return .requestObject(bodyObject: userModel, urlParameters: nil)
        case .login(let loginModel):
            return .requestObject(bodyObject: loginModel, urlParameters: nil)
        default:
            return .request
        }
    }
    
    var headers: HTTPHeaders? {
        return nil
    }
}
