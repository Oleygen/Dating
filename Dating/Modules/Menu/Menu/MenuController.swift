//
//  MenuController.swift
//  Dating
//
//  Created by Gennady  Oleynik  on 8/29/19.
//  Copyright © 2019 Gennady  Oleynik . All rights reserved.
//

import Foundation

class MenuController : BaseController<MenuView, MenuModel>, MenuInputHandler {
    
    var onEditProfileTap: (()->())?
    
    override func viewDidLoad() {
        self.shouldShowBackButton = false        
        super.viewDidLoad()
        self.baseView.editProfileButton.addTarget(self, action: #selector(didClickEditProfileButton), for: .touchUpInside)
    }
    
    @objc func didClickEditProfileButton() {
        self.onEditProfileTap?()
    }
}
