//
//  PublishProcess.swift
//  loc
//
//  Created by oleygen ua on 3/2/19.
//  Copyright © 2019 oleygen. All rights reserved.
//

import Foundation

struct PublishStage: OptionSet {
    let rawValue: Int
    
    static let shakeSigned = PublishStage(rawValue: 1 << 1)
    static let codeObtained = PublishStage(rawValue: 1 << 2)
    static let emailsSent = PublishStage(rawValue: 1 << 3)
    static let messagesSent = PublishStage(rawValue: 1 << 4)
    static let finished = PublishStage(rawValue: 1 << 4)
    
    static let allSent: PublishStage = [.shakeSigned, .codeObtained, .emailsSent, .messagesSent]
}

class PublishProcess{
    private(set) var selectedContacts: SelectedContacts
    private(set) var stage: PublishStage
    
    var code: String?
    
    var emails: [EmailRecord] {
        return self.selectedContacts.allEmailRecords
    }
    
    var phones: [PhoneRecord] {
        return self.selectedContacts.allPhoneRecords
    }
    
    init(with selectedContacts: SelectedContacts) {
        self.selectedContacts = selectedContacts
        self.stage = PublishStage()
    }
    
    func shakeSigned() {
        stage.insert(.shakeSigned)
    }
    
    func emailsSent() {
        stage.insert(.emailsSent)
    }
    
    func messagesSent() {
        stage.insert(.messagesSent)
    }
    
    var isShakeSigned: Bool {
        return stage.contains(.shakeSigned)
    }
    
    var isEmailsSent: Bool {
        return stage.contains(.emailsSent)
    }
    
    var shouldSendEmails: Bool {
        return !isEmailsSent && self.selectedContacts.allEmails.count != 0
    }
    
    var isMessagesSent: Bool {
        return stage.contains(.messagesSent)
    }
    
    var shouldSendMessages: Bool {
        return !isMessagesSent && self.selectedContacts.allPhones.count != 0
    }
    
    var isCodeObtained: Bool {
        return stage.contains(.codeObtained)
    }
    
    var shouldSignShake: Bool {
        return !isShakeSigned
    }
    
    var shouldGetCode: Bool {
        return isShakeSigned && !isCodeObtained || self.code == nil
    }
    
    var shouldContinue: Bool {
        return !stage.contains(.allSent)
    }
    
    func obtainCode(_ code: String) {
        self.code = code
        stage.insert(.codeObtained)
    }
    
    var allContactsStrings: [String] {
        var result: [String] = []
        self.emails.forEach({result.append($0.value)})
        self.phones.forEach({result.append($0.value)})
        return result
    }
}
