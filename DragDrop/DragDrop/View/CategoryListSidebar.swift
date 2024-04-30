//
//  CategoryListSidebar.swift
//  DragDrop
//
//  Created by Suji Lee on 3/26/24.
//

import SwiftUI

struct CategoryListSidebar: View {
    @Environment(\.modelContext) private var modelContext
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
    
    func addCategory(name: String) {
        withAnimation {
            let newCategory = Category(name: name)
            modelContext.insert(newCategory)
        }
    }
}

#Preview {
    CategoryListSidebar()
}
