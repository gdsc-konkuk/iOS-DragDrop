//
//  EditPage.swift
//  DragDrop
//
//  Created by Suji Lee on 3/21/24.
//

import SwiftUI

struct EditPage: View {
    var tasks: [Task] = [Task(name: "Study", category: "iOS"), Task(name: "Vision Pro Study", category: "iOS")]

    var body: some View {
        VStack {
            List {
                ForEach(tasks) { task in
                    TaskCard(task: task, isOnBoard: true)
                        .listRowBackground(Color.clear)
                }
                .listRowSeparator(.hidden)
            }
            .cornerRadius(10)
            .frame(height: screenHeight*0.55)
            .overlay(alignment: .top) {
                Image(systemName: "pin.fill")
                    .frame(width: 15, height: 22)
                    .rotationEffect(.degrees(36.6))
                    .offset(x: 0, y: -7)
            }
        }
        .padding()
    }
}

#Preview {
    EditPage()
}
