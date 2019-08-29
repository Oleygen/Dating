//
//  DeepLinkOption.swift
//  loc
//
//  Created by oleygen ua on 2/19/19.
//  Copyright © 2019 oleygen. All rights reserved.
//

import Foundation

struct DeepLinkURLConstants {
    static let templates = "/templates"
//    static let createShake = "/createShake"
    static let shakes = "/shakes"
    static let gamification = "/gamification"
    static let settings = "/settings"
}

enum DeepLinkOption {
    
    case templates
//    case createShake
    case shakes
    case gamification
    case settings

    static func build(with string: String) -> DeepLinkOption? {
        switch string {
        case DeepLinkURLConstants.templates: return .templates
//        case DeepLinkURLConstants.createShake: return .createShake
        case DeepLinkURLConstants.shakes: return .shakes
        case DeepLinkURLConstants.gamification: return .gamification
        case DeepLinkURLConstants.settings: return .settings
        default:
            return nil
        }
    }
    
    static func build(with dict: [String : AnyObject]?) -> DeepLinkOption? {
        guard let id = dict?["launch_id"] as? String else { return nil }
        
        switch id {
        case DeepLinkURLConstants.templates: return .templates
//        case DeepLinkURLConstants.createShake: return .createShake
        case DeepLinkURLConstants.shakes: return .shakes
        case DeepLinkURLConstants.gamification: return .gamification
        case DeepLinkURLConstants.settings: return .settings

        default: return nil
        }
    }
}
