//
//  User.swift
//  loc
//
//  Created by oleygen ua on 2/8/19.
//  Copyright © 2019 oleygen. All rights reserved.
//

import Foundation
import RealmSwift
import SwiftyRSA

class User: Object, Decodable {
    
    let userId = RealmOptional<Int>()
    @objc dynamic var firstName: String? = nil
    @objc dynamic var lastName: String? = nil
    @objc dynamic var email: String? = nil
    
    @objc dynamic var password: String? = nil
    @objc dynamic var phone: String? = nil
    
    override static func ignoredProperties() -> [String] {
        return ["password", "phone"]
    }
    
    convenience init(userId: Int?, firstName: String?, lastName: String?, email: String?, phone: String?) throws  {
        
        self.init()
        self.userId.value = userId
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.phone = phone
    }
    
    @objc dynamic var userAccessKey: String {
        guard let email = email else {
            fatalError("No email")
        }
        return email.lowercased()
    }
    
    @objc dynamic var hasPublicKey: Bool {
        let publicKey = try? SessionService.getPublicKey(userAccessKey: userAccessKey)
        return publicKey != nil
    }
    
    @objc dynamic var publicKey: String? {
        guard let publicKey = try? SessionService.getPublicKey(userAccessKey: userAccessKey) else {
            return nil
        }
        guard let result = try? publicKey.base64String() else {
            return nil
        }
        
        return result
    }

    func generateSignature(for string: String) throws -> Signature {
        return try SessionService.generateSignature(for: string, userAccessKey: self.userAccessKey)
    }
    
    // MARK: - Decodable
    
    enum CodingKeys: String, CodingKey {
        case userId = "id"
        case email = "email"
        case firstName = "firstName"
        case lastName = "lastName"
        case phone = "phone"
    }
    
    convenience required init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        let userId = try container.decodeIfPresent(Int.self, forKey: .userId)
        let firstName = try container.decodeIfPresent(String.self, forKey: .firstName)
        let lastName = try container.decodeIfPresent(String.self, forKey: .lastName)
        let email = try container.decodeIfPresent(String.self, forKey: .email)
        let phone = try container.decodeIfPresent(String.self, forKey: .phone)
        
        try self.init(userId: userId, firstName: firstName, lastName: lastName, email: email, phone: phone)
    }
    
    
}
