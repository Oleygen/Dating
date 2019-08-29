//
//  OnboardingCoordinator.swift
//  loc
//
//  Created by oleygen ua on 1/22/19.
//  Copyright © 2019 oleygen. All rights reserved.
//

import Foundation
import UIKit

final class OnboardingCoordinator: Coordinator, OnboardingCoordinatorOutput {
    
    weak private var window: UIWindow?
    private let router: PlainRouter

    
    func start(with deeplinkOption: DeepLinkOption?) {
        self.showOnboarding()
    }
    
    init(window: UIWindow) {
        self.window = window
        self.router = PlainRouter()
    }
    
    var finishFlow: CoordinatorCompletionBlock?
    
    func start() {
        self.start(with: nil)
    }
    
    private func showOnboarding() {
        let onboardingHandler = ModuleFactory.createOnboardingScreen()
        onboardingHandler.onFinishButtonTap = { [weak self] in
                self?.finishFlow?()
        }
        window?.rootViewController = onboardingHandler
        window?.makeKeyAndVisible()
    }
    
    
    deinit {
        print(#function)
        print(#file)
    }
    
}
