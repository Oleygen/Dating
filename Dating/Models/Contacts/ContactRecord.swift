//
//  ContactRecord.swift
//  loc
//
//  Created by oleygen ua on 3/2/19.
//  Copyright © 2019 oleygen. All rights reserved.
//

import Foundation

enum ContactRecordType {
    case email
    case phone
}

protocol ContactRecord {

    var type: ContactRecordType { get }
    var value: String { get }
    var isSelected: Bool { get set }
    
    func changeSelection()
}

extension ContactRecord {
    func createRecordViewModel() -> ContactRecordViewModel {
        return ContactRecordViewModel(value: value, isSelected: isSelected)
    }
    
  
}

