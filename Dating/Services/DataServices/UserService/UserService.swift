//
//  UserService.swift
//  loc
//
//  Created by oleygen ua on 1/25/19.
//  Copyright © 2019 oleygen. All rights reserved.
//

import Foundation
import RealmSwift

class UserService {
    
    static func saveOrUpdate(users: Array<User>) throws {
        try users.forEach { user in
            try UserService.saveOrUpdate(user: user)
        }
    }
    
    static func saveOrUpdate(user: User) throws {
        let realm = try Realm()
        
        guard let email = user.email else {
            throw ApplicationError.noEmail
        }
        
        if let localUser = realm.objects(User.self).filter("email == %@", email).first {
            try UserService.update(local: localUser, incoming: user)
        } else {
            try UserService.save(user: user)
        }
    }
    
    static func update(local: User, incoming: User) throws {
        let realm = try Realm()
        try realm.write {
  
            local.userId.value = incoming.userId.value
            local.email = incoming.email
            local.firstName = incoming.firstName
            local.lastName = incoming.lastName
            local.phone = incoming.phone
        }
    }
    
    static func save(user: User) throws {
        let realm = try Realm()

        try realm.write {
            realm.add(user)
        }
    }

    
    static func createUser(id: Int, registerRequest: RegisterRequestModel) throws {
        let realm = try Realm()
        let newUser = User()
        newUser.userId.value = id
        newUser.firstName = registerRequest.firstName
        newUser.lastName = registerRequest.lastName
        newUser.phone = registerRequest.phone
        newUser.email = registerRequest.email
        try realm.write {
            realm.add(newUser)
        }
    }
    

    
    static func updateUser(with loginResponse: LoginResponseModel) throws {
        let realm = try Realm()
        
        if let user = realm.objects(User.self).filter("email == %@", loginResponse.email).first {
            try realm.write {
                user.userId.value = loginResponse.userId
                user.firstName = loginResponse.firstName
                user.lastName = loginResponse.lastName
                user.phone = loginResponse.phone
                user.email = loginResponse.email
            }
        } else {
            let newUser = User()
            newUser.userId.value = loginResponse.userId
            newUser.firstName = loginResponse.firstName
            newUser.lastName = loginResponse.lastName
            newUser.phone = loginResponse.phone
            newUser.email = loginResponse.email
            try realm.write {
                realm.add(newUser)
            }
            
        }
        
    }
    
}


