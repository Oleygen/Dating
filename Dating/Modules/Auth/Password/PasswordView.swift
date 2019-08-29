//
//  PasswordView.swift
//  Dating
//
//  Created by Gennady  Oleynik  on 8/29/19.
//  Copyright © 2019 Gennady  Oleynik . All rights reserved.
//

import Foundation
import UIKit

class PasswordView: FullScreenView {
    var passwordLabel: UILabel!
    var passwordTextField: UITextField!
    var finishButton: UIButton!
    
    override init() {
        super.init()
        self.backgroundColor = UIColor.white
        
        self.passwordLabel = UILabel(frame: .zero)
        self.passwordLabel.text = "Choose password"
        self.passwordLabel.textColor = UIColor.black
        self.passwordLabel.font = UIFont.systemFont(ofSize: 25)
        self.addSubview(self.passwordLabel)
        
        self.passwordLabel.snp.makeConstraints { maker in
            maker.top.equalToSuperview().offset(80)
            maker.centerX.equalToSuperview()
        }
        
        self.passwordTextField = UITextField(frame: .zero)
        passwordTextField.placeholder = "Enter your password"
        passwordTextField.isSecureTextEntry = true
        passwordTextField.textContentType = .password
        self.addSubview(passwordTextField)
        
        passwordTextField.snp.makeConstraints { (maker) in
            maker.top.equalTo(passwordLabel.snp.bottom).offset(20)
            maker.left.equalToSuperview().offset(20)
            maker.right.equalToSuperview().offset(-20)
            maker.height.equalTo(50)
        }
        
        
        self.finishButton = UIButton(frame: .zero)
        finishButton.setTitle("Finish", for: .normal)
        finishButton.setTitleColor(UIColor.white, for: .normal)
        finishButton.backgroundColor = UIColor.red.withAlphaComponent(0.5)
        finishButton.titleLabel?.textAlignment = .center
        
        
        self.addSubview(finishButton)
        
        
        finishButton.snp.makeConstraints { (maker) in
            maker.bottom.equalToSuperview().offset(-20)
            maker.left.equalToSuperview().offset(20)
            maker.right.equalToSuperview().offset(-20)
            maker.height.equalTo(50)
        }
        
        
        finishButton.layer.cornerRadius = 8
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
