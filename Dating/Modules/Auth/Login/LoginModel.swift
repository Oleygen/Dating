//
//  LoginModel.swift
//  Dating
//
//  Created by Gennady  Oleynik  on 8/29/19.
//  Copyright © 2019 Gennady  Oleynik . All rights reserved.
//

import Foundation

class LoginModel: BaseModel {
    let networkManager = NetworkManager()
    func performLogin(username: String, password: String, success: @escaping(UserResponseNetworkModel)->(), failure: @escaping(String)->()) {
        let model = LoginNetworkModel()
        model.username = username
        model.password = password
        networkManager.login(model: model) { (user, error) in
            if let error = error {
                failure(error)
            }
            if let user = user {
                success(user)
            }
        }
    }
}
