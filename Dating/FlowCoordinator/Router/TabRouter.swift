//
//  TabRouter.swift
//  loc
//
//  Created by oleygen ua on 2/13/19.
//  Copyright © 2019 oleygen. All rights reserved.
//

import Foundation
import UIKit

class TabRouter: Router {
    var presenterContext: UIViewController {
        return rootController
    }
    
    var rootController: UITabBarController
    
    required init(rootController: UITabBarController) {
        self.rootController = rootController
    }
    
    typealias ControllerType = UITabBarController
}
