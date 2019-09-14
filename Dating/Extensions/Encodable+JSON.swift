//
//  Encodable+JSON.swift
//  Dating
//
//  Created by Gennady  Oleynik  on 8/31/19.
//  Copyright © 2019 Gennady  Oleynik . All rights reserved.
//

import Foundation

extension Encodable {
    func toJSONData() throws -> Data {
        do {
            return try JSONEncoder().encode(self)
        } catch {
            throw NetworkError.encodingFailed
        }
        
    }
}
