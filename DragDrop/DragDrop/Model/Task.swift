//
//  Task.swift
//  DragDrop
//
//  Created by Suji Lee on 3/21/24.
//

import Foundation
import SwiftData
import UniformTypeIdentifiers
import SwiftUI


@Model
class TaskDatas {
    var taskItems: [TaskItem]?
    
    init(taskItems: [TaskItem]? = nil) {
        self.taskItems = taskItems
    }
}

struct TaskItem: Equatable, Identifiable, Codable, Transferable {
    static var transferRepresentation: some TransferRepresentation {
        CodableRepresentation(for: TaskItem.self, contentType: .taskItem)
    }
    var id: UUID = UUID()
    var name: String
    var category: String
    var isPinned: Bool {
        return category == "board"
    }
    var isDone: Bool
}

extension UTType {
    static var taskItem = UTType(exportedAs: "com.sujileelea.DragDrop.taskItem")
}

