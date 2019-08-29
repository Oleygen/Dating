//
//  OnboardingPageView.swift
//  loc
//
//  Created by Oleynik Gennady on 24/03/2019.
//  Copyright © 2019 oleygen. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class OnboardingPageView: FullScreenView {
    
    var pageControl: UIPageControl!
    var finishButton: UIButton!
    
    override init() {
        super.init()
        self.backgroundColor = UIColor.white
        
        pageControl = UIPageControl()
        pageControl.pageIndicatorTintColor = UIColor.lightGray
        pageControl.currentPageIndicatorTintColor = UIColor.black
        pageControl.backgroundColor = UIColor.white
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(pageControl)
        pageControl.snp.makeConstraints { maker in
            maker.bottom.equalToSuperview().offset(-20)
            maker.centerX.equalToSuperview()
        }
        
        finishButton = UIButton(type: .system)
        finishButton.setTitle("Finish", for: .normal)
        finishButton.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(finishButton)
        finishButton.snp.makeConstraints { maker in
            maker.bottom.equalTo(pageControl.snp.top)
            maker.height.equalTo(50)
            maker.width.equalTo(150)
            maker.centerX.equalToSuperview()
        }
        
        finishButton.layer.borderColor = UIColor.black.cgColor
        finishButton.layer.borderWidth = 2
        finishButton.setTitleColor(UIColor.black, for: .normal)
        finishButton.titleLabel?.font = UIFont.systemFont(ofSize: 25)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setupPageControl() {

    }
}
