//
//  ShakeSignatureViewModel.swift
//  loc
//
//  Created by oleygen ua on 2/21/19.
//  Copyright © 2019 oleygen. All rights reserved.
//

import Foundation



struct ShakeSignatureViewModel {
    let signatureTitleString: String
}


extension ShakeSignature {
    func createViewModel() -> ShakeSignatureViewModel {
        let formatter = DateFormatter.onlyDateDisplayFormat
        
        var creationDateString = "Date not specified"
        
        if let creationDate = self.creationDate {
            let dateString = formatter.string(from: creationDate)
            creationDateString = dateString
        }
        let result = "Signed by \(self.signerFirstName ?? "No first name") \(self.signerLastName ?? "No last name") on \(creationDateString)"
        
        return ShakeSignatureViewModel(signatureTitleString: result)
    }
}
