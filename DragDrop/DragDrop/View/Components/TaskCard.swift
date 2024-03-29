//
//  TaskCard.swift
//  DragDrop
//
//  Created by Suji Lee on 3/21/24.
//

import SwiftUI

struct TaskCard: View {
    var task: Task
    var isOnBoard: Bool?
    
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(.white)
                .frame(width: screenWidth * 0.75, height: 50)
                .overlay {
                    if let isOnBoard = isOnBoard  {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.gray)
                    }
                    HStack(spacing: 10) {
                        Image(systemName: "line.3.horizontal")
                            .onTapGesture {
                                //drag & drop feature
                            }
                        Text(task.name)
                            .font(.system(size: 16, weight: .regular))
                        Spacer()
                    }
                    .padding()
                }
        }
    }
}

#Preview {
    TaskCard(task: Task(name: "iOS", category: "iOS", isPinned: false, isDone: false))
}
