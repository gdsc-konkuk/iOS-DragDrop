//
//  MainPage.swift
//  DragDrop
//
//  Created by Suji Lee on 3/21/24.
//

import SwiftUI
import SwiftData

struct MainPage: View {
    @Query private var tasks: [Task]

    var body: some View {
        List {
            ForEach(tasks) { task in
                TaskCard(task: task)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    Button(action: addTask) {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }
        }
        
    }
    
    private func addTask() {
        
    }
    
    private func deleteTask() {
        
    }

}

#Preview {
    MainPage()
}
