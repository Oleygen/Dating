//
//  ShakeViewModel.swift
//  loc
//
//  Created by Oleynik Gennady on 31/01/2019.
//  Copyright © 2019 oleygen. All rights reserved.
//

import Foundation

struct ShakeViewModel {
    let title: String
    let subtitle: String
    let imageString: String
}


extension Shake {
    func createViewModel() -> ShakeViewModel {
        
        
        
        if self.isArchived {
              return ShakeViewModel(title: title ?? "Title is null", subtitle: "Archived", imageString: "placeholder_icon")
        }
        
        if self.isRevoked {
            return ShakeViewModel(title: title ?? "Title is null", subtitle: "You Declined", imageString: "placeholder_icon")

        }
        
        if self.isDeclines {
            return ShakeViewModel(title: title ?? "Title is null", subtitle: "Shake Declined", imageString: "placeholder_icon")
        }
        
        if self.isCompleted {
            return ShakeViewModel(title: title ?? "Title is null", subtitle: "Completed", imageString: "placeholder_icon")
        }
        
        if self.hasComment {
            return ShakeViewModel(title: title ?? "Title is null", subtitle: "Read Comment", imageString: "shake_comment_icon")
        }
        
        if self.isSignedByOwner {
            return ShakeViewModel(title: title ?? "Title is null", subtitle: "Pending", imageString: "shake_pending_icon")
        }
        
        return ShakeViewModel(title: title ?? "Title is null", subtitle: "Draft", imageString: "shake_draft_icon")
        
        
        
        
    }
}
