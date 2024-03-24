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
                Button {
                    
                } label: {
                    Text("취소")
                }
                Spacer()
                // save button
                Button {
                    
                } label: {
                    Text("저장")
                }
            }
            .font(.system(size: 15))
        }
        .foregroundStyle(.black)
        .padding()
    }
}

#Preview {
    TaskAddModal()
}
