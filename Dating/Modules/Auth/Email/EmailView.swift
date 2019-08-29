//
//  EmailView.swift
//  Dating
//
//  Created by Gennady  Oleynik  on 8/29/19.
//  Copyright © 2019 Gennady  Oleynik . All rights reserved.
//

import Foundation
import UIKit

class EmailView: FullScreenView {
    var emailLabel: UILabel!
    var emailTextField: UITextField!
    var continueButton: UIButton!
    
    override init() {
        super.init()
        self.backgroundColor = UIColor.white
        
        self.emailLabel = UILabel(frame: .zero)
        self.emailLabel.text = "What's your email?"
        self.emailLabel.textColor = UIColor.black
        self.emailLabel.font = UIFont.systemFont(ofSize: 25)
        self.addSubview(self.emailLabel)
        
        self.emailLabel.snp.makeConstraints { maker in
            maker.top.equalToSuperview().offset(80)
            maker.centerX.equalToSuperview()
        }
        
        self.emailTextField = UITextField(frame: .zero)
        emailTextField.placeholder = "Enter your email"
        emailTextField.textContentType = .emailAddress
        self.addSubview(emailTextField)
        
        emailTextField.snp.makeConstraints { (maker) in
            maker.top.equalTo(emailLabel.snp.bottom).offset(20)
            maker.left.equalToSuperview().offset(20)
            maker.right.equalToSuperview().offset(-20)
            maker.height.equalTo(50)
        }
        
        
        self.continueButton = UIButton(frame: .zero)
        continueButton.setTitle("Continue", for: .normal)
        continueButton.setTitleColor(UIColor.white, for: .normal)
        continueButton.backgroundColor = UIColor.red.withAlphaComponent(0.5)
        continueButton.titleLabel?.textAlignment = .center
        
        
        self.addSubview(continueButton)
        
        
        continueButton.snp.makeConstraints { (maker) in
            maker.bottom.equalToSuperview().offset(-20)
            maker.left.equalToSuperview().offset(20)
            maker.right.equalToSuperview().offset(-20)
            maker.height.equalTo(50)
        }
        
        
        continueButton.layer.cornerRadius = 8
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
