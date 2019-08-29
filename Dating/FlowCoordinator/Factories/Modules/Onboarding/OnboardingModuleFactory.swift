//
//  OnboardingModuleFactory.swift
//  loc
//
//  Created by oleygen ua on 1/22/19.
//  Copyright © 2019 oleygen. All rights reserved.
//

import Foundation

protocol OnboardingModuleFactory {
    static func createOnboardingScreen() -> OnboardingPageController
    static func createOnboardingContent(page: Page?) -> OnboardingContentController
}
