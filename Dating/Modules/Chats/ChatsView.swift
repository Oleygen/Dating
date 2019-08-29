//
//  ChatsView.swift
//  Dating
//
//  Created by Gennady  Oleynik  on 8/29/19.
//  Copyright © 2019 Gennady  Oleynik . All rights reserved.
//

import Foundation
import UIKit

class ChatsView: FullScreenView {
    var chatsLabel: UILabel!
    
    override init () {
        super.init()
        self.backgroundColor = UIColor.red.withAlphaComponent(0.2)
        
        chatsLabel = UILabel(frame: .zero)
        chatsLabel.text = "CHATS SCREEN"
        chatsLabel.textColor = self.tintColor
        
        self.addSubview(chatsLabel)
        
        chatsLabel.snp.makeConstraints { maker in
            maker.center.equalToSuperview()
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
