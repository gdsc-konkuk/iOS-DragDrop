//
//  EditPage.swift
//  DragDrop
//
//  Created by Suji Lee on 3/21/24.
//

import SwiftUI

struct EditPage: View {
    var pinnedTasks: [Task] = [Task(name: "Study", category: "iOS"), Task(name: "Vision Pro Study", category: "iOS")]
    var tasks: [Task] = [Task(name: "WWDC", category: "iOS")]

    var body: some View {
        VStack(spacing: 30) {
            // board
            List {
                ForEach(pinnedTasks) { task in
                    TaskCard(task: task, isOnBoard: true)
                        .listRowBackground(Color.clear)
                }
                .listRowSeparator(.hidden)
            }
            .cornerRadius(10)
            .frame(height: screenHeight*0.5)
            .overlay(alignment: .top) {
                Image(systemName: "pin.fill")
                    .frame(width: 15, height: 22)
                    .rotationEffect(.degrees(36.6))
                    .offset(x: 0, y: -7)
            }
            
            VStack {
                CategoryHeader(isOnEditPage: true)
                List(tasks) { task in
                    TaskCard(task: task, isOnBoard: false)
                        .listRowSeparator(.hidden)
                }
                .listStyle(.plain)
            }
        }
        .padding(20)
    }
}

#Preview {
    EditPage()
}
