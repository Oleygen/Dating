//
//  NameInputHandler.swift
//  Dating
//
//  Created by Gennady  Oleynik  on 8/29/19.
//  Copyright © 2019 Gennady  Oleynik . All rights reserved.
//

import Foundation

protocol NameInputHandler: TransitionInputHandler {
    var onContinueTap: (() -> Void)? { get set }
}
