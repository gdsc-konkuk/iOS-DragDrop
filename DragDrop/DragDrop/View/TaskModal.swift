//
//  TaskModal.swift
//  DragDrop
//
//  Created by 가은 on 4/1/24.
//

import SwiftUI

struct TaskModal: View {
    @State private var title: String = ""
    @State private var isPinned: Bool = false
    var isTaskEditModal: Bool = false

    var body: some View {
        NavigationView {
            VStack(spacing: 15) {
                // category header
                CategoryHeader()

                // task title input view
                VStack(alignment: .trailing, spacing: 5) {
                    HStack {
                        VStack(alignment: .leading) {
                            Text("title")
                                .font(.system(size: 20, weight: .semibold))
                            // title textfield
                            TextField("", text: $title)
                                .font(.system(size: 15))
                                .onChange(of: title) { _, _ in
                                    if title.count > 30 {
                                        title = String(title.prefix(30))
                                    }
                                }
                        }
                        Spacer()
                    }
                    Divider()
                        .frame(height: 0.5)
                        .background(.black)
                    // title count
                    if title.count >= 30 {
                        Text("\(title.count)/30")
                            .font(.system(size: 14))
                            .foregroundStyle(.hexC53232)
                    } else {
                        Text("\(title.count)/30")
                            .font(.system(size: 14))
                            .foregroundStyle(.hex393939)
                    }
                }
                .padding(.top, 60)

                VStack {
                    Toggle(isOn: $isPinned, label: {
                        Text("pin this task")
                    })
                }
                .font(.system(size: 20, weight: .medium))
                .padding(.top, 30)
                Spacer()

                // Delete button
                if isTaskEditModal {
                    Button {} label: {
                        Image(systemName: "trash")
                            .resizable()
                            .foregroundStyle(.hexC53232)
                            .frame(width: 30, height: 38)
                    }
                }
            }
            .padding()
            .toolbar {
                // cancel button
                ToolbarItem(placement: .topBarLeading) {
                    Button {} label: {
                        Text("취소")
                            .font(.system(size: 15))
                    }
                }
                // save button
                ToolbarItem(placement: .topBarTrailing) {
                    Button {} label: {
                        Text("저장")
                            .font(.system(size: 15))
                    }
                }
            }
            .foregroundStyle(.black)
        }
    }
}

#Preview {
    TaskModal()
}
