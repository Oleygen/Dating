//
//  OnboardingInputHandler.swift
//  loc
//
//  Created by Oleynik Gennady on 24/03/2019.
//  Copyright © 2019 oleygen. All rights reserved.
//

import Foundation

protocol OnboardingInputHandler: InputHandler {
    var onFinishButtonTap: (() -> Void)? { get set }
}
