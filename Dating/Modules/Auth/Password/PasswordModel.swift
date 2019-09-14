//
//  PasswordModel.swift
//  Dating
//
//  Created by Gennady  Oleynik  on 8/29/19.
//  Copyright © 2019 Gennady  Oleynik . All rights reserved.
//

import Foundation

class PasswordModel: BaseModel {
    private var userModel: UserNetworkModel
    
    init(userModel: UserNetworkModel) {
        self.userModel = userModel
    }
    
    let networkManager = NetworkManager()
    
    func performRegistration(password: String, success: @escaping(UserResponseNetworkModel)->(), failure: @escaping(String)->()) {
        self.userModel.password = password
        networkManager.registerUser(user: userModel) { (user, error) in
            if let error = error {
                failure(error)
            }
            if let user = user {
                success(user)
            }
        }
    }
}
