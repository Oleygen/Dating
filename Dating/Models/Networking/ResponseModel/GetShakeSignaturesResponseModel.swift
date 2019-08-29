//
//  GetShakeSignaturesResponseModel.swift
//  loc
//
//  Created by oleygen ua on 2/21/19.
//  Copyright © 2019 oleygen. All rights reserved.
//

import Foundation

class GetShakeSignaturesResponseModel: Decodable {
    let signatures: [ShakeSignature]
    
    enum CodingKeys: String, CodingKey {
        case data
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.signatures = try container.decode([ShakeSignature].self, forKey: .data)
        
    }
}
