//
//  Helper.swift
//  iEffects
//
//  Created by Jeffrey Luo on 2019-11-12.
//  Copyright © 2019 Jeffrey Luo. All rights reserved.
//

import Foundation

// reads out the file at the given path and returns the date when it was created, if it fails, return current date
func getCreationDate(for file: URL) -> Date {
    if let attributes = try? FileManager.default.attributesOfItem(atPath: file.path) as [FileAttributeKey: Any],
        let creationDate = attributes[FileAttributeKey.creationDate] as? Date {
            return creationDate
    } else {
        return Date()
    }
}
