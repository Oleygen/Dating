//
//  OnboardingPageModel.swift
//  loc
//
//  Created by Oleynik Gennady on 24/03/2019.
//  Copyright © 2019 oleygen. All rights reserved.
//

import Foundation

class OnboardingPageModel: BaseModel {
    private let pages = [
        Page(title: "First page", text: "First page text"),
        Page(title: "Second page", text: "Second page text"),
        Page(title: "Third page", text: "Third page text")
    ]
    
    public var pagesCount: Int {
        return pages.count
    }
    
    public func page(for index: Int) -> Page {
        return self.pages[index]
    }
    
    
}
