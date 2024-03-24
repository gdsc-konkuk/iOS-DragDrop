//
//  MainPage.swift
//  DragDrop
//
//  Created by Suji Lee on 3/21/24.
//

import SwiftUI
import SwiftData

let screenWidth = UIScreen.main.bounds.width
let screenHeight = UIScreen.main.bounds.height

struct MainPage: View {
    //@Query private var tasks: [Task]
    
    var tasks: [Task] = [Task(name: "Vision Pro 3D Modeling", category: "iOS", isPinned: false, isDone: false), Task(name: "iOS", category: "iOS", isPinned: false, isDone: false), Task(name: "iOS", category: "iOS", isPinned: false, isDone: false)]
    
    let today = Date().formatted(.iso8601.year().month().day())
    
    var body: some View {
        ZStack {
            VStack(spacing: 5) {
                Text("Today is")
                    .foregroundStyle(Color.gray)
                Text(today)
                    .font(.system(size: 24, weight: .semibold))
            }
            .padding()
            
            VStack {
                Menu {
                    Button("환경설정", action: {})
                    Button("로그아웃", action: {})
                } label: {
                    Image(systemName: "line.horizontal.3")
                        .foregroundStyle(Color.black)
                        .font(.system(size: 20))
                }
            }
            // 이걸 어떻게 위치를 잡을 지 항상 고민
            .offset(x: screenWidth * 0.4, y: screenHeight * -0.03)
        }
        
        NavigationView {
            List {
                ForEach(tasks) { task in
                    // TaskCard UI 수정 가능하면 맞출 예정
                    TaskCard(task: task)
                        .listRowBackground(Color.clear)
                        .frame(width: screenWidth * 0.8)
                }
                .listRowSeparator(.hidden)
            }
            .cornerRadius(10)
            .padding(.horizontal)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                        .padding(.trailing, 10)
                        .font(.system(size: 15))
                        .foregroundStyle(Color.gray)
                }
            }
        }
        
    }
    
    private func addTask() {
        
    }
    
    private func deleteTask() {
        
    }
    
}

#Preview {
    MainPage()
}
