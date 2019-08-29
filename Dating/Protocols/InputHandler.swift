//
//  InputHandler.swift
//  loc
//
//  Created by oleygen ua on 1/22/19.
//  Copyright © 2019 oleygen. All rights reserved.
//

import Foundation

protocol InputHandler: NSObjectProtocol, Presentable {}

protocol TransitionInputHandler: InputHandler {
    var onBackButtonTap: (() -> Void)? { get set }
    var onCloseButtonTap: (() -> Void)? { get set }
    var onDrawerButtonTap: (() -> Void)? { get set }
}
