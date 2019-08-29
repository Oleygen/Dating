//
//  RegisterInputHandler.swift
//  loc
//
//  Created by oleygen ua on 1/22/19.
//  Copyright © 2019 oleygen. All rights reserved.
//

import Foundation

protocol RegisterInputHandler: TransitionInputHandler {
    
    var onSignUpComplete: (() -> Void)? { get set }
    
}
