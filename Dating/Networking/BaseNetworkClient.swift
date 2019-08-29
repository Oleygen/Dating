//
//  BaseNetworkClient.swift
//  loc
//
//  Created by oleygen ua on 2/8/19.
//  Copyright © 2019 oleygen. All rights reserved.
//

import Foundation

class BaseNetworkClient: NSObject {
    
    let idDecoder: (Decodable) -> ResponseModelWithId = { decodable in
        return decodable as! ResponseModelWithId
    }
    
    internal let worker: NetworkWorker = NetworkWorker()
}
