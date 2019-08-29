//
//  GetShakeWithCodeResponseModel.swift
//  loc
//
//  Created by oleygen ua on 2/21/19.
//  Copyright © 2019 oleygen. All rights reserved.
//

import Foundation

class GetShakeWithCodeResponseModel: Decodable {
    let shake: Shake
    
    enum CodingKeys: String, CodingKey {
        case data
        case creatorId
        case id
        case templateId
        case text
        case title
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let data = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .data)
        
        let creatorId = try data.decode(Int.self, forKey: .creatorId)
        let id = try data.decode(Int.self, forKey: .id)
        
        let text = try data.decode(String.self, forKey: .text)
        let title = try data.decode(String.self, forKey: .title)
        
        let templateId = try data.decodeIfPresent(Int.self, forKey: .templateId)
       
        #warning ("TODO DATE")
        
        self.shake = try Shake(shakeId: id, creatorId: creatorId, edits: "", templateId: templateId, text: text, title: title, creationDate: nil)
    }
}
