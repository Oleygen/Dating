//
//  Presenter.swift
//  loc
//
//  Created by oleygen ua on 2/8/19.
//  Copyright © 2019 oleygen. All rights reserved.
//

import Foundation
import UIKit

protocol Presenter: class {
    var presenterContext: UIViewController { get }
    func present(_ module: Presentable?, animated: Bool, completion: CoordinatorCompletionBlock?)
    func dismissModule(animated: Bool, completion: CoordinatorCompletionBlock?) 
}
