//
//  TemplateTypeViewModel.swift
//  loc
//
//  Created by Oleynik Gennady on 27/03/2019.
//  Copyright © 2019 oleygen. All rights reserved.
//

import Foundation

struct TemplateTypeViewModel {
    let title: String
    let imageName: String
    let isActive: Bool
    
    init(title: String, imageName: String, isActive: Bool) {
        self.title = title
        self.imageName = imageName
        self.isActive = isActive
    }
}
