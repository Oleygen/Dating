//
//  ModulesFactory.swift
//  loc
//
//  Created by oleygen ua on 1/22/19.
//  Copyright © 2019 oleygen. All rights reserved.
//

import Foundation
import UIKit

final class ModuleFactory {}



extension ModuleFactory: AuthModuleFactory {
    static func createLogin() -> LoginInputHandler {
        
        let view = LoginView()
        let model = LoginModel()
        let controller = LoginController(baseView: view, baseModel: model)
        return controller
    }
    
    static func createRegister() -> RegisterInputHandler {
        let view = RegisterView()
        let model = RegisterModel()
        let controller = RegisterController(baseView: view, baseModel: model)
        return controller
        
    }
    
    static func createForgot() -> ForgotInputHandler {
        let view = ForgotView()
        let model = ForgotModel()
        let controller = ForgotController(baseView: view, baseModel: model)
        return controller
    }
    
    
}

extension ModuleFactory: MenuModuleFactory {
    static func createMenuScreen()  -> MenuInputHandler {
        let model = MenuModel()
        let view = MenuView()
        let controller = MenuController(baseView: view, baseModel: model)
        return controller
    }
}

extension ModuleFactory: SearchModuleFactory {
    static func createSearchScreen() -> SearchInputHandler {
        let model = SearchModel()
        let view = SearchView()
        let controller = SearchController(baseView: view, baseModel: model)
        return controller
    }
}

extension ModuleFactory: GameModuleFactory {
    static func createGameScreen() -> GameInputHandler {
        let model = GameModel()
        let view = GameView()
        let controller = GameController(baseView: view, baseModel: model)
        return controller
    }
}

extension ModuleFactory: ChatsModuleFactory {
    static func createChatsScreen() -> ChatsInputHandler {
        let model = ChatsModel()
        let view = ChatsView()
        let controller = ChatsController(baseView: view, baseModel: model)
        return controller
    }
}

extension ModuleFactory: OnboardingModuleFactory {
    static func createOnboardingContent(page: Page? = nil) -> OnboardingContentController {
        let model = OnboardingContentModel(page: page)
        let view = OnboardingContentView()
        let controller = OnboardingContentController(baseView: view, baseModel: model)
        return controller
    }
    
    static func createOnboardingScreen() -> OnboardingPageController {
        let model = OnboardingPageModel()
        let view = OnboardingPageView()
        let controller = OnboardingPageController(baseView: view, baseModel: model)
        return controller
    }
}



