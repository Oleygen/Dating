//
//  LoginInputHandler.swift
//  loc
//
//  Created by oleygen ua on 1/22/19.
//  Copyright © 2019 oleygen. All rights reserved.
//

import Foundation

protocol LoginInputHandler: TransitionInputHandler {
    var onCompleteAuth: CoordinatorCompletionBlock? { get set }
    var onSignUpButtonTap: CoordinatorCompletionBlock? { get set }
    var onForgotButtonTap: CoordinatorCompletionBlock? { get set }
}
