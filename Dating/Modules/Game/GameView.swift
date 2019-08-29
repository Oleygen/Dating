//
//  GameView.swift
//  Dating
//
//  Created by Gennady  Oleynik  on 8/29/19.
//  Copyright © 2019 Gennady  Oleynik . All rights reserved.
//

import Foundation
import UIKit

class GameView: FullScreenView {
    var gameLabel: UILabel!
    
    override init () {
        super.init()
        self.backgroundColor = UIColor.brown.withAlphaComponent(0.2)
        
        gameLabel = UILabel(frame: .zero)
        gameLabel.text = "GAME SCREEN"
        gameLabel.textColor = self.tintColor

        self.addSubview(gameLabel)
        
        gameLabel.snp.makeConstraints { maker in
            maker.center.equalToSuperview()
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
