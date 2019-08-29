//
//  GenderView.swift
//  Dating
//
//  Created by Gennady  Oleynik  on 8/29/19.
//  Copyright © 2019 Gennady  Oleynik . All rights reserved.
//

import Foundation
import UIKit

class GenderView: FullScreenView {
    var genderLabel: UILabel!
    var maleButton: UIButton!
    var femaleButton: UIButton!
    
    override init() {
        super.init()
        self.backgroundColor = UIColor.white
        
        self.genderLabel = UILabel(frame: .zero)
        self.genderLabel.text = "What's your gender?"
        self.genderLabel.textColor = UIColor.black
        self.genderLabel.font = UIFont.systemFont(ofSize: 25)
        self.addSubview(self.genderLabel)
        
        self.genderLabel.snp.makeConstraints { maker in
            maker.top.equalToSuperview().offset(80)
            maker.centerX.equalToSuperview()
        }
        
        self.maleButton = UIButton(frame: .zero)
        maleButton.setTitle("Male", for: .normal)
        maleButton.setTitleColor(UIColor.blue, for: .normal)
        maleButton.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        maleButton.titleLabel?.textAlignment = .center
        
        self.femaleButton = UIButton(frame: .zero)
        femaleButton.setTitle("Female", for: .normal)
        femaleButton.setTitleColor(UIColor.purple, for: .normal)
        femaleButton.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        femaleButton.titleLabel?.textAlignment = .center
        
        self.addSubview(maleButton)
        self.addSubview(femaleButton)
        
        maleButton.snp.makeConstraints { maker in
            maker.top.equalTo(genderLabel.snp.bottom).offset(20)
            maker.left.equalToSuperview()
            maker.right.equalTo(femaleButton.snp.left)
            maker.height.equalTo(150)
            maker.width.equalTo(femaleButton.snp.width)
        }
        
        femaleButton.snp.makeConstraints { maker in
            maker.top.equalTo(genderLabel.snp.bottom).offset(20)
            maker.right.equalToSuperview()
            maker.height.equalTo(150)
        }
        
        maleButton.layer.cornerRadius = 8
        femaleButton.layer.cornerRadius = 8
        
        maleButton.layer.borderColor = UIColor.blue.cgColor
        maleButton.layer.borderWidth = 2
        
        femaleButton.layer.borderColor = UIColor.purple.cgColor
        femaleButton.layer.borderWidth = 2
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
