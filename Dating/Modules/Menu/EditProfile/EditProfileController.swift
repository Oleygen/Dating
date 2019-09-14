//
//  EditProfileController.swift
//  Dating
//
//  Created by Gennady  Oleynik  on 9/4/19.
//  Copyright © 2019 Gennady  Oleynik . All rights reserved.
//

import Foundation

class EditProfileController: BaseController<EditProfileView, EditProfileModel>, EditProfileInputHandler {
    
    override func viewDidLoad() {
        self.shouldShowBackButton = true
        super.viewDidLoad()
    }
    
}
