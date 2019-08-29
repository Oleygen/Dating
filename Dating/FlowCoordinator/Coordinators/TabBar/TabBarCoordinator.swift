//
//  TabBarCoordinator.swift
//  loc
//
//  Created by oleygen ua on 2/12/19.
//  Copyright © 2019 oleygen. All rights reserved.
//

import Foundation
import UIKit

enum TabBarItems: Int {
    case search = 0
    case game = 1
    case chats = 2
    case menu = 3
}

final class TabBarCoordinator: Coordinator, TabBarCoordinatorOutput {
    var onUnauthorize: (() -> Void)?
    
    private var tabBarPrepared = false
    
    weak private var window: UIWindow?
    private let router: TabRouter
    
    var tabController: TabBarController {
        return router.rootController as! TabBarController
    }
    
    var searchCoordinator: SearchCoordinator!
    var gameCoordinator: GameCoordinator!
    var chatsCoordinator: ChatsCoordinator!
    var menuCoordinator: MenuCoordinator!
    
    init(window: UIWindow) {
        self.window = window
        self.router = TabRouter(rootController: TabBarController())
    }
    
    func start() {
        self.start(with: nil)
    }
    
    func start(with deeplinkOption: DeepLinkOption?) {
        window?.rootViewController = router.rootController
        
        if (!tabBarPrepared) {
            self.prepareTabBar()
            tabBarPrepared = true
        }
        
        
        runMenuFlow()
        
    }
    
    private func prepareTabBar() {
        
        self.searchCoordinator = CoordinatorFactory.makeSearchCoordinator() as! SearchCoordinator
        searchCoordinator.rootController.tabBarItem = UITabBarItem(title: "search", image: UIImage(named: "placeholder_icon"), tag: 0)
        
        self.gameCoordinator = CoordinatorFactory.makeGameCoordinator() as! GameCoordinator
        gameCoordinator.rootController.tabBarItem = UITabBarItem(title: "game", image: UIImage(named: "placeholder_icon"), tag: 1)
        
        self.chatsCoordinator = CoordinatorFactory.makeChatsCoordinator() as! ChatsCoordinator
        chatsCoordinator.rootController.tabBarItem = UITabBarItem(title: "chats", image: UIImage(named: "placeholder_icon"), tag: 2)
        
        self.menuCoordinator = CoordinatorFactory.makeMenuCoordinator() as! MenuCoordinator
        menuCoordinator.rootController.tabBarItem = UITabBarItem(title: "menu", image: UIImage(named: "placeholder_icon"), tag: 3)
        
        
//        dashboardCoordinator.onStartShakeTap = { [weak self] in
//            self?.runCreateShakeFlow()
//        }
//
//
//        settingsCoordinator.onLogout = { [weak self] in
//            self?.onUnauthorize?()
//        }
        
        tabController.viewControllers = [
            searchCoordinator.rootController,
            gameCoordinator.rootController,
            chatsCoordinator.rootController,
            menuCoordinator.rootController
        ]
    
    
        
        tabController.onSearchSwitch = { [weak self] in
            self?.runSearchFlow()
        }
        
        tabController.onGameSwitch = { [weak self] in
            self?.runGameFlow()
        }
        
        tabController.onChatsSwitch = { [weak self] in
            self?.runChatsFlow()
        }
        
        tabController.onMenuSwitch = { [weak self] in
            self?.runMenuFlow()
        }
    }
    
    private func runSearchFlow() {
        self.tabController.selectedIndex = TabBarItems.search.rawValue
        searchCoordinator.start()
    }
    
    private func runGameFlow() {
        self.tabController.selectedIndex = TabBarItems.game.rawValue
        gameCoordinator.start()
    }
    
    private func runChatsFlow() {
        self.tabController.selectedIndex = TabBarItems.chats.rawValue
        chatsCoordinator.start()
    }
    
    private func runMenuFlow() {
        self.tabController.selectedIndex = TabBarItems.menu.rawValue
        menuCoordinator.start()
    }
    
    
    private func runFlow(item: TabBarItems) {
        switch item {
            
        case .search:
            runSearchFlow()
        case .game:
            runGameFlow()
        case .chats:
            runChatsFlow()
        case .menu:
            runMenuFlow()
        }
    }
    
    deinit {
        print(#function)
        print(#file)
    }
}

