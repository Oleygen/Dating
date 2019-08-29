//
//  TabBarInputHandler.swift
//  loc
//
//  Created by Oleynik Gennady on 12/02/2019.
//  Copyright © 2019 oleygen. All rights reserved.
//

import Foundation

protocol TabBarInputHandler: InputHandler {
    
    var onSearchSwitch: (() -> Void)? { get set }
    var onGameSwitch: (() -> Void)? { get set }
    var onChatsSwitch: (() -> Void)? { get set }
    var onMenuSwitch: (() -> Void)? { get set }
    
    var onSearchTap: (() -> Bool)? { get set }
    var onGameTap: (() -> Bool)? { get set }
    var onChatsTap: (() -> Bool)? { get set }
    var onMenuTap: (() -> Bool)? { get set }

}
