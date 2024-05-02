//
//  TaskCard.swift
//  DragDrop
//
//  Created by Suji Lee on 3/21/24.
//

import SwiftUI

struct TaskCard: View {
    var task: Task
    var isOnBoard: Bool
    var isPinned: Bool

    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(.white)
                .frame(height: 60)
                .overlay {
                    if !isOnBoard {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.gray)
                    }
                    if isPinned {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(.black, lineWidth: 0.5)
                    }
                    // Content
                    HStack(spacing: 17) {
                        Image("hamberger")
                            .onTapGesture {
                                // drag & drop feature
                            }
                        VStack(alignment: .leading) {
                            if isOnBoard {
                                Text(task.category)
                                    .foregroundColor(.hexB6B6B6)
                                    .font(.system(size: 13))
                            }
                            Text(task.name)
                                .font(.system(size: 16, weight: .regular))
                        }
                        Spacer()
                    }
                    .padding(.leading, 15)
                }
                .overlay(alignment: .topLeading) {
                    if isPinned {
                        Image(systemName: "pin.fill")
                            .frame(width: 12, height: 19)
                            .rotationEffect(.degrees(31))
                            .offset(x: 15, y: -9)
                    }
                }
        }
    }
}

#Preview {
    TaskCard(task: Task(name: "preview", category: "Preview"), isOnBoard: false, isPinned: false)
}
