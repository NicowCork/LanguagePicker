//
//  Item.swift
//  LanguagePicker
//
//  Created by Nicolas on 10/03/2024.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
