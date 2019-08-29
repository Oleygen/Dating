//
//  BirthdayController.swift
//  Dating
//
//  Created by Gennady  Oleynik  on 8/29/19.
//  Copyright © 2019 Gennady  Oleynik . All rights reserved.
//

import Foundation

class BirthdayController: BaseController<BirthdayView, BirthdayModel>, BirthdayInputHandler {
    var onContinueTap: (() -> Void)?

    override func viewDidLoad() {
        self.shouldShowBackButton = true
        super.viewDidLoad()
        
        self.baseView.continueButton.addTarget(self, action: #selector(didClickContinueButton), for: .touchUpInside)
    }
    
    @objc func didClickContinueButton() {
        self.onContinueTap?()
    }
}
