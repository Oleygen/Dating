//
//  MenuController.swift
//  Dating
//
//  Created by Gennady  Oleynik  on 8/29/19.
//  Copyright © 2019 Gennady  Oleynik . All rights reserved.
//

import Foundation

class MenuController : BaseController<MenuView, MenuModel>, MenuInputHandler {
    override func viewDidLoad() {
        self.shouldShowBackButton = false        
        super.viewDidLoad()
    }
}
