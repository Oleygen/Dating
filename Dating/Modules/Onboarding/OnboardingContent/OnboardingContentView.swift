//
//  OnboardingContentView.swift
//  loc
//
//  Created by Oleynik Gennady on 24/03/2019.
//  Copyright © 2019 oleygen. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class OnboardingContentView: FullScreenView {
    var titleLabel: UILabel!
    var textLabel: UILabel!
    var imageView: UIImageView!
    
    override init() {
        super.init()
        self.backgroundColor = UIColor.yellow.withAlphaComponent(0.1)
        
        titleLabel = UILabel(frame: .zero)
        titleLabel.font = titleTextFont
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { maker in
            maker.centerX.equalToSuperview()
            maker.top.equalTo(self.snp.topMargin).offset(20)
        }
        
        imageView = UIImageView(image: UIImage(named: "placeholder_icon_colored"))
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(imageView)
        imageView.snp.makeConstraints { maker in
            maker.top.equalTo(titleLabel.snp.bottom)
            maker.height.equalTo(200)
            maker.width.equalTo(300)
            maker.centerX.equalToSuperview()
        }
        
        textLabel = UILabel(frame: .zero)
        textLabel.font = titleTextFont
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(textLabel)
        textLabel.snp.makeConstraints { maker in
            maker.centerX.equalToSuperview()
            maker.top.equalTo(imageView.snp.bottom)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
