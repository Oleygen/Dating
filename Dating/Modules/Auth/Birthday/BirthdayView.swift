//
//  BirthdayView.swift
//  Dating
//
//  Created by Gennady  Oleynik  on 8/29/19.
//  Copyright © 2019 Gennady  Oleynik . All rights reserved.
//

import Foundation
import UIKit

class BirthdayView: FullScreenView {
    
    var birthdayLabel: UILabel!
    var datePicker: UIDatePicker!
    var restrictionLabel: UILabel!
    var continueButton: UIButton!

    
    override init() {
        super.init()
        self.backgroundColor = UIColor.white
        
        self.birthdayLabel = UILabel(frame: .zero)
        self.birthdayLabel.text = "When is your birthday?"
        self.birthdayLabel.textColor = UIColor.black
        self.birthdayLabel.font = UIFont.systemFont(ofSize: 25)
        self.addSubview(self.birthdayLabel)
        
        self.birthdayLabel.snp.makeConstraints { maker in
            maker.top.equalToSuperview().offset(80)
            maker.centerX.equalToSuperview()
        }
        
        self.datePicker = UIDatePicker(frame: .zero)
        self.datePicker.datePickerMode = .date
    
        self.addSubview(datePicker)
        datePicker.snp.makeConstraints { (maker) in
            maker.top.equalTo(birthdayLabel.snp.bottom).offset(20)
            maker.centerX.equalToSuperview()
        }
        
        self.restrictionLabel = UILabel(frame: .zero)
        self.restrictionLabel.text = "You must be over 18"
        self.restrictionLabel.textColor = UIColor.gray
        self.restrictionLabel.font = UIFont.systemFont(ofSize: 18)
        self.addSubview(self.restrictionLabel)
        
        self.restrictionLabel.snp.makeConstraints { maker in
            maker.top.equalTo(datePicker.snp.bottom).offset(20)
            maker.centerX.equalToSuperview()
        }
    
        self.continueButton = UIButton(frame: .zero)
        continueButton.setTitle("Continue", for: .normal)
        continueButton.setTitleColor(UIColor.white, for: .normal)
        continueButton.backgroundColor = UIColor.red.withAlphaComponent(0.5)
        continueButton.titleLabel?.textAlignment = .center
        

        self.addSubview(continueButton)
        
        
        continueButton.snp.makeConstraints { (maker) in
            maker.bottom.equalToSuperview().offset(-20)
            maker.left.equalToSuperview().offset(20)
            maker.right.equalToSuperview().offset(-20)
            maker.height.equalTo(50)
        }
        
        
        continueButton.layer.cornerRadius = 8
        
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
