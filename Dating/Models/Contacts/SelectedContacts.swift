//
//  SelectedContacts.swift
//  loc
//
//  Created by oleygen ua on 3/2/19.
//  Copyright © 2019 oleygen. All rights reserved.
//

import Foundation

class SelectedContact {

    let userName: String
    var emails: [EmailRecord]
    var phones: [PhoneRecord]
    
    init?(with contact: Contact) {
        if !contact.isSelected {
            return nil
        }
        self.userName = contact.userName
        self.emails = contact.emails.filter({$0.isSelected})
        self.phones = contact.phones.filter({$0.isSelected})
    }
}

class SelectedContacts {
    
    private let contacts: [SelectedContact]
    
    init(selectedContacts: [SelectedContact]) {
        self.contacts = selectedContacts
    }
    
    public var signees: [String] {
        return self.contacts.map({ $0.userName})
    }
    
    public var allEmailRecords: [EmailRecord] {
        return self.contacts.flatMap({$0.emails})
    }
    
    
    public var allPhoneRecords: [PhoneRecord] {
        return self.contacts.flatMap({$0.phones})
    }
    
    
    public var allEmails: [String] {
       return self.allEmailRecords.map({$0.value})
    }
    
    public var allPhones: [String] {
        return self.allPhoneRecords.map({$0.value})
    }

    

}


