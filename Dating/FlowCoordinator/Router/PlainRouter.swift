//
//  PlainRouter.swift
//  loc
//
//  Created by oleygen ua on 2/13/19.
//  Copyright © 2019 oleygen. All rights reserved.
//

import Foundation
import UIKit

class PlainRouter: Router {

    var rootController: UIViewController
    
    required init(rootController: UIViewController = UIViewController()) {
        self.rootController = rootController
    }
    
    typealias ControllerType = UIViewController
    
    var presenterContext: UIViewController {
        return self.rootController
    }
    
}
