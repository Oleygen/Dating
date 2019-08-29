//
//  TabbedCoordinator.swift
//  loc
//
//  Created by oleygen ua on 2/13/19.
//  Copyright © 2019 oleygen. All rights reserved.
//

import Foundation
import UIKit
protocol TabbedCoordinator: Coordinator {
    var rootController: UIViewController { get } // to embed into tabCoordinator
}
