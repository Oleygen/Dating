//
//  LoginResponseModel.swift
//  loc
//
//  Created by oleygen ua on 2/13/19.
//  Copyright © 2019 oleygen. All rights reserved.
//

import Foundation

class LoginResponseModel: Decodable {
    let userId: Int
    let firstName: String?
    let lastName: String?
    let email: String
    let phone: String?
    
    enum CodingKeys: String, CodingKey {
        case data
        case id
        case firstName
        case lastName
        case email
        case phone
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self).nestedContainer(keyedBy: CodingKeys.self, forKey: .data)
        self.userId = try container.decode(Int.self, forKey: .id)
        self.firstName = try container.decodeIfPresent(String.self, forKey: .firstName)
        self.lastName = try container.decodeIfPresent(String.self, forKey: .lastName)
        self.email = try container.decode(String.self, forKey: .email)
        self.phone = try container.decodeIfPresent(String.self, forKey: .phone)
    }
}
