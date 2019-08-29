//
//  TabBarController.swift
//  loc
//
//  Created by Oleynik Gennady on 12/02/2019.
//  Copyright © 2019 oleygen. All rights reserved.
//

import Foundation
import UIKit



class TabBarController: UITabBarController, TabBarInputHandler, UITabBarControllerDelegate {
    
    var onSearchSwitch: (() -> Void)?
    var onGameSwitch: (() -> Void)?
    var onChatsSwitch: (() -> Void)?
    var onMenuSwitch: (() -> Void)?
    
    var onSearchTap: (() -> Bool)?
    var onGameTap: (() -> Bool)?
    var onChatsTap: (() -> Bool)?
    var onMenuTap: (() -> Bool)?
    
    // MARK: - UITabBarControllerDelegate
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        
    }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        guard let tabBarItem = TabBarItems(rawValue: selectedIndex) else { return }
        switch tabBarItem {
            
        case .search:
            onSearchSwitch?()
            
        case .game:
            onGameSwitch?()

        case .chats:
            onChatsSwitch?()
    
        case .menu:
            onMenuSwitch?()
        }
    }
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        let newIndex = viewController.tabBarItem.tag
        guard let tabBarItem = TabBarItems(rawValue: newIndex) else { return false }
        
        switch tabBarItem {
            
        case .search:
            return onSearchTap?() ?? true
        
        case .game:
            return onGameTap?() ?? true
            
        case .chats:
            return onChatsTap?() ?? true
            
        case .menu:
            return onMenuTap?() ?? true
        }
    }
    
}
