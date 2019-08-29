//
//  NetworkingModel.swift
//  loc
//
//  Created by oleygen ua on 2/8/19.
//  Copyright © 2019 oleygen. All rights reserved.
//

import Foundation

/// NetworkingModel is a model class with a use of network service. Specify NetworkingClient with generic mechanism
open class NetworkingModel<N>: BaseModel {
    private var _networkClient: BaseNetworkClient
    
    var networkClient: N {
        get {
            return _networkClient as! N
        }
    }
    
    init(networkingClient: BaseNetworkClient) {
        self._networkClient = networkingClient
    }
}
