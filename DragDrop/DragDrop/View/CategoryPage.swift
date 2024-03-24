//
//  CategoryPage.swift
//  DragDrop
//
//  Created by Suji Lee on 3/21/24.
//

import SwiftUI
import SwiftData

struct CategoryPage: View {
    @Environment(\.modelContext) private var modelContext
    @FocusState private var focusedField: FocusedField?
    @Query private var tasks: [Task]
    

    var body: some View {
        VStack {
            
        }
    }
}

private enum FocusedField {
    case name
}

#Preview {
    CategoryPage()
}
