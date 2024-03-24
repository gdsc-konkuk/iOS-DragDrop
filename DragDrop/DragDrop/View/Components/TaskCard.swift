//
//  TaskCard.swift
//  DragDrop
//
//  Created by Suji Lee on 3/21/24.
//

import SwiftUI

struct TaskCard: View {
    var task: Task
    var body: some View {
        HStack {
            Image(systemName: "line.3.horizontal")
            Text(task.name)
        }
        .overlay {
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.gray)
        }
    }
}

#Preview {
    TaskCard(task: Task(name: "iOS", category: "iOS", isPinned: false, isDone: false))
}
