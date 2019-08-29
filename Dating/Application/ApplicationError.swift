//
//  ApplicationError.swift
//  loc
//
//  Created by oleygen ua on 1/24/19.
//  Copyright © 2019 oleygen. All rights reserved.
//

import Foundation

public enum ApplicationError: Error {
    case alreadyCreated
    case saveUncreated
    case duplicateUncreated
    case signUncreated
    case publishUncreated
    
    case userAccessKeyEmpty
    
    case noUserId
    case noShakeId
    case noShakeText
    case noPublicKey
    case noCurrentUser
    case noUserAfterLogin
    case noTemplateId
    case noCreatorId
    case noTitle
    case cantFindTemplate(templateId: Int)
    case noEmail
    
    case noCommenterId
    case noCommentText
    case noCommentId
    case noCommentShakeId
    
    case noShakeHistoryId
    case noShakeHistoryEditorId
    case noShakeHistoryCreationDate
    case noShakeHistoryShakeId
    case incorrectShakeHistoryUpdate
    
    case noOwner
    case incorretSignatureUpdate
    case noSignatureId
    case noSignerId
    case noShakeSignatureCreationDate
    case ownerSignatureNotFound
    
    case noDecliningUserId
    
    case noConditionSelected
    case noValidityTypeId
}


extension ApplicationError : LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .alreadyCreated:
            return "Trying to create already created shake."
        
        case .saveUncreated:
            return "Trying to save uncreated shake."
            
        case .duplicateUncreated:
            return "Trying to duplicate uncreated shake."
        
        
        case .signUncreated:
            return "Trying to sign uncreated shake."
        
        case .publishUncreated:
            return "Trying to publish uncreated shake."
            
        case .userAccessKeyEmpty:
            return "Something goes wrong, userAccessKey shouldn't be empty. Make sure you've authorized in the app."
            
        case .noUserId:
            return "Something goes wrong, UserId shouldn't be nil. Make sure you've authorized in the app."
            
        case .noShakeId:
            return "Something goes wrong, Shake should contain a shakeId."
            
        case .noShakeText:
            return "Something goes wrong, Shake should contain a text"
            
        case .noPublicKey:
            return "Something goes wrong, PublicKey shouldn't be nil. Make sure you've authorized in the app."
            
        case .noCurrentUser:
            return "Something goes wring, CurrentUser shouldn't be nil. Make sure you've authorized in the app."
            
        case .noUserAfterLogin:
            return "Something goes wrong, User should be available after login."
            
        case .noTemplateId:
            return "Someting goes wrong, Template should have an ID."
            
        case .noCreatorId:
            return "Something goes wrong, Shake should have creatorId."
            
        case .noTitle:
            return "Something goes wrong, Shake should have a title."
            
        case .cantFindTemplate(let templateId):
            return "Can't find Template with id: \(templateId)"
            
        case .noEmail:
            return "User should have an email"
            
        case .noCommenterId:
            return "Comment should contain commenterID"
            
        case .noCommentText:
            return "Comment should contain text"
            
        case .noCommentId:
            return "Comment should have an ID"
            
        case .noCommentShakeId:
            return "Comment should contain commentID"
            
        case .noShakeHistoryId:
            return "ShakeHistory should have an ID"
            
        case .noShakeHistoryEditorId:
            return "ShakeHistory should contain editorID"
            
        case .noShakeHistoryCreationDate:
            return "ShakeHistory should contain creation date"
            
        case .noShakeHistoryShakeId:
            return "ShakeHistory should contain shakeID"
            
        case .incorrectShakeHistoryUpdate:
            return "Attemp to update shakeHistory with unrelated data"
            
        case .noOwner:
            return "Can't find shake owner"
            
        case .incorretSignatureUpdate:
            return "Attempt to update signature with unrelated data"
            
        case .noSignatureId:
            return "ShakeSignature should have an ID"
            
        case .noSignerId:
            return "ShakeSignature should have a signerId"
            
        case .noShakeSignatureCreationDate:
            return "ShakeSignature should have creation date"
            
        case .ownerSignatureNotFound:
            return "Owner signature not found"
            
        case .noDecliningUserId:
            return "Can't found declining user ID"
            
            
        case .noConditionSelected:
            return "You didn't select condition"
            
        case .noValidityTypeId:
            return "Can't find validity type ID"
        }
        
        
    }
}
