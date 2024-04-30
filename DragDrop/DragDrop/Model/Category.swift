//
//  Category.swift
//  DragDrop
//
//  Created by Suji Lee on 3/21/24.
//

import Foundation
import SwiftData

@Model
final class Category {
    @Attribute(.unique) var name: String
    @Relationship(deleteRule: .cascade) var taskItems: [TaskItem]?

    init(name: String) {
        self.name = name
    }
}


