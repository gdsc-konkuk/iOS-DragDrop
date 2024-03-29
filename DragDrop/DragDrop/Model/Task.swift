//
//  Task.swift
//  DragDrop
//
//  Created by Suji Lee on 3/21/24.
//

import Foundation
import SwiftData

@Model
final class Task {
    var name: String
    var category: String
    var isPinned: Bool
    var isDone: Bool
    
    init(name: String, category: String, isPinned: Bool, isDone: Bool) {
        self.name = name
        self.category = category
        self.isPinned = isPinned
        self.isDone = isDone
    }
}
