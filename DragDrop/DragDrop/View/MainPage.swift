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

struct MainPageTaskCard: View {
    var task: Task
    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: "line.3.horizontal")
            Text(task.name)
                .font(.system(size: 14))
            Spacer()
        }
        .padding()
        .frame(width: screenWidth * 0.8, height: 50)
        .background(Color.white)
    }
}

struct MainPage: View {
    //@Query private var tasks: [Task]
    
    var tasks: [Task] = [Task(name: "Vision Pro 3D Modeling", category: "iOS", isPinned: false, isDone: false), Task(name: "iOS", category: "iOS", isPinned: false, isDone: false)]
    
    let today = Date().formatted(.iso8601.year().month().day())
    
    var body: some View {
        
        NavigationView {
            VStack {
                
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Image(systemName: "line.3.horizontal")
                        .foregroundStyle(Color.black)
                        .font(.system(size: 19, weight: .semibold))
                }
            }
        }
        .frame(height: 25)
        
        VStack(spacing: 5) {
            Text("Today is")
                .foregroundStyle(Color.gray)
            Text(today)
                .font(.system(size: 24, weight: .semibold))
        }
        .padding()
        .padding(.top, 0)
        
        
        HStack(alignment: .center) {
            Spacer()
            VStack(alignment: .trailing) {
                EditButton()
            }
            .foregroundStyle(Color.gray)
        }
        .padding(.trailing, 20)
        
        List {
            ForEach(tasks) { task in
                // TaskCard code 논의 필요
                MainPageTaskCard(task: task)
                    .cornerRadius(10)
                    .listRowBackground(Color.clear)
            }
            .listRowSeparator(.hidden)
        }
        .cornerRadius(10)
        .padding(.horizontal)
    }
    
    private func addTask() {
        
    }
    
    private func deleteTask() {
        
    }
}




#Preview {
    MainPage()
}
