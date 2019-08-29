//
//  RegisterModel.swift
//  loc
//
//  Created by oleygen ua on 2/8/19.
//  Copyright © 2019 oleygen. All rights reserved.
//

import Foundation

class RegisterModel: BaseModel {
//    func register(userViewModel: UserViewModel, successHandler: @escaping SuccessHandler, failureHandler: @escaping FailureHandler) {
//        do {
//            
//            try SessionService.generateRSAKeyPair(userAccessKey: userViewModel.email)
//            let publicKey = try SessionService.getPublicKey(userAccessKey: userViewModel.email).base64String()
//            
//            let requestModel = RegisterRequestModel(firstName: userViewModel.firstName, lastName: userViewModel.lastName, email: userViewModel.email, phone: userViewModel.phone, password: userViewModel.password, publicKey: publicKey)
//            
//            self.networkClient.register(requestModel: requestModel, successHandler: {registerResponse in
//                do {
//                    try UserService.createUser(id: registerResponse.data, registerRequest: requestModel)
//                    SessionService.currentUserId = registerResponse.data
//                    SessionService.authorized = true
//                    try SessionService.storeCredentials(with: userViewModel)
//
//                    successHandler()
//                } catch {
//                    failureHandler(error)
//                }
//            }, failureHandler: failureHandler)
//            
//        } catch {
//            failureHandler(error)
//        }
//        
//   
//    }
}
