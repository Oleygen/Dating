//
//  NameView.swift
//  Dating
//
//  Created by Gennady  Oleynik  on 8/29/19.
//  Copyright © 2019 Gennady  Oleynik . All rights reserved.
//

import Foundation
import UIKit

class NameView: FullScreenView {
    var nameLabel: UILabel!
    var nameTextField: UITextField!
    var continueButton: UIButton!
    
    override init() {
        super.init()
        self.backgroundColor = UIColor.white
        
        self.nameLabel = UILabel(frame: .zero)
        self.nameLabel.text = "What's your name?"
        self.nameLabel.textColor = UIColor.black
        self.nameLabel.font = UIFont.systemFont(ofSize: 25)
        self.addSubview(self.nameLabel)
        
        self.nameLabel.snp.makeConstraints { maker in
            maker.top.equalToSuperview().offset(80)
            maker.centerX.equalToSuperview()
        }
        
        self.nameTextField = UITextField(frame: .zero)
        nameTextField.placeholder = "This name will be shown in my profile"
        nameTextField.textContentType = .name
        self.addSubview(nameTextField)
        
        nameTextField.snp.makeConstraints { (maker) in
            maker.top.equalTo(nameLabel.snp.bottom).offset(20)
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
