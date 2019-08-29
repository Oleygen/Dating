//
//  NavigationRouter.swift
//  loc
//
//  Created by oleygen ua on 2/13/19.
//  Copyright © 2019 oleygen. All rights reserved.
//

import Foundation
import UIKit

class NavigationRouter: Router {
    
    typealias ControllerType = UINavigationController

    required init(rootController: UINavigationController = UINavigationController()) {
        self.rootController = rootController
    }
    
    let rootController: UINavigationController

    var presenterContext: UIViewController {
        return self.rootController
    }

    
    func push(_ module: Presentable?, animated: Bool = true, completion: CoordinatorCompletionBlock? = nil) {
        guard let controller = module?.toPresent else { return }

        rootController.pushViewController(controller, animated: animated)
    }
    
    func popModule(animated: Bool = true) {
        rootController.popViewController(animated: animated)
    }
    
    func setRootModule(_ module: Presentable?, animated: Bool = true) {
        guard let controller = module?.toPresent else { return }
        rootController.setViewControllers([controller], animated: animated)
    }
    
    func popToRootModule(animated: Bool) {
        rootController.popToRootViewController(animated: animated)
    }
}
