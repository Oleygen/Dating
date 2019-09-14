//
//  UserResponseNetworkModel.swift
//  Dating
//
//  Created by Gennady  Oleynik  on 8/31/19.
//  Copyright © 2019 Gennady  Oleynik . All rights reserved.
//

import Foundation

class UserResponseNetworkModel: NetworkModel {

    var id: Int?
    var dateCreated: Date?
    var dateUpdated: Date?
    var username: String?
    var active: Bool?
    
    var emailVerified: Bool = false
    var phoneVerified: Bool = false
    
    var imageId: Int?
    
    var name: String?
    var sex: Bool?
    var location: String?
    
    var about: String?
    var work: String?
    var company: String?
    var education: String?
    
    var intentType: Int?
    var intentGender: Int?
    var intentRangeFrom: Int?
    var intentRangeTo: Int?
    
    var relationship: Int?
    var sexuality: Int?
    var living: Int?
    var kids: Int?
    
    var height: Int?
    var weight: Int?
    var body: Int?
    var eye: Int?
    var hair: Int?
    
    var smoking: Int?
    var drinking: Int?
    
    var lat: Float?
    var long: Float?
    var lastActivityDate: Date?
    var birthDate: Date?
    
    var token: String?
    
}
