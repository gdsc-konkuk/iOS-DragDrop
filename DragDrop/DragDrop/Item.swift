//
//  Item.swift
//  DragDrop
//
//  Created by Suji Lee on 3/21/24.
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
