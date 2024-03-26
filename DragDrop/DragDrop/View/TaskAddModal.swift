//
//  TaskAddModal.swift
//  DragDrop
//
//  Created by Suji Lee on 3/21/24.
//

import SwiftUI

struct TaskAddModal: View {
    @State private var title: String = ""
    @State private var isOnPinTask: Bool = false
    @State private var isOnCompleteTask: Bool = false
    
    var body: some View {
        NavigationView {
            VStack(spacing: 15) {
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
                    Toggle(isOn: $isOnPinTask, label: {
                        Text("pin this task")
                    })
                    Toggle(isOn: $isOnCompleteTask, label: {
                        Text("complete this task")
                    })
                }
                .font(.system(size: 20, weight: .medium))
                .padding(.top, 30)
                Spacer()
            }
            .padding()
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    // cancel button
                    Button {} label: {
                        Text("취소")
                            .font(.system(size: 15))
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    // save button
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
    TaskAddModal()
}
