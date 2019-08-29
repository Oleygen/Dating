//
//  RootController.swift
//  loc
//
//  Created by oleygen ua on 2/8/19.
//  Copyright © 2019 oleygen. All rights reserved.
//

import Foundation
import UIKit
class RootController: UIViewController, RootInputHandler {
    var onViewLoad: (() -> Void)?
    
    private var _baseView: BaseView
    private var _baseModel: BaseModel
    
    var baseView: RootView {
        return _baseView as! RootView
    }
    
    var model: RootModel {
        return _baseModel as! RootModel
    }
    
    
    init(baseView: BaseView, baseModel: BaseModel) {
        self._baseView = baseView
        self._baseModel = baseModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = self._baseView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if let onViewLoad = onViewLoad {
            onViewLoad()
        }
    }
}
