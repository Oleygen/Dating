//
//  LoggedController.swift
//  loc
//
//  Created by oleygen ua on 2/13/19.
//  Copyright © 2019 oleygen. All rights reserved.
//

import Foundation

class LoggedController: BaseController<LoggedView, LoggedModel>, LoggedInputHandler {
    var onLogoutTap: (() -> Void)?
    var onStripeTap: (() -> Void)?
    
    override func viewDidLoad() {
        self.shouldShowBackButton = false
        self.shouldShowMenuButton = true

        super.viewDidLoad()
        self.baseView.usernameLabel.text = "\(SessionService.current?.firstName ?? "No First Name") \(SessionService.current?.lastName ?? "No Last Name")"
        if let userId = SessionService.currentUserId {
            self.baseView.userIdLabel.text = "UserID: \(userId)"
        } else {
            self.baseView.userIdLabel.text = "UserID is null"

        }

        self.baseView.logoutButton.addTarget(self, action: #selector(didTapLogoutButton), for: .touchUpInside)
        self.baseView.stripeButton.addTarget(self, action: #selector(didTapStripeButton), for: .touchUpInside)
    }
    
    
    @objc func didTapLogoutButton() {
        do {
            SessionService.currentUserId = nil
            SessionService.authorized = false
            try SessionService.eraseCredentials()
            onLogoutTap?()
        } catch {
            self.showAlert(title: error.localizedDescription)
        }
        
    }
    
    @objc func didTapStripeButton() {
        onStripeTap?()
    }
    
}
