//
//  AppDelegate.swift
//  loc
//
//  Created by oleygen ua on 1/21/19.
//  Copyright © 2019 oleygen. All rights reserved.
//

import UIKit
import Fabric
import Crashlytics
import UserNotifications
import SwiftyUserDefaults

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    private lazy var applicationCoordinator: Coordinator = self.makeCoordinator()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions:
        [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        Fabric.with([Crashlytics.self])
        let window = UIWindow(frame: UIScreen.main.bounds)
        self.window = window

        registerForPushNotifications()
        BackgroundService.instance.start()
        applicationCoordinator.start()
        return true
    }
    
    // MARK: - Push notification
    
    func application(
        _ application: UIApplication,
        didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data
        ) {
        let tokenParts = deviceToken.map { data in String(format: "%02.2hhx", data) }
        let token = tokenParts.joined()
        Defaults[DefaultsKeys.pushToken] = token
    }
    
    func application(
        _ application: UIApplication,
        didFailToRegisterForRemoteNotificationsWithError error: Error) {
        self.window?.rootViewController?.showAlert(title: "Can't register for push", message: error.localizedDescription)
    }
    
    // MARK: - Deep link
    
    func application(_ application: UIApplication, continue userActivity: NSUserActivity, restorationHandler: @escaping ([UIUserActivityRestoring]?) -> Void) -> Bool {
        guard userActivity.activityType == NSUserActivityTypeBrowsingWeb,
            let incomingURL = userActivity.webpageURL,
            let components = URLComponents(url: incomingURL, resolvingAgainstBaseURL: false) else {
                return false
        }
        let path = components.path
        let deeplink = DeepLinkOption.build(with: path)
        self.applicationCoordinator.start(with: deeplink)
        return true
    }
    
   
    // MARK: - Private
    
    private func makeCoordinator() -> Coordinator {
        return ApplicationCoordinator(
            in: self.window!)
    }
    
    private func registerForPushNotifications() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { [weak self] granted, error in
            guard granted else { return }
            self?.getNotificationSettings()
        }
    }
    
    private func getNotificationSettings() {
        UNUserNotificationCenter.current().getNotificationSettings { settings in
            guard settings.authorizationStatus == .authorized else { return }
            DispatchQueue.main.async {
                UIApplication.shared.registerForRemoteNotifications()
            }
        }
    }
    
    
    deinit {
        print("deinit \(#file)")
    }
}
