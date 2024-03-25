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
            
            //Pined Task
            
            //Confirmed Task
            
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
