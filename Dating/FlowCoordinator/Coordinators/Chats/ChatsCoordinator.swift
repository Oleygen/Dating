//
//  ChatsCoordinator.swift
//  Dating
//
//  Created by Gennady  Oleynik  on 8/29/19.
//  Copyright © 2019 Gennady  Oleynik . All rights reserved.
//

import Foundation
import UIKit

final class ChatsCoordinator: TabbedCoordinator, ChatsCoordinatorOutput {
    
    func start(with deeplinkOption: DeepLinkOption?) {
        //TODO: to implement
    }
    
    init() {
        self.router = NavigationRouter()
    }
    
    var rootController: UIViewController {
        return router.rootController
    }
    
    private let router: NavigationRouter
    
    func start() {
        if self.router.rootController.viewControllers.isEmpty {
            showChatsScreen()
        }
    }
    
    private func showChatsScreen() {
        let chatsInputHandler = ModuleFactory.createChatsScreen()
        router.setRootModule(chatsInputHandler)
    }
    
    
    deinit {
        print(#function)
    }
    
}
