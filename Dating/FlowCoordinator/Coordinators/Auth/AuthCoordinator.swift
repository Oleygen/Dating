//
//  RegisterCoordinator.swift
//  Dating
//
//  Created by Gennady  Oleynik  on 8/29/19.
//  Copyright © 2019 Gennady  Oleynik . All rights reserved.
//

import Foundation
import UIKit

final class AuthCoordinator: Coordinator, AuthCoordinatorOutput {
    private let window: UIWindow
    private let router: NavigationRouter
    
    var finishFlow: ((AuthResult) -> Void)?
    
    var rootController: UIViewController {
        return router.rootController
    }
    
    init(window: UIWindow) {
        self.window = window
        self.router = NavigationRouter(rootController: UINavigationController(rootViewController: UIViewController()))
        window.rootViewController = rootController
    }
    
    func start() {
        self.start(with: nil)
    }
    
    func start(with deeplinkOption: DeepLinkOption?) {
        showAuthTypeScreen()
    }
    
    private func showAuthTypeScreen() {
        let authTypeHandler = ModuleFactory.createAuthTypeScreen()
        authTypeHandler.onPickAuthType = { [weak self] authType in
            switch authType {
            case .login:
                self?.showLoginScreen()
            case .register:
                self?.showGenderScreen()
            }
        }
        
        router.setRootModule(authTypeHandler)

    }
    
    private func showGenderScreen() {
        let genderHandler = ModuleFactory.createGenderScreen()
        genderHandler.onPickGender = { [weak self] gender in
            self?.showBirthdayScreen()
        }
        
        genderHandler.onBackButtonTap = { [weak self] in
            self?.router.popModule()
        }
        
        self.router.push(genderHandler)
    }
    
    private func showBirthdayScreen() {
        let birthdayHandler = ModuleFactory.createBirthdayScreen()
        birthdayHandler.onContinueTap = { [weak self] in
            self?.showNameScreen()
        }
        birthdayHandler.onBackButtonTap = { [weak self] in
            self?.router.popModule()
        }
        
        router.push(birthdayHandler)
    }
    
    private func showNameScreen() {
        let nameHandler = ModuleFactory.createNameScreen()
        nameHandler.onContinueTap = { [weak self] in
            self?.showEmailScreen()
        }
        
        nameHandler.onBackButtonTap = { [weak self] in
            self?.router.popModule()
        }
        
        router.push(nameHandler)
    }
    
    private func showEmailScreen() {
        let emailHandler = ModuleFactory.createEmailScreen()
        emailHandler.onContinueTap = { [weak self] in
            self?.showPickPhotoScreen()
        }
        
        emailHandler.onBackButtonTap = { [weak self] in
            self?.router.popModule()
        }
        
        router.push(emailHandler)
    }
    
    private func showPickPhotoScreen() {
        let pickPhotoHandler = ModuleFactory.createPickPhotoScreen()
        pickPhotoHandler.onContinueTap = { [weak self] in
            self?.showPasswordScreen()
        }
        
        pickPhotoHandler.onBackButtonTap = { [weak self] in
            self?.router.popModule()
        }
        router.push(pickPhotoHandler)
    }
    
    private func showPasswordScreen() {
        let passwordHandler = ModuleFactory.createPasswordScreen()
        passwordHandler.onFinishTap = { [weak self] in
            self?.finishFlow?(.success)
        }
        
        passwordHandler.onBackButtonTap = { [weak self] in
            self?.router.popModule()
        }
        
        router.push(passwordHandler)
    }
    
    
    private func showLoginScreen() {
        let loginHandler = ModuleFactory.createLoginScreen()
        loginHandler.onBackButtonTap = { [weak self] in
            self?.router.popModule()
        }
        loginHandler.onLoginTap = { [weak self] authResult in
            self?.finishFlow?(.success)
        }
        
        self.router.push(loginHandler)
    }
    
}
