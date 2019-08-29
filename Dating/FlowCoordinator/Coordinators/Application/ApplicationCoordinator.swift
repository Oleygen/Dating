//
//  AppCoordinator.swift
//  loc
//
//  Created by oleygen ua on 1/22/19.
//  Copyright © 2019 oleygen. All rights reserved.
//

import UIKit

final class ApplicationCoordinator: Coordinator {
    
    private let model: InitialModel
    
    private var isRootSet = false
    weak private var window: UIWindow?
    
    init(in window: UIWindow) {
        self.window = window
        self.model = InitialModel()
    }
    
    
    func start() {
        self.start(with: nil)
    }
    
    func start(with option: DeepLinkOption?) {
        runTabBar(with: option)

//        if SessionService.firstRun {
//            self.model.appInstalled(successHandler: { [weak self] in
//                SessionService.firstRun = false
//                self?.start(with: option)
//            }) { error in
//                print(error)
//                // TODO: -
//            }
//            return
//        }
//
////        if !SessionService.authorized && !SessionService.hasRegisteredDeviceToken {
////
////        }
//
//        if SessionService.needShowOnboarding {
//            self.runOnboardingFlow()
//            return
//        }
//
//        if SessionService.authorized {
//            runTabBar(with: option)
//        } else {
////            runDrawer(with: option)
//        }
        
    }
    
    
    private func runOnboardingFlow() {
        var coordinator = CoordinatorFactory.makeOnboardingCoordinator(window: self.window!)
        coordinator.finishFlow = { [weak self, weak coordinator] in
            SessionService.needShowOnboarding = false
            self?.start()
            self?.removeDependency(coordinator)
        }
        addDependency(coordinator)
        coordinator.start()
    }
    
    
    private func runTabBar(with deepLink: DeepLinkOption?) {
        let coordinator = CoordinatorFactory.makeTabBarCoordinator(window: self.window!)
        addDependency(coordinator)
        
        coordinator.onUnauthorize = { [weak self, weak coordinator] in
            self?.removeDependency(coordinator)
//            self?.runDrawer(with: nil)
        }
        
        coordinator.start(with: .gamification)
        self.window?.makeKeyAndVisible()
    }
    
    
    
    deinit {
        print(#function)
        print(#file)
    }
}

extension ApplicationCoordinator: Presenter {
    
    
    var presenterContext: UIViewController {
        return self.window!.rootViewController!
    }
    
    
    func present(_ module: Presentable?, animated: Bool, completion: CoordinatorCompletionBlock?) {
        if let toPresent = module?.toPresent {
            self.presenterContext.present(toPresent, animated: false, completion: completion)
        }
    }
    
    func dismissModule(animated: Bool, completion: CoordinatorCompletionBlock?) {
        self.presenterContext.dismiss(animated: animated, completion: completion)
    }
    
}
