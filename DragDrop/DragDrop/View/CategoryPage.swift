//
//  CategoryPage.swift
//  DragDrop
//
//  Created by Suji Lee on 3/21/24.
//

import SwiftUI
import SwiftData

struct CategoryPage: View {
    
    private let screenWidth = UIScreen.main.bounds.width
    @Environment(\.modelContext) private var modelContext
    @FocusState private var focusedField: FocusedField?
    @Query private var tasks: [Task]
    
    
    var body: some View {
        VStack {
            //Add Task Button
            HStack() {
                Spacer()
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Image(systemName: "plus")
                        .foregroundColor(.black)
                })
                .padding(.horizontal, 30)
            }
            //DropDownPicker
            
            Rectangle()
                .frame(width: screenWidth * 0.85, height: 1)
            //Swipe Pined View
            List() {
                ForEach(tasks, id: \.self) { task in
                    //Swipe Task Card List View
                    TaskCard(task: task)
                        .frame(width: screenWidth * 0.85, height: 46)
                        .swipeActions(edge: .leading, allowsFullSwipe: true, content: {
                            Button(action: {}, label: {
                                Image(systemName: "pin.fill")
                                    .padding()
                                    .foregroundColor(.black)
                            })
                            .tint(Color.hexFAD167)
                        })
                        .swipeActions(edge: .trailing, allowsFullSwipe: true, content: {
                            HStack(spacing: 0) {
                                Button(action: {}, label: {
                                    Image(systemName: "trash.fill")
                                        .padding()
                                        .foregroundColor(.black)
                                })
                                .tint(Color.hexC53232)
                                Button(action: {}, label: {
                                    Image(systemName: "checkmark")
                                        .padding()
                                        .foregroundColor(.black)
                                })
                                .tint(Color.hex2C8616)
                            }
                        })
                }
            }
            Spacer()
        }
    }
}

private enum FocusedField {
    case name
}

#Preview {
    CategoryPage()
}
