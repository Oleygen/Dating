//
//  Router.swift
//  loc
//
//  Created by oleygen ua on 1/22/19.
//  Copyright © 2019 oleygen. All rights reserved.
//

import Foundation
import UIKit

protocol Router: Presenter {
    associatedtype ControllerType: UIViewController
    var rootController: ControllerType { get }
    
    init(rootController: ControllerType)
}

extension Router {
    func present(_ module: Presentable?, animated: Bool = true, completion: CoordinatorCompletionBlock? = nil) {
        guard let controller = module?.toPresent else { return }
        rootController.present(controller, animated: animated, completion: completion)
    }
    
    func dismissModule(animated: Bool = true, completion: CoordinatorCompletionBlock? = nil) {
        rootController.dismiss(animated: animated, completion: completion)
    }
}
