//
//  ShakeHistoryVersionViewModel.swift
//  loc
//
//  Created by oleygen ua on 2/6/19.
//  Copyright © 2019 oleygen. All rights reserved.
//

import Foundation

struct ShakeHistoryVersionViewModel {
    let title: String
    let creationDate: String
}

extension ShakeHistoryVersion {
    func createViewModel() -> ShakeHistoryVersionViewModel {
        var stringDate = "N/A"
        if let date = self.creationDate {
            stringDate = DateFormatter.displayFormat.string(from: date)
        }
        return ShakeHistoryVersionViewModel(title: self.title ?? "No title", creationDate: stringDate)
    }
}
