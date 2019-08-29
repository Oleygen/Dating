//
//  File.swift
//  loc
//
//  Created by Oleynik Gennady on 24/03/2019.
//  Copyright © 2019 oleygen. All rights reserved.
//

import Foundation

class OnboardingContentModel: BaseModel {
    
    public var title: String {
        return page?.title ?? "no title"
    }
    
    public var text: String {
        return page?.text ?? "no text"
    }
    
    private let page: Page?
    
    init(page: Page?) {
        self.page = page
    }
}
