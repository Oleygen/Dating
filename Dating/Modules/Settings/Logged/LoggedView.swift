//
//  LoggedView.swift
//  loc
//
//  Created by oleygen ua on 2/13/19.
//  Copyright © 2019 oleygen. All rights reserved.
//

import Foundation
import UIKit

class LoggedView: FullScreenView {
    var usernameLabel: UILabel!
    var userIdLabel: UILabel!
    var logoutButton: UIButton!
    var stripeButton: UIButton!
    
    override init () {
        super.init()
        self.backgroundColor = UIColor.white
        
        usernameLabel = UILabel(frame: .zero)
        usernameLabel.font = titleTextFont
        self.addSubview(usernameLabel)
        usernameLabel.snp.makeConstraints { maker in
            maker.centerX.equalToSuperview()
            maker.top.equalTo(self.snp.topMargin).offset(20)
        }
        
        userIdLabel = UILabel(frame: .zero)
        userIdLabel.font = titleTextFont
        self.addSubview(userIdLabel)
        userIdLabel.snp.makeConstraints { maker in
            maker.centerX.equalToSuperview()
            maker.topMargin.equalTo(usernameLabel.snp.bottom).offset(20)
        }
        
   
        logoutButton = UIButton(frame: .zero)
        logoutButton.setTitle("Log out", for: .normal)
        logoutButton.setTitleColor(self.tintColor, for: .normal)
        self.addSubview(logoutButton)
        logoutButton.snp.makeConstraints { maker in
            maker.topMargin.equalTo(userIdLabel.snp.bottom).offset(20)
            maker.width.equalTo(150)
            maker.height.equalTo(50)
            maker.centerX.equalToSuperview()
        }
        
        stripeButton = UIButton(frame: .zero)
        stripeButton.setTitle("Stripe", for: .normal)
        stripeButton.setTitleColor(self.tintColor, for: .normal)
        self.addSubview(stripeButton)
        stripeButton.snp.makeConstraints { maker in
            maker.topMargin.equalTo(logoutButton.snp.bottom).offset(20)
            maker.width.equalTo(150)
            maker.height.equalTo(50)
            maker.centerX.equalToSuperview()
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
   
}
