//
//  UnloggedInputHandler.swift
//  loc
//
//  Created by oleygen ua on 2/13/19.
//  Copyright © 2019 oleygen. All rights reserved.
//

import Foundation

protocol UnloggedInputHandler: TransitionInputHandler {
    var onLoginTap: (() -> Void)? { get set }
}
