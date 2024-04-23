//
//  BoardPage.swift
//  DragDrop
//
//  Created by Suji Lee on 3/21/24.
//

import SwiftUI
import SwiftData

struct BoardPage: View {
    @Environment(\.modelContext) private var modelContext
    //    @Query private var tasks: [Task]
    let today = Date().formatted(.iso8601.year().month().day())
    @State var taskItems: [TaskItem] = [TaskItem(id: "1", name: "one", category: "iOS", isPinned: true, isDone: false), TaskItem(id: "2", name: "two", category: "Year", isPinned: true, isDone: false), TaskItem(id: "3", name: "three", category: "iOS", isPinned: true, isDone: false)]
    @State private var draggingItem: TaskItem?
    
    var body: some View {
        NavigationView {
            VStack {
                //Header
                VStack(spacing: 5) {
                    Text("Today is")
                        .foregroundStyle(Color.gray)
                    Text(today)
                        .font(.system(size: 24, weight: .semibold))
                }
                .padding()
                .padding(.top, 0)
                VStack {
                //Edit Button
                HStack {
                    Spacer()
                    EditButton()
                    .foregroundStyle(Color.gray)
                }
                //Board List
                    VStack {
                        ScrollView {
                            ForEach(taskItems) { taskItem in
                                TaskCard(task: taskItem, isOnBoard: true)
                                    .listRowBackground(Color.clear)
                                    .draggable(taskItem) {
                                        /// Custom Preview View
                                        EmptyView()
                                            .onAppear {
                                                draggingItem = taskItem
                                            }
                                    }
                                    .dropDestination(for: TaskItem.self) { items, location in
                                        draggingItem = nil
                                        return false
                                    } isTargeted: { status in
                                        if let draggingItem, status, draggingItem != taskItem {
                                            /// Moving Color from source to destination
                                            if let sourceIndex = taskItems.firstIndex(of: draggingItem),
                                               let destinationIndex = taskItems.firstIndex(of: taskItem) {
                                                withAnimation(.bouncy) {
                                                    let sourceItem = taskItems.remove(at: sourceIndex)
                                                    taskItems.insert(sourceItem, at: destinationIndex)
                                                }
                                            }
                                        }
                                    }
                            }
                        }
                        .cornerRadius(10)
                    }
                }
                .padding(.horizontal)
            }
            .toolbar {
                // CategoryList show Button
                ToolbarItem(placement: .topBarTrailing) {
                    Image(systemName: "line.3.horizontal")
                        .foregroundStyle(Color.black)
                        .font(.system(size: 19, weight: .semibold))
                }
            }
        }
    }
}

#Preview {
    BoardPage()
}
