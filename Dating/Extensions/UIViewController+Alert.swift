//
//  UIViewController.swift
//  loc
//
//  Created by Oleynik Gennady on 28/01/2019.
//  Copyright © 2019 oleygen. All rights reserved.
//


import Foundation
import UIKit
extension UIViewController {
    func showAlert(title: String, message: String? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default) { _ in
            alert.dismiss(animated: true, completion: nil)
        }
        
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    
    
    func showPushAlert(pushToken: String) {
                
        let alert = UIAlertController(title: "Your device token", message: pushToken, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default) { _ in
            alert.dismiss(animated: true, completion: nil)
        }
        let copyAction = UIAlertAction(title: "Copy", style: .default) { _ in
            UIPasteboard.general.string = pushToken
        }
        
        alert.addAction(okAction)
        alert.addAction(copyAction)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    func showShareAlert(string: String) {
        let activityVC = UIActivityViewController(activityItems: [string], applicationActivities: nil)
        self.present(activityVC, animated: true, completion: nil)
    }
    
    func showAlert(message: String, okHandler: @escaping ()->Void) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default) { _ in
            okHandler()
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    func showAlertWithTextField(message: String, okHandler: @escaping (String)->Void) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alert.addTextField(configurationHandler: nil)
        let okAction = UIAlertAction(title: "Submit", style: .default) { _ in
            okHandler(alert.textFields?.first?.text ?? "")
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        self.present(alert, animated: true, completion: nil)
    }
}
