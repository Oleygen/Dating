//
//  GetPublishCodeResponseModel.swift
//  loc
//
//  Created by oleygen ua on 2/19/19.
//  Copyright © 2019 oleygen. All rights reserved.
//

import Foundation

class GetPublishCodeResponseModel: Decodable {
    let code: String
    
    enum CodingKeys: String, CodingKey {
        case data
        case code
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        var data = try container.nestedUnkeyedContainer(forKey: .data)
        let result = try data.nestedContainer(keyedBy: CodingKeys.self).decode(String.self, forKey: .code)
        self.code = result
    }
}
