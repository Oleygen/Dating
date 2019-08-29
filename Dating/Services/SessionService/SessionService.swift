//
//  Session.swift
//  loc
//
//  Created by Oleynik Gennady on 24/03/2019.
//  Copyright © 2019 oleygen. All rights reserved.
//

import Foundation
import SwiftyUserDefaults
import SwiftyRSA
import RealmSwift

/*
 SessionService is a static in-memory storage + handy system getters
 */

class SessionService {
    private static let keyPrivate = "privateKey"
    private static let keyPublic = "publicKey"
    private static let keyEmail = "emailKey"
    private static let keyPassword = "passwordKey"
    
    private static let securityService: SecurityService = SecurityService()
    private static let keychainService: KeychainService = KeychainService()
    
    
    public static var deviceIdentifier: String {
        return UIDevice.current.identifierForVendor!.uuidString
    }
    
    public static var phoneType: String {
        return UIDevice.current.modelName
    }
    
    public static var osVersion: String {
        return UIDevice.current.systemVersion
    }
    
    public static var pushToken: String {
        get {
            return Defaults[DefaultsKeys.pushToken]
        }
    }
    
    public static var authorized: Bool {
        get {
            return Defaults[DefaultsKeys.authorized]
        }
        set {
            Defaults[DefaultsKeys.authorized] = newValue
        }
    }
    
    public static var hasRegisteredDeviceToken: Bool {
        get {
            return Defaults[DefaultsKeys.isTokenRegistered]
        }
        set {
            Defaults[DefaultsKeys.isTokenRegistered] = newValue
        }
    }
    
    public static var firstRun: Bool {
        get {
            return Defaults[DefaultsKeys.firstRun]
        }
        set {
            Defaults[DefaultsKeys.firstRun] = newValue
        }
    }
    
    public static var needShowOnboarding: Bool {
        get {
            return Defaults[DefaultsKeys.needShowOnboarding]
        }
        set {
            Defaults[DefaultsKeys.needShowOnboarding] = newValue
        }
    }
    
    public static var currentUserId: Int? {
        get {
            return Defaults[DefaultsKeys.userId]
        }
        set {
            Defaults[DefaultsKeys.userId] = newValue
        }
    }
    
    public static var current: User? {
        guard let userId = currentUserId else {
            return nil
        }
        return try! Realm().objects(User.self).filter("userId == %@", userId).first
    }
    
    public static func storeCredentials(with loginRequest: LoginRequestModel) throws {
        try self.keychainService.set(stringValue: loginRequest.email, forKey: keyEmail)
        try self.keychainService.set(stringValue: loginRequest.password, forKey: keyPassword)
    }
    
    public static func storeCredentials(with userViewModel: UserViewModel) throws {
        try self.keychainService.set(stringValue: userViewModel.email, forKey: keyEmail)
        try self.keychainService.set(stringValue: userViewModel.password, forKey: keyPassword)
    }
    
    public static func isCredentialsStored() -> Bool {
        let emailStored = try? self.keychainService.getString(forKey: keyEmail)
        let passwordStored = try? self.keychainService.getString(forKey: keyPassword)
        return emailStored != nil && passwordStored != nil
    }
    
    public static func eraseCredentials() throws {
        try self.keychainService.delete(forKey: keyEmail)
        try self.keychainService.delete(forKey: keyPassword)
    }
    
    public static func isPasswordCorrect(password: String) -> Bool {
        guard let storedPassword = self.credentialPassword else {
            return false
        }
        return storedPassword == password
    }
    
    public static var credentialEmail: String? {
        return try? self.keychainService.getString(forKey: keyEmail)
    }
    
    public static  var credentialPassword: String? {
        return try? self.keychainService.getString(forKey: keyPassword)
    }
    
    
    public static func getPublicKey(userAccessKey: String) throws -> PublicKey {
        if userAccessKey == "" {
            throw ApplicationError.userAccessKeyEmpty
        }
        return try PublicKey(data: keychainService.getData(forKey: userAccessKey.lowercased()))
    }
    
    private static func setPublicKey(key: PublicKey, userAccessKey: String) throws {
        if userAccessKey == "" {
            throw ApplicationError.userAccessKeyEmpty
        }
        try keychainService.set(dataValue: key.data(), forKey: userAccessKey.lowercased())
    }
    
    public static func getPrivateKey(userAccessKey: String) throws -> PrivateKey {
        if userAccessKey == "" {
            throw ApplicationError.userAccessKeyEmpty
        }
        return try PrivateKey(data: keychainService.getData(forKey: "p_\(userAccessKey.lowercased())"))
    }
    
    private static func setPrivateKey(key: PrivateKey, userAccessKey: String) throws {
        if userAccessKey == "" {
            throw ApplicationError.userAccessKeyEmpty
        }
        try keychainService.set(dataValue: key.data(), forKey: "p_\(userAccessKey.lowercased())")
    }
    
    public static func generateRSAKeyPair(userAccessKey: String) throws {
        
        let pair = try self.securityService.createKeyPair(sizeInBits: 2048)
        try self.setPublicKey(key: pair.publicKey, userAccessKey: userAccessKey)
        try self.setPrivateKey(key: pair.privateKey, userAccessKey: userAccessKey)
    }
    
    public static func generateSignature(for string: String, userAccessKey: String) throws -> Signature {
        if userAccessKey == "" {
            throw ApplicationError.userAccessKeyEmpty
        }
        let message = try ClearMessage(string: string, using: .ascii)
        let privateKey = try self.getPrivateKey(userAccessKey: userAccessKey)
        return try self.securityService.sign(message: message, with: privateKey)
    }
    
    public static func isSignatureValid(message: ClearMessage, signature: Signature, userAccessKey: String) throws -> Bool {
        if userAccessKey == "" {
            throw ApplicationError.userAccessKeyEmpty
        }
        let publicKey = try self.getPublicKey(userAccessKey: userAccessKey)
        return try self.securityService.verify(message: message, signature: signature, with: publicKey)
    }
    
}
