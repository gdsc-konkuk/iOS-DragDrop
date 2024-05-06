////
////  CategoryPage.swift
////  DragDrop
////
////  Created by Suji Lee on 3/21/24.
////
//
//import SwiftUI
//import SwiftData
//import PopupView
//
//struct CategoryPage: View {
//
//    private let screenWidth = UIScreen.main.bounds.width
//    @Environment(\.modelContext) private var modelContext
//    @FocusState private var focusedField: FocusedField?
//    @Query private var tasks: [Task]
//    @Binding var selection: String?
//    @State var isShowingCategoryList = false
//
//    var body: some View {
//        ZStack {
//            VStack {
//                //Add Task Button
//                HStack {
//                    Spacer()
//                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
//                        Image(systemName: "plus")
//                            .foregroundColor(.black)
//                    })
//                    .padding(.horizontal, 30)
//                }
//
//                //DropDownPicker
//                HStack {
//                    Text(selection ?? "")
//                        .foregroundColor(.black)
//                        .font(.system(size: 25, weight: .semibold))
//                    Button(action: {
//                        isShowingCategoryList.toggle()
//                    }, label: {
//                        Image(systemName:"chevron.down")
//                            .foregroundColor(.black)
//                            .rotationEffect(.degrees((isShowingCategoryList ? -180 : 0)))
//                    })
//                }
//
//                // Divider
//                Rectangle()
//                    .frame(width: screenWidth * 0.85, height: 1)
//
//                //Swipe Task Card List View
//                List() {
//                    ForEach(tasks, id: \.self) { task in
//                        HStack {
//                            TaskCard(task: task)
//                                .swipeActions(edge: .leading, allowsFullSwipe: true, content: {
//                                    //pinned action
//                                    Button(action: {}, label: {
//                                        Image(systemName: "pin.fill")
//                                            .rotationEffect(.degrees(30))
//                                            .padding()
//                                            .foregroundColor(.black)
//                                    })
//                                    .tint(Color.hexFAD167)
//                                })
//                                .swipeActions(edge: .trailing, allowsFullSwipe: true, content: {
//                                    //confirm action
//                                    Button(action: {}, label: {
//                                        Image(systemName: "checkmark")
//                                            .padding()
//                                            .foregroundColor(.black)
//                                    })
//                                    .tint(Color.hex2C8616)
//                                    //trash action
//                                    Button(action: {}, label: {
//                                        Image(systemName: "trash.fill")
//                                            .padding()
//                                            .foregroundColor(.black)
//                                    })
//                                    .tint(Color.hexC53232)
//                                })
//                                .frame(width: screenWidth * 0.85, height: 46)
//                        }
//                    }
//                    .listRowSeparator(.hidden)
//                }
//                .background(.white)
//                .scrollContentBackground(.hidden)
//                .padding()
//                Spacer()
//            }
//        }
//        .popup(isPresented: $isShowingCategoryList) {
//            List() {
//                ForEach(tasks, id: \.self) { task in
//                    Button(action: {
//                        selection = task.category
//                        isShowingCategoryList.toggle()
//                    }, label: {
//                        Text(task.category)
//                            .foregroundColor(.black)
//                    })
//                }
//            }
//            .scrollContentBackground(.hidden)
//            .frame(width: 154, height: 170)
//            .padding(.vertical, 60)
//            .background(.opacity(0.0), ignoresSafeAreaEdges: .all)
//
//        } customize: {
//            $0
//                .type(.floater())
//                .position(.topTrailing)
//                .animation(.spring())
//                .closeOnTapOutside(true)
//                .backgroundColor(.black.opacity(0.5))
//        }
//    }
//
//}
//
//private enum FocusedField {
//    case name
//}
//
//#Preview {
//    let config = ModelConfiguration(isStoredInMemoryOnly: true)
//    let container = try! ModelContainer(for: Task.self, configurations: config)
//    for i in 1..<5 {
//        let taskEx = Task(name: "Vision Pro 3D Modeling", category: "iOS\(i)", isPinned: false, isDone: false)
//        container.mainContext.insert(taskEx)
//    }
//    return CategoryPage(selection: .constant("iOS"))
//            .modelContainer(container)
//}
import SwiftUI
import SwiftData

struct CategoryPage: View {
    //    var taskItem: [TaskItem]
    //    @Binding var seletedCategory: Category
    //    @Query(filter: #Predicate<TaskData> { task in
    //        task.taskItems.$0.name
    //    }, sort: \TaskData.taskItems) let category: TaskData
    let category: Category
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button(action: {}, label: {
                    Image(systemName: "plus")
                        .foregroundColor(.black)
                })
            }
            .padding()
            
            Button(action: {}, label: {
                HStack {
                    Text("iOS")
                        .font(.system(size: 25, weight: .semibold))
                    Image(systemName: "chevron.down")
                }
                .foregroundColor(.black)
            })
            
            Rectangle()
                .frame(width: screenWidth * 0.85, height: 2)
                .foregroundColor(.black)
            List(category.taskItems ?? [TaskItem(id: "", name: "WWDC - SwiftData Session #1", category: "iOS", isDone: false)]) { taskItem in
                
                Button(action: {}, label: {
                    HStack {
                        Image(systemName: "line.3.horizontal")
                            .foregroundColor(.hexADADAD)
                        Text(taskItem.name)
                            .foregroundStyle(.black)
                    }
                })
                
            }
        }
        .listRowSeparator(.hidden)
        .scrollContentBackground(.hidden)
    }
}

#Preview {
    CategoryPage(category: Category(name: ""))
}
