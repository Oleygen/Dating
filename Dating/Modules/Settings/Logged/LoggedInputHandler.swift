//
//  LoggedInputHandler.swift
//  loc
//
//  Created by oleygen ua on 2/13/19.
//  Copyright © 2019 oleygen. All rights reserved.
//

import Foundation

protocol LoggedInputHandler: TransitionInputHandler {
    var onLogoutTap: (() -> Void)? { get set }
    var onStripeTap: (() -> Void)? { get set }
}
