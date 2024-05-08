//
//  MainPage.swift
//  DragDrop
//
//  Created by Suji Lee on 3/21/24.
//

import SwiftUI
import SwiftData

struct MainPage: View {
    //    @Query private var tasks: [Task]
    let today = Date().formatted(.iso8601.year().month().day())
    var tasks: [Task] = [Task(name: "one", category: "One"), Task(name: "two", category: "Two")]
    
    var body: some View {
        NavigationView {
            VStack {
                //Header
                VStack(spacing: 5) {
                    Text("Today is")
                        .foregroundStyle(Color.gray)
                    Text(today)
                        .font(.system(size: 24, weight: .semibold))
                }
                .padding()
                .padding(.top, 0)
                VStack {
                //Edit Button
                HStack {
                    Spacer()
                    EditButton()
                    .foregroundStyle(Color.gray)
                }
                //Board List
                    VStack {
                        List {
                            ForEach(tasks) { task in
                                TaskCard(task: task, isOnBoard: true, isPinned: false)
                                    .listRowBackground(Color.clear)
                                    .listRowInsets(.init(top: 10, leading: 1, bottom: 0, trailing: 1))
                            }
                            .listRowSeparator(.hidden)
                        }
                        .cornerRadius(10)
                    }
                }
                .padding(.horizontal)
            }
            .toolbar {
                // CategoryList show Button
                ToolbarItem(placement: .topBarTrailing) {
                    Image(systemName: "line.3.horizontal")
                        .foregroundStyle(Color.black)
                        .font(.system(size: 19, weight: .semibold))
                }
            }
        }
    }
}

#Preview {
    MainPage()
}
