//
//  LoginModel.swift
//  loc
//
//  Created by oleygen ua on 2/8/19.
//  Copyright © 2019 oleygen. All rights reserved.
//

import Foundation
import RealmSwift

class LoginModel: BaseModel {
    
//    func login(email: String, password: String, successHandler: @escaping SuccessHandler, failureHandler: @escaping FailureHandler) {
//        
//        let realm = try! Realm()
//        let user = realm.objects(User.self).filter("email ==[c] %@", email).first
//        
//        if let publicKey = user?.publicKey { // if in a storage
//            let loginRequestModel = LoginRequestModel(email: email, password: password, publicKey: publicKey)
//            
//            self.performLogin(loginRequest: loginRequestModel, successHandler: successHandler, failureHandler: failureHandler)
//            
//        } else { // not in a storage
//            // generate new keypair for email
//            do {
//                try SessionService.generateRSAKeyPair(userAccessKey: email) //FIXME: - abuse spacing
//                let publicKey = try SessionService.getPublicKey(userAccessKey: email).base64String()
//                let loginRequestModel = LoginRequestModel(email: email, password: password, publicKey: publicKey)
//                
//                self.performLogin(loginRequest: loginRequestModel, successHandler: {
//                    
//                    guard let user = realm.objects(User.self).filter("email ==[c] %@", email).first else {
//                        failureHandler(ApplicationError.noUserAfterLogin)
//                        return
//                    }
//                    
//                    // server wants this to ensure that public keys duplications won't happen
//                    
//                    self.updateUserPublicKey(user: user, successHandler: successHandler, failureHandler: failureHandler)
//                }, failureHandler: failureHandler)
//            } catch {
//                failureHandler(error)
//            }
//          
//        }
//    }
//    
//    
//    
//    private func performLogin(loginRequest: LoginRequestModel, successHandler: @escaping SuccessHandler, failureHandler: @escaping FailureHandler) {
//        self.networkClient.login(requestModel: loginRequest, successHandler: { loginResponseModel in
//            do {
//                try UserService.updateUser(with: loginResponseModel)
//                SessionService.authorized = true
//                SessionService.currentUserId = loginResponseModel.userId
//                try SessionService.storeCredentials(with: loginRequest)
//                successHandler()
//            }
//            catch {
//                failureHandler(error)
//            }
//        }, failureHandler: failureHandler)
//    }
//    
//    private func updateUserPublicKey(user: User, successHandler: @escaping SuccessHandler, failureHandler: @escaping FailureHandler) {
//        guard let userId = user.userId.value else {
//            failureHandler(ApplicationError.noUserId)
//            return
//        }
//        
//        guard let publicKey = user.publicKey else {
//            failureHandler(ApplicationError.noPublicKey)
//            return
//        }
//        
//        
//        self.networkClient.updatePublicKey(for: userId, newPublicKey: publicKey, successHandler: successHandler, failureHandler: failureHandler)
//    }
    
    deinit {
        print("deinit \(#file)")
    }
}
