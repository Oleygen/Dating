//
//  FullScreenView.swift
//  loc
//
//  Created by oleygen ua on 2/6/19.
//  Copyright © 2019 oleygen. All rights reserved.
//

import Foundation
import UIKit

class FullScreenView : BaseView {
    init() {
        super.init(frame: UIScreen.main.bounds)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
