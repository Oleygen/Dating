//
//  OnboardingContentController.swift
//  loc
//
//  Created by Oleynik Gennady on 24/03/2019.
//  Copyright © 2019 oleygen. All rights reserved.
//

import Foundation
import UIKit

class OnboardingContentController: UIViewController {
    
    private var _baseView: BaseView
    private var _baseModel: BaseModel
    
    var baseView: OnboardingContentView {
        return _baseView as! OnboardingContentView
    }
    
    var model: OnboardingContentModel {
        return _baseModel as! OnboardingContentModel
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
        
        self.baseView.titleLabel.text = self.model.title
        self.baseView.textLabel.text = self.model.text
    }
}
