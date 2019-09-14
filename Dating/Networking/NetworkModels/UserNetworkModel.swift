//
//  UserNetworkModel.swift
//  Dating
//
//  Created by Gennady  Oleynik  on 8/31/19.
//  Copyright © 2019 Gennady  Oleynik . All rights reserved.
//

import Foundation

public class UserNetworkModel: NetworkModel {
    var username: String = ""
    var password: String = ""
    
    var email: String?
    var phone: String?
    
    var name: String?
    var age: Int?
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
    var lon: Float?
}
