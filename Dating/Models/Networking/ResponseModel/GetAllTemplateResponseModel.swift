//
//  GetAllTemplateResponseModel.swift
//  loc
//
//  Created by oleygen ua on 1/24/19.
//  Copyright © 2019 oleygen. All rights reserved.
//

import Foundation

class GetAllTemplateResponseModel: Decodable {
    let data: [Template]

    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let data = try container.decode([Template].self, forKey: .data)

        
        self.data = data

    }
    
    
    enum CodingKeys: String, CodingKey {
        case result
        case data
    }
}
