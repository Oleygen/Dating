//
//  GetShakeResponseModel.swift
//  loc
//
//  Created by oleygen ua on 2/1/19.
//  Copyright © 2019 oleygen. All rights reserved.
//

import Foundation

class GetShakeResponseModel: Decodable {
    var versions: [ShakeHistoryVersion]?
    var shake: Shake?
    
    enum CodingKeys: String, CodingKey {
        case data = "data"
        case versions = "edits"
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let nestedContainer = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .data)
        let shake = try nestedContainer.decodeIfPresent(Shake.self, forKey: .data)
        let versions = try nestedContainer.decodeIfPresent([ShakeHistoryVersion].self, forKey: .versions)
        
        self.shake = shake
        self.versions = versions
    }
}
