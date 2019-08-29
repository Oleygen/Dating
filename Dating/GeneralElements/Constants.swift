//
//  Constants.swift
//  loc
//
//  Created by Oleynik Gennady on 02/04/2019.
//  Copyright © 2019 oleygen. All rights reserved.
//

import Foundation

class Constants {
    public static let rootTemplateParentId = -1
    public static let defferedShakeId = -2
    public static let processingShakeId = -3
    
    public static var userDidLoginNotification : NSNotification.Name {
        return NSNotification.Name("userDidLogin")
    }
    
    public static var userDidLogoutNotification : NSNotification.Name {
        return NSNotification.Name("userDidLogout")
    }
}
