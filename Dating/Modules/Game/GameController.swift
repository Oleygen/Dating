//
//  GameController.swift
//  Dating
//
//  Created by Gennady  Oleynik  on 8/29/19.
//  Copyright © 2019 Gennady  Oleynik . All rights reserved.
//

import Foundation

class GameController: BaseController<GameView, GameModel>, GameInputHandler {
    override func viewDidLoad() {
        self.shouldShowBackButton = false
        super.viewDidLoad()
    }
}
