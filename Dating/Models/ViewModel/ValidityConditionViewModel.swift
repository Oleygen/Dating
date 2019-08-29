//
//  ValidityConditionViewModel.swift
//  loc
//
//  Created by Oleynik Gennady on 21/04/2019.
//  Copyright © 2019 oleygen. All rights reserved.
//

import Foundation

struct ValidityConditionViewModel {
    let name: String
    let isSelected: Bool
    
    init(name: String, isSelected: Bool) {
        self.name = name
        self.isSelected = isSelected
    }
}


extension ValidityCondition {
    func createViewModel(selected: Bool) ->  ValidityConditionViewModel {
        return ValidityConditionViewModel(name: self.typeDisplayName ?? "No name selected", isSelected: selected)
    }
}
