//
//  Task.swift
//  loc
//
//  Created by oleygen ua on 1/24/19.
//  Copyright © 2019 oleygen. All rights reserved.
//

import Foundation

/// Represents an HTTP task.
public enum Task {
    
    /// A request with no additional data.
    case requestPlain
    
    /// A requests body set with data.
    case requestData(Data)
    
//    /// A request body set with `Encodable` type
//    case requestJSONEncodable(Encodable)
//    
//    /// A request body set with `Encodable` type and custom encoder
//    case requestCustomJSONEncodable(Encodable, encoder: JSONEncoder)
//    
//    /// A requests body set with data, combined with url parameters.
//    case requestCompositeData(bodyData: Data, urlParameters: [String: Any])
    
    /// A file upload task.
    case uploadFile(URL)
    
}
