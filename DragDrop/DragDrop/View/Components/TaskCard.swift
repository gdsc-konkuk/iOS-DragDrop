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
    
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(.white)
                .frame(width: screenWidth * 0.8, height: 60)
                .overlay {
                    if !isOnBoard {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.gray)
                    }
                    // Content
                    HStack(spacing: 17) {
                        Image("hamberger")
                            .onTapGesture {
                                //drag & drop feature
                            }
                        VStack(alignment: .leading) {
                            Text(task.category)
                                .foregroundColor(.hexB6B6B6)
                                .font(.system(size: 13))
                        Text(task.name)
                            .font(.system(size: 16, weight: .regular))
                        }
                        Spacer()
                    }
                    .padding(.leading, 15)
                }
        }
    }
}

#Preview {
    TaskCard(task: Task(name: "preview", category: "Preview"), isOnBoard: false)
}
