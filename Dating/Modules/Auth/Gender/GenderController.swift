//
//  GenderController.swift
//  Dating
//
//  Created by Gennady  Oleynik  on 8/29/19.
//  Copyright © 2019 Gennady  Oleynik . All rights reserved.
//

import Foundation

class GenderController: BaseController<GenderView, GenderModel>, GenderInputHandler {
    var onPickGender: ((Gender) -> ())?
    override func viewDidLoad() {
        self.shouldShowBackButton = true
        super.viewDidLoad()
        
        self.baseView.femaleButton.addTarget(self, action: #selector(didClickFemaleButton), for: .touchUpInside)
        self.baseView.maleButton.addTarget(self, action: #selector(didClickMaleButton), for: .touchUpInside)
    }
    
    
    @objc func didClickFemaleButton() {
        self.onPickGender?(.female)
    }
    
    @objc func didClickMaleButton() {
        self.onPickGender?(.male)
    }
}
