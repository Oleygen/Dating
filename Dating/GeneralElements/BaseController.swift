//
//  BaseViewController.swift
//  loc
//
//  Created by oleygen ua on 2/1/19.
//  Copyright © 2019 oleygen. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class BaseController<V, M>: UIViewController, TransitionInputHandler {
    
    var onDrawerButtonTap: (() -> Void)?
    var onCloseButtonTap: (() -> Void)?
    var onBackButtonTap: (() -> Void)?
    
    private var _baseView: BaseView
    private var _baseModel: BaseModel
    
    var shouldShowBackButton = true
    var shouldShowMenuButton = false
    
    var model: M {
        return _baseModel as! M
    }

    var baseView: V {
        return _baseView as! V
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
        if self.navigationController == nil {
            let button = UIButton(type: .custom)
            button.setTitle("Close", for: .normal)
            button.setTitleColor(self.view.tintColor, for: .normal)
            button.addTarget(self, action: #selector(didTapCloseButton), for: .touchUpInside)
            self.view.addSubview(button)
            button.snp.makeConstraints { maker in
                maker.top.equalToSuperview().offset(20)
                maker.left.equalToSuperview()
                maker.height.equalTo(50)
            }
        } else {
            if (shouldShowBackButton) {
                self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(didTapBackButton))
            } else if (shouldShowMenuButton) {
             self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "drawer_button"), style: .plain, target: self, action: #selector(didTapDrawerButton))
                self.navigationItem.leftBarButtonItem?.tintColor = UIColor.black
            }
            
        }
    }
    
    
    @objc func didTapBackButton() {
        guard let onBackButtonTap = onBackButtonTap else { return }
        onBackButtonTap()
    }
    
    @objc func didTapCloseButton() {
        guard let onCloseButtonTap = onCloseButtonTap else { return }
        onCloseButtonTap()
    }
    
    @objc func didTapDrawerButton() {
        guard let onDrawerButtonTap = onDrawerButtonTap else {
            return
        }
        onDrawerButtonTap()
    }
}
