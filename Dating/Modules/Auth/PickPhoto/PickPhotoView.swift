//
//  PickPhotoView.swift
//  Dating
//
//  Created by Gennady  Oleynik  on 8/29/19.
//  Copyright © 2019 Gennady  Oleynik . All rights reserved.
//

import Foundation
import UIKit

class PickPhotoView: FullScreenView {
    var photoLabel: UILabel!
    var photoImageView: UIImageView!
    var addPhotoButton: UIButton!
    var continueButton: UIButton!
    
    override init() {
        super.init()
        self.backgroundColor = UIColor.white
        
        self.photoLabel = UILabel(frame: .zero)
        self.photoLabel.text = "It's time to add some photo!"
        self.photoLabel.textColor = UIColor.black
        self.photoLabel.font = UIFont.systemFont(ofSize: 25)
        self.addSubview(self.photoLabel)
        
        self.photoLabel.snp.makeConstraints { maker in
            maker.top.equalToSuperview().offset(80)
            maker.centerX.equalToSuperview()
        }
        
        self.photoImageView = UIImageView(frame: .zero)
        self.photoImageView.contentMode = .scaleAspectFit
        self.photoImageView.image = UIImage(named: "placeholder_icon")
        
        self.addSubview(photoImageView)
        
        photoImageView.snp.makeConstraints { (maker) in
            maker.height.equalTo(self.snp.width)
            maker.width.equalTo(self.snp.width)
            maker.center.equalToSuperview()
        }
        
        self.addPhotoButton = UIButton(frame: .zero)
        addPhotoButton.setTitle("+", for: .normal)
        addPhotoButton.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        addPhotoButton.setTitleColor(UIColor.white, for: .normal)
        addPhotoButton.backgroundColor = UIColor.red.withAlphaComponent(0.5)
        addPhotoButton.titleLabel?.textAlignment = .center

        self.addSubview(addPhotoButton)
        
        addPhotoButton.snp.makeConstraints { (maker) in
            maker.center.equalTo(photoImageView)
            maker.height.width.equalTo(50)
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
        
        addPhotoButton.layer.cornerRadius = 50/2
        addPhotoButton.clipsToBounds = true
        
        continueButton.layer.cornerRadius = 8
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func hideAddButton() {
        self.addPhotoButton.isHidden = true
    }
    
    func setImage(image: UIImage) {
        self.photoImageView.image = image
    }
}
