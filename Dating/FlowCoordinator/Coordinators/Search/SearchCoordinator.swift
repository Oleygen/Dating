//
//  SearchCoordinator.swift
//  Dating
//
//  Created by Gennady  Oleynik  on 8/29/19.
//  Copyright © 2019 Gennady  Oleynik . All rights reserved.
//

import Foundation
import UIKit

final class SearchCoordinator: TabbedCoordinator, SearchCoordinatorOutput {
    
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
            showSearchScreen()
        }
    }
    
    private func showSearchScreen() {
        let searchInputHandler = ModuleFactory.createSearchScreen()
        router.setRootModule(searchInputHandler)
    }
    
    
    deinit {
        print(#function)
    }
    
}
