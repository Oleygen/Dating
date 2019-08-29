//
//  TemplateViewModel.swift
//  loc
//
//  Created by Oleynik Gennady on 28/01/2019.
//  Copyright © 2019 oleygen. All rights reserved.
//

import Foundation

struct TemplateViewModel {
    let title: String
    let templateText: String
    init(title: String, templateText: String) {
        self.title = title
        self.templateText = templateText
    }
}

extension Template {
    func createViewModel() -> TemplateViewModel {
        return TemplateViewModel(title: self.templateTitle ?? "TemplateTitle is null", templateText: self.baseText ?? "BaseText is null")
    }
    
    func createTypeViewModel() -> TemplateTypeViewModel {
        return TemplateTypeViewModel(title: self.templateTitle ?? "TemplateTitle is null", imageName: "placeholder_icon", isActive: self.isActive)
    }
}
