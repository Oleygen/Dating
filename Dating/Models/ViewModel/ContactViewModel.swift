//
//  ContactViewModel.swift
//  loc
//
//  Created by oleygen ua on 2/28/19.
//  Copyright © 2019 oleygen. All rights reserved.
//

import Foundation

struct ContactViewModel {
    let username: String
    let contactValue: String
    let selected: Bool
    
    init(username: String, contactValue: String, selected: Bool) {
        self.username = username
        self.contactValue = contactValue
        self.selected = selected
    }
}

extension Contact {
    func createViewModel() -> ContactViewModel {
        return ContactViewModel(username: self.userName, contactValue: "", selected: false)
    }
    
    func createHeaderViewModel() -> ContactHeaderViewModel {
        return ContactHeaderViewModel(title: self.userName, isSelected: self.isSelected)
    }
    
}
