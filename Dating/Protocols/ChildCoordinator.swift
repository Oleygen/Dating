//
//  ChildCoordinator.swift
//  loc
//
//  Created by oleygen ua on 2/8/19.
//  Copyright © 2019 oleygen. All rights reserved.
//

import Foundation

protocol ChildCoordinator: Coordinator {
    var presenter: Presenter { get }
    
    init (presenter: Presenter)
}
