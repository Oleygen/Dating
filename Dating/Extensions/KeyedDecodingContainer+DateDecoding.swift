//
//  KeyedDecodingContainer+DateDecoding.swift
//  loc
//
//  Created by Oleynik Gennady on 01/04/2019.
//  Copyright © 2019 oleygen. All rights reserved.
//

import Foundation

public extension KeyedDecodingContainer {
    func decode(_ type: Date.Type, forKey key: Key) throws -> Date {
        let dateString = try self.decode(String.self, forKey: key)
        let dateFormatter = DateFormatter.serverFormat
        guard let date = dateFormatter.date(from: dateString) else {
            let context = DecodingError.Context(codingPath: codingPath,
                                                debugDescription: "Could not parse json key to a Date")
            throw DecodingError.dataCorrupted(context)
        }
        return date
    }
    
    func decodeIfPresent(_ type: Date.Type, forKey key: Key) throws -> Date? {
        guard let dateString = try self.decodeIfPresent(String.self, forKey: key) else {
            return nil
        }
        
        if dateString == "" {
            return nil
        }
        
        let dateFormatter = DateFormatter.serverFormat
        guard let date = dateFormatter.date(from: dateString) else {
            let context = DecodingError.Context(codingPath: codingPath,
                                                debugDescription: "Could not parse json key to a Date")
            throw DecodingError.dataCorrupted(context)
        }
        return date
    }
}
