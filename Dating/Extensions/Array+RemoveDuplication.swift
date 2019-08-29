//
//  Array+RemoveDuplication.swift
//  loc
//
//  Created by oleygen ua on 3/2/19.
//  Copyright © 2019 oleygen. All rights reserved.
//

import Foundation

extension Array where Element: Hashable {
    mutating func removeDuplicates() {
        var set = Set<Element>()
        removeAll { !set.insert($0).inserted }
    }
}
