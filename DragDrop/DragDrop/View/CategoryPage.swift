
import SwiftUI
import SwiftData

struct CategoryPage: View {
    //    var taskItem: [TaskItem]
    //    @Binding var seletedCategory: Category
    //    @Query(filter: #Predicate<TaskData> { task in
    //        task.taskItems.$0.name
    //    }, sort: \TaskData.taskItems) let category: TaskData
    @State var isEditTask = false
    @State var isAddTask = false
    @State var showCategory = false
    let category: Category
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Spacer()
                    Button(action: {
                        isAddTask = true
                    }, label: {
                        Image(systemName: "plus")
                            .foregroundColor(.black)
                    })
                    .sheet(isPresented: $isAddTask, content: {
                        TaskAddModal()
                    })
                }
                .padding()
                
                Button(action: {
                    showCategory.toggle()
                }, label: {
                    HStack {
                        Text(category.name)
                            .font(.system(size: 25, weight: .semibold))
                        Image(systemName: "chevron.down")
                    }
                    .foregroundColor(.black)
                })
                
                Rectangle()
                    .frame(width: screenWidth * 0.85, height: 2)
                    .foregroundColor(.black)
                
                //task list
                List(category.taskItems ?? [TaskItem(id: "0", name: "WWDC - SwiftData Session #1", category: "iOS", isDone: false)]) { taskItem in
            
                    Button(action: {
                        isEditTask = true
                    }, label: {
                        HStack {
                            Image(systemName: "line.3.horizontal")
                                .foregroundColor(.hexADADAD)
                            Text(taskItem.name)
                                .foregroundStyle(.black)
                        }
                    })
                    .swipeActions(edge: .leading, allowsFullSwipe: true, content: {
                        //pinned action
                        Button(action: {}, label: {
                            Image(systemName: "pin.fill")
                                .rotationEffect(.degrees(30))
                                .padding()
                                .foregroundColor(.black)
                        })
                        .tint(Color.hexFAD167)
                    })
                    .swipeActions(edge: .trailing, allowsFullSwipe: true, content: {
                        //confirm action
                        Button(action: {}, label: {
                            Image(systemName: "checkmark")
                                .padding()
                                .foregroundColor(.black)
                        })
                        .tint(Color.hex2C8616)
                        //trash action
                        Button(action: {}, label: {
                            Image(systemName: "trash.fill")
                                .padding()
                                .foregroundColor(.black)
                        })
                        .tint(Color.hexC53232)
                    })
                    .sheet(isPresented: $isEditTask, content: {
                        TaskEditModal()
                    })
                }
            }
            .listRowSeparator(.hidden)
            .scrollContentBackground(.hidden)
            
            if showCategory {
                CategoryListPopUp()
                    .frame(width: 154, height: 170)
                    .overlay(content: {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(lineWidth: 1.0)
                            .foregroundColor(.hexADADAD)
                    })
                    .position(x: screenWidth * 0.73, y: screenHeight * 0.25)
                    .background(showCategory ? .black.opacity(0.3): .clear)
                    .onTapGesture {
                        if showCategory == true {
                            showCategory = false
                        }
                    }
            }
        }
    }
}

#Preview {
    CategoryPage(category: Category(name: "iOS"))
}
