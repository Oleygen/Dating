//
//  Contacts.swift
//  loc
//
//  Created by oleygen ua on 2/9/19.
//  Copyright © 2019 oleygen. All rights reserved.
//

import Foundation
import Contacts

/// Pure swift representation of CNContact object

class Contact: Hashable {
    static func == (lhs: Contact, rhs: Contact) -> Bool {
        return lhs.userName == rhs.userName && lhs.emails == rhs.emails && lhs.phones == rhs.phones
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(userName)
        hasher.combine(emails)
        hasher.combine(phones)
    }

    let userName: String
    var emails: [EmailRecord] = []
    var phones: [PhoneRecord] = []
    
    init (with cnContact: CNContact) {
        self.userName = "\(cnContact.givenName) \(cnContact.familyName)"
        self.emails = cnContact.emailAddresses.map({ labeledValue -> EmailRecord in
            EmailRecord(value: labeledValue.value as String)
        })
        self.phones = cnContact.phoneNumbers.map({ labeledValue -> PhoneRecord in
            PhoneRecord(value: labeledValue.value.stringValue)
        })
    }
    
    var allRecords: [ContactRecord] {
        
        let phonesRec = (phones as [ContactRecord])
        let emailsRec = (emails as [ContactRecord])
        let allRecs = phonesRec + emailsRec
        
        return allRecs
    }
    
    var isSelected: Bool {
        let firstSelected = self.allRecords.first(where: {$0.isSelected == true })
        return firstSelected != nil
    }

    var recordCount: Int {
        return self.emails.count + self.phones.count
    }
    
    func changeSelection(for index: Int)
    {
        let record = allRecords[index]
        record.changeSelection()
    }
    
    
    
    
}

extension Contact: CustomDebugStringConvertible {
    var debugDescription: String {
        
        return "Contact: --\(self.userName)--\(self.emails.debugDescription)--\(self.phones.debugDescription)--"
    }
    
    
}
