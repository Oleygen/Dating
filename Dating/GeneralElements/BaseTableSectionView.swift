//
//  BaseTableSectionView.swift
//  loc
//
//  Created by oleygen ua on 2/6/19.
//  Copyright © 2019 oleygen. All rights reserved.
//

import Foundation
import UIKit

class BaseTableSectionView : BaseView {
    var titleLabel: UILabel!
    
    convenience init(title: String, owner: Any? = nil, action: Selector? = nil) {
        self.init()
        self.titleLabel.text = title
        if let owner = owner, let action = action {
            let recognizer = UITapGestureRecognizer(target: owner, action: action)
            self.addGestureRecognizer(recognizer)
        }
        
    }
    
    init() {
        super.init(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: tableHeaderHeight) )
        self.backgroundColor = UIColor.red.withAlphaComponent(0.1)
        titleLabel = UILabel(frame: .zero)
        titleLabel.font = titleTextFont
        self.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { maker in
            maker.leftMargin.equalToSuperview()
            maker.bottomMargin.equalToSuperview()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
