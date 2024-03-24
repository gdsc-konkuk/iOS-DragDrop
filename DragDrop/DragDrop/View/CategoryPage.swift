//
//  CategoryPage.swift
//  DragDrop
//
//  Created by Suji Lee on 3/21/24.
//

import SwiftUI
import SwiftData

struct CategoryPage: View {
    @Environment(\.modelContext) private var modelContext
    @FocusState private var focusedField: FocusedField?
    @Query private var tasks: [Task]
    var name

    var body: some View {
        VStack {
            
        }
    }

    private func addTask() {
        withAnimation {
            let newTask = Task(name: name, category: Category, isPinned: false, isDone: false)
            modelContext.insert(newTask)
        }
    }

    private func deleteTask(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(items[index])
            }
        }
    }
}

private enum FocusedField {
    case name
}

#Preview {
    CategoryPage()
}
