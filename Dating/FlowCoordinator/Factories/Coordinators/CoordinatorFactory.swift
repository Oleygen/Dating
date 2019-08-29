//
//  CoordinatorFactory.swift
//  loc
//
//  Created by oleygen ua on 1/22/19.
//  Copyright © 2019 oleygen. All rights reserved.
//

import UIKit

class CoordinatorFactory {
    
    static func makeTabBarCoordinator(window: UIWindow) -> Coordinator & TabBarCoordinatorOutput {
        let coordinator = TabBarCoordinator(window: window)
        return coordinator
    }
    
    static func makeSearchCoordinator() -> Coordinator & SearchCoordinatorOutput {
        let coordinator = SearchCoordinator()
        return coordinator
    }
    
    static func makeGameCoordinator() -> Coordinator & GameCoordinatorOutput {
        let coordinator = GameCoordinator()
        return coordinator
    }
    
    static func makeChatsCoordinator() -> Coordinator & ChatsCoordinatorOutput {
        let coordinator = ChatsCoordinator()
        return coordinator
    }
    
    static func makeMenuCoordinator() -> Coordinator & MenuCoordinatorOutput {
        let coordinator = MenuCoordinator()
        return coordinator
    }
    
    static func makeAuthCoordinator(window: UIWindow) -> Coordinator & AuthCoordinatorOutput {
        let coordinator = AuthCoordinator(window: window)
        return coordinator
    }
    
    static func makeOnboardingCoordinator(window: UIWindow) -> Coordinator & OnboardingCoordinatorOutput {
        let coordinator = OnboardingCoordinator(window: window)
        
        return coordinator
    }
    
}
