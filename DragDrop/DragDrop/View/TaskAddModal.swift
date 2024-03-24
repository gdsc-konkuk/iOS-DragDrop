//
//  TaskAddModal.swift
//  DragDrop
//
//  Created by Suji Lee on 3/21/24.
//

import SwiftUI

struct TaskAddModal: View {
    var body: some View {
        VStack {
            HStack {
                // cancel button
                Button {} label: {
                    Text("취소")
                }
                Spacer()
                // save button
                Button {} label: {
                    Text("저장")
                }
            }
            .font(.system(size: 15))

            // category select view
            HStack(spacing: 5) {
                // category name
                Text("iOS")
                    .font(.system(size: 25, weight: .semibold))
                // select button
                Button {} label: {
                    Image(systemName: "chevron.down")
                        .frame(width: 18, height: 10)
                }
            }
            Divider()
                .frame(height: 1)
                .background(.black)
        }
        .foregroundStyle(.black)
        .padding()
    }
}

#Preview {
    TaskAddModal()
}
