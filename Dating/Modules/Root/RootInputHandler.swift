//
//  RootInputHandler.swift
//  loc
//
//  Created by oleygen ua on 2/8/19.
//  Copyright © 2019 oleygen. All rights reserved.
//

import Foundation

protocol RootInputHandler: InputHandler {
    var onViewLoad: (()->Void)? { get set }
}
