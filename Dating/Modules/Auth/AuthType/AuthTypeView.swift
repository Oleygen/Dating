//
//  AuthTypeView.swift
//  Dating
//
//  Created by Gennady  Oleynik  on 8/29/19.
//  Copyright © 2019 Gennady  Oleynik . All rights reserved.
//

import Foundation
import UIKit

class AuthTypeView: FullScreenView {
    var meetLabel: UILabel!
    var loginButton: UIButton!
    var registerButton: UIButton!
    
    override init() {
        super.init()
        self.backgroundColor = UIColor.white
        
        self.meetLabel = UILabel(frame: .zero)
        self.meetLabel.text = "Hello there!"
        self.meetLabel.textColor = UIColor.black
        self.meetLabel.font = UIFont.systemFont(ofSize: 25)
        self.addSubview(self.meetLabel)
        
        self.meetLabel.snp.makeConstraints { maker in
            maker.top.equalToSuperview().offset(80)
            maker.centerX.equalToSuperview()
        }
        
        self.loginButton = UIButton(frame: .zero)
        loginButton.setTitle("Login", for: .normal)
        loginButton.setTitleColor(UIColor.black, for: .normal)
        loginButton.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        loginButton.titleLabel?.textAlignment = .center
        
        self.registerButton = UIButton(frame: .zero)
        registerButton.setTitle("Register", for: .normal)
        registerButton.setTitleColor(UIColor.black, for: .normal)
        registerButton.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        registerButton.titleLabel?.textAlignment = .center
        
        self.addSubview(loginButton)
        self.addSubview(registerButton)
        
        loginButton.snp.makeConstraints { maker in
            maker.top.equalTo(meetLabel.snp.bottom).offset(20)
            maker.left.equalToSuperview()
            maker.right.equalTo(registerButton.snp.left)
            maker.height.equalTo(150)
        }
        
        registerButton.snp.makeConstraints { maker in
            maker.top.equalTo(meetLabel.snp.bottom).offset(20)
            maker.right.equalToSuperview()
            maker.height.equalTo(150)
            maker.width.equalTo(loginButton.snp.width)
        }
        
        loginButton.layer.cornerRadius = 8
        registerButton.layer.cornerRadius = 8
        
        loginButton.layer.borderColor = UIColor.black.cgColor
        loginButton.layer.borderWidth = 2
        
        registerButton.layer.borderColor = UIColor.black.cgColor
        registerButton.layer.borderWidth = 2
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
