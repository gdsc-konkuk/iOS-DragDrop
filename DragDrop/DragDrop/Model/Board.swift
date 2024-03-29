//
//  Board.swift
//  DragDrop
//
//  Created by Suji Lee on 3/26/24.
//

import Foundation
import SwiftData

@Model
final class Board {
    var pinnedTasks: [Task]
    
    init(pinnedTasks: [Task]) {
        self.pinnedTasks = pinnedTasks
    }
}

