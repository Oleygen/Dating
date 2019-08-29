//
//  UnloggedView.swift
//  loc
//
//  Created by oleygen ua on 2/13/19.
//  Copyright © 2019 oleygen. All rights reserved.
//

import Foundation
import UIKit

class UnloggedView: FullScreenView {
    var loginButton: UIButton!
    
    override init () {
        super.init()
        self.backgroundColor = UIColor.white
        
        loginButton = UIButton(frame: .zero)
        loginButton.setTitle("Authorize", for: .normal)
        loginButton.setTitleColor(self.tintColor, for: .normal)
        self.addSubview(loginButton)
        loginButton.snp.makeConstraints { maker in
            maker.topMargin.equalTo(self.snp.topMargin).offset(20)
            maker.width.equalTo(150)
            maker.height.equalTo(50)
            maker.centerX.equalToSuperview()
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
