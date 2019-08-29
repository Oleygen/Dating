//
//  MenuView.swift
//  Dating
//
//  Created by Gennady  Oleynik  on 8/29/19.
//  Copyright © 2019 Gennady  Oleynik . All rights reserved.
//

import Foundation
import UIKit

class MenuView: FullScreenView {
    var menuLabel: UILabel!
    
    override init () {
        super.init()
        self.backgroundColor = UIColor.green.withAlphaComponent(0.2)
        
        menuLabel = UILabel(frame: .zero)
        menuLabel.text = "MENU SCREEN"
        menuLabel.textColor = self.tintColor
        
        self.addSubview(menuLabel)
        
        menuLabel.snp.makeConstraints { maker in
            maker.center.equalToSuperview()
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
