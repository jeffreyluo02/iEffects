//
//  Extensions.swift
//  iEffects
//
//  Created by Jeffrey Luo on 2019-11-12.
//  Copyright © 2019 Jeffrey Luo. All rights reserved.
//

import Foundation

extension Date {
    func toString(dateFormat format: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
}
