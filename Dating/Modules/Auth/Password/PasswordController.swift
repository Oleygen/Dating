//
//  PasswordController.swift
//  Dating
//
//  Created by Gennady  Oleynik  on 8/29/19.
//  Copyright © 2019 Gennady  Oleynik . All rights reserved.
//

import Foundation
import UIKit

class PasswordController: BaseController<PasswordView, PasswordModel>, PasswordInputHandler {
    var onFinishTap: (() -> Void)?
    
    override func viewDidLoad() {
        self.shouldShowBackButton = true
        super.viewDidLoad()
        
        self.baseView.finishButton.addTarget(self, action: #selector(didClickFinishButton), for: .touchUpInside)
        let gesture = UITapGestureRecognizer(target: self, action: #selector(didTapBaseView))
        self.view.addGestureRecognizer(gesture)
        
    }
    
    
    @objc func didClickFinishButton() {
        self.onFinishTap?()
    }
    @objc func didTapBaseView() {
        self.view.endEditing(true)
    }
}
