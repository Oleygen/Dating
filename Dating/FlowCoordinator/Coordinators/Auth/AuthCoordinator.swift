//
//  AuthCoordinator.swift
//  loc
//
//  Created by oleygen ua on 1/22/19.
//  Copyright © 2019 oleygen. All rights reserved.
//

import Foundation

final class AuthCoordinator: ChildCoordinator, AuthCoordinatorOutput {
    func start(with deeplinkOption: DeepLinkOption?) {
        //TODO: - to implement
    }
    
    var finishFlow: ((Bool) -> Void)?
    
    init(presenter: Presenter) {
        self.presenter = presenter
        self.router = NavigationRouter()
    }
    
    private let router: NavigationRouter
    
    var presenter: Presenter
    
    func start() {
        prepareLogin()
        self.presenter.present(router.rootController, animated: true, completion: nil)
    }
    
    //MARK: - Run current flow's controllers

    private func prepareLogin() {
        let loginHandler = ModuleFactory.createLogin()
        loginHandler.onCompleteAuth = { [weak self] in
            self?.preapareFinishing(true)
        }
        loginHandler.onSignUpButtonTap = { [weak self] in
            self?.showSignUp()
        }
        
        loginHandler.onForgotButtonTap = { [weak self] in
            self?.showForgot()
        }

        loginHandler.onBackButtonTap = { [weak self] in
            self?.preapareFinishing(false)
        }
        router.setRootModule(loginHandler)
    }
    
    private func showSignUp() {
        let registerInputHandler = ModuleFactory.createRegister()
        registerInputHandler.onBackButtonTap = { [weak self] in
            self?.router.popModule()
        }
        
        registerInputHandler.onSignUpComplete = { [weak self] in
            self?.preapareFinishing(true)
        }
        router.push(registerInputHandler)
    }
    
    private func showForgot() {
        let forgotInputHandler = ModuleFactory.createForgot()
        forgotInputHandler.onBackButtonTap = { [weak self] in
            self?.router.popModule()
        }
        router.push(forgotInputHandler)
    }

    private func preapareFinishing(_ finished: Bool) {
        NotificationCenter.default.post(name: Constants.userDidLoginNotification, object: nil)
        self.finishFlow?(finished)
    }
    
    deinit {
        print("deinit \(#file)")
    }
}
