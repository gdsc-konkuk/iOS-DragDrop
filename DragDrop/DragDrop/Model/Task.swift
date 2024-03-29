//
//  Task.swift
//  DragDrop
//
//  Created by Suji Lee on 3/21/24.
//

import Foundation
import SwiftData

@Model
class Task {
    var name: String
    @Attribute(.unique) var category: String
    var isPinned: Bool {
        if category == "board" {
            return true
        } else {
            return  false
        }
    }
    var isDone: Bool = false
    
    init(name: String, category: String) {
        self.name = name
        self.category = category
    }
}
