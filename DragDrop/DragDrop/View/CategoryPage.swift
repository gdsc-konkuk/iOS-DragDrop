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
            //TaskCard List
            List(tasks, id: \.self) { task in
                TaskCard(task: task)
            }
            //Pined Task
            RoundedRectangle(cornerRadius: 10)
            //                .foregroundColor(Color.hexFAD167)
                .stroke(lineWidth: 1.0)
                .frame(width: screenWidth * 0.85, height: 46)
                .overlay(alignment: .leading, content: {
                    HStack(spacing: 0) {
                        Button(action: {}, label: {
                            Image(systemName: "pin.fill")
                                .padding()
                                .foregroundColor(.black)
                            
                        })
                        .background(Color.hexFAD167)
                        
                    }
                    
                })
            //Confirmed Task
            RoundedRectangle(cornerRadius: 10)
                .stroke(lineWidth: 1.0)
                .frame(width: screenWidth * 0.85, height: 46)
                .overlay(alignment: .trailing, content: {
                    HStack(spacing: 0) {
                        Button(action: {}, label: {
                            Image(systemName: "trash.fill")
                                .padding()
                                .foregroundColor(.black)
                        })
                        .background(Color.hexC53232)
                        Button(action: {}, label: {
                            Image(systemName: "checkmark")
                                .padding()
                                .foregroundColor(.black)
                        })
                        .background(Color.hex2C8616)
                        
                    }
                })
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
