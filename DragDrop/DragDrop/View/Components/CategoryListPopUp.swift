//
//  CategoryListPopUp.swift
//  DragDrop
//
//  Created by byeoungjik on 5/7/24.
//

import SwiftUI

struct CategoryListPopUp: View {
    @State var seletedCategory: String?
//    var board: Board? = Board(pinnedTasks: [TaskItem(id: "", name: "WWDC - SwiftData Session #1", category: "iOS", isDone: false)])
    var body: some View {
        ZStack {
//            List(board!.categories) { category in
//                Text(category.name)
//            }
            List(0..<5) { index in
                Text("Item \(index)")
            }
            .listRowSeparator(.hidden)
            .scrollContentBackground(.hidden)
            .background(.white)
        }
    }
}

#Preview {
    CategoryListPopUp()
}
