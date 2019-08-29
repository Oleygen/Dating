//
//  MenuCoordinator.swift
//  Dating
//
//  Created by Gennady  Oleynik  on 8/29/19.
//  Copyright © 2019 Gennady  Oleynik . All rights reserved.
//

import Foundation
import UIKit
final class MenuCoordinator: TabbedCoordinator, MenuCoordinatorOutput {
    
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
            showMenuScreen()
        }
    }
    
    private func showMenuScreen() {
        let menuInputHandler = ModuleFactory.createMenuScreen()
        router.setRootModule(menuInputHandler)
    }
  
    
    deinit {
        print(#function)
    }
    
}
