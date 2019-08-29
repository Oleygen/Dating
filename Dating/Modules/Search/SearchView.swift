//
//  SearchView.swift
//  Dating
//
//  Created by Gennady  Oleynik  on 8/29/19.
//  Copyright © 2019 Gennady  Oleynik . All rights reserved.
//

import Foundation
import UIKit

class SearchView: FullScreenView {
    var searchLabel: UILabel!
    
    override init () {
        super.init()
        self.backgroundColor = UIColor.yellow.withAlphaComponent(0.2)
        
        searchLabel = UILabel(frame: .zero)
        searchLabel.text = "CHATS SCREEN"
        searchLabel.textColor = self.tintColor
        
        self.addSubview(searchLabel)
        
        searchLabel.snp.makeConstraints { maker in
            maker.center.equalToSuperview()
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
