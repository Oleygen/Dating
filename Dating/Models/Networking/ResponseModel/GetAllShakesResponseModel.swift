//
//  GetAllShakesResponseModel.swift
//  loc
//
//  Created by oleygen ua on 2/4/19.
//  Copyright © 2019 oleygen. All rights reserved.
//

import Foundation

class GetAllShakesResponseModel : Decodable {
    let result: String
    let data: [Shake]
    
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let result = try container.decode(String.self, forKey: .result)
        let data = try container.decode([Shake].self, forKey: .data)
        
        
        self.result = result
        self.data = data
        
    }
    
    
    enum CodingKeys: String, CodingKey {
        case result
        case data
    }
}
