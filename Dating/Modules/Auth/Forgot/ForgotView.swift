//
//  ForgotView.swift
//  loc
//
//  Created by oleygen ua on 2/8/19.
//  Copyright © 2019 oleygen. All rights reserved.
//

import Foundation
import UIKit

class ForgotView: FullScreenView {
    var emailTextField: UITextField!
    var sendButton: UIButton!    
    
    override init() {
        super.init()
        self.backgroundColor = UIColor.white
        
        emailTextField = UITextField(frame: .zero)
        emailTextField.font = titleTextFont
        emailTextField.placeholder = "Enter your email"
        emailTextField.textContentType = UITextContentType.emailAddress
        emailTextField.autocapitalizationType = .none
        self.addSubview(emailTextField)
        emailTextField.snp.makeConstraints { maker in
            maker.topMargin.equalToSuperview().offset(20)
            maker.width.equalTo(250)
            maker.centerX.equalToSuperview()
        }
        
        sendButton = UIButton(frame: .zero)
        sendButton.setTitle("Send", for: .normal)
        sendButton.setTitleColor(self.tintColor, for: .normal)
        self.addSubview(sendButton)
        sendButton.snp.makeConstraints { maker in
            maker.topMargin.equalTo(emailTextField.snp.bottom).offset(20)
            maker.width.equalTo(150)
            maker.height.equalTo(50)
            maker.centerX.equalToSuperview()
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setInvalidEmailField() {
        self.emailTextField.backgroundColor = invalidBackgroundColor
    }
    
    func setValidEmailField() {
        self.emailTextField.backgroundColor = validBackgroundColor
    }
}
