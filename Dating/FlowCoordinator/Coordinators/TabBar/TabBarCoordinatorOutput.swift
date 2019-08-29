//
//  TabBarCoordinatorOutput.swift
//  loc
//
//  Created by Oleynik Gennady on 09/04/2019.
//  Copyright © 2019 oleygen. All rights reserved.
//

import Foundation

protocol TabBarCoordinatorOutput: class {
    var onUnauthorize: (() -> Void)? { get set }
}
