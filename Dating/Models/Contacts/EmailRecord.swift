//
//  EmailRecord.swift
//  loc
//
//  Created by oleygen ua on 3/2/19.
//  Copyright © 2019 oleygen. All rights reserved.
//

import Foundation

/// Pure swift representation for CNContacts email

class EmailRecord : ContactRecord, Hashable {

    var type: ContactRecordType
    var isSelected: Bool
    var value: String
    
    init(value: String, isSelected: Bool = false) {
        self.type = .email
        self.value = value
        self.isSelected = isSelected
    }

    func changeSelection() {
        self.isSelected = !self.isSelected
    }
    
    // MARK: - Hashable
    static func == (lhs: EmailRecord, rhs: EmailRecord) -> Bool {
        return lhs.type == rhs.type && lhs.value == rhs.value
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(value)
        hasher.combine(type)
    }
}
