//
//  CommentService.swift
//  loc
//
//  Created by Oleynik Gennady on 01/04/2019.
//  Copyright © 2019 oleygen. All rights reserved.
//

import Foundation
import RealmSwift
import Realm

class CommentService {
    
    static func save(_ comment: Comment) throws {
        guard comment.id.value != nil else {
            throw ApplicationError.noCommentId
        }
        
        guard comment.shakeId.value != nil else {
            throw ApplicationError.noCommentShakeId
        }
        
        guard comment.commenterId.value != nil else {
            throw ApplicationError.noCommenterId
        }
        
        let realm = try Realm()
        try realm.write {
            realm.add(comment)
        }
    }
    
}
