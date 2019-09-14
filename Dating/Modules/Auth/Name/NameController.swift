//
//  NameController.swift
//  Dating
//
//  Created by Gennady  Oleynik  on 8/29/19.
//  Copyright © 2019 Gennady  Oleynik . All rights reserved.
//

import Foundation
import UIKit

class NameController: BaseController<NameView, NameModel>, NameInputHandler {
    var onChooseName: ((String) -> Void)?
    override func viewDidLoad() {
        self.shouldShowBackButton = true
        super.viewDidLoad()
        
        self.baseView.continueButton.addTarget(self, action: #selector(didClickContinueButton), for: .touchUpInside)
        let gesture = UITapGestureRecognizer(target: self, action: #selector(didTapBaseView))
        self.view.addGestureRecognizer(gesture)
        
    }
    
    @objc func didClickContinueButton() {
        self.onChooseName?(self.baseView.nameTextField.text!)
    }
    @objc func didTapBaseView() {
        self.view.endEditing(true)
    }
}
