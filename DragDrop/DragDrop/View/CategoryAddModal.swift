//
//  CategoryAddModal.swift
//  DragDrop
//
//  Created by Suji Lee on 3/26/24.
//

import SwiftUI

struct CategoryAddModal: View {
    @State private var title: String = ""
    
    var body: some View {
        NavigationView {
            VStack(spacing: 15) {
                // category header
                VStack {
                    Text("Category")
                        .font(.system(size: 25, weight: .semibold))
                    Divider()
                        .frame(height: 2)
                        .background(.black)
                }

                // task title input view
                VStack(alignment: .trailing, spacing: 5) {
                    HStack {
                        VStack(alignment: .leading) {
                            Text("name")
                                .font(.system(size: 20, weight: .semibold))
                            // title textfield
                            TextField("", text: $title)
                                .font(.system(size: 15))
                                .onChange(of: title) { _, _ in
                                    if title.count > 12 {
                                        title = String(title.prefix(12))
                                    }
                                }
                        }
                        Spacer()
                    }
                    Divider()
                        .frame(height: 0.5)
                        .background(.hexADADAD)
                    // title count
                    Text("\(title.count)/12")
                        .font(.system(size: 14))
                        .foregroundStyle(title.count >= 12 ? .hexC53232 : .hex393939)
                }
                .padding(.top, 60)
                
                Spacer()

            }
            .padding()
            .toolbar {
                // cancel button
                ToolbarItem(placement: .topBarLeading) {
                    Button {} label: {
                        Text("취소")
                            .font(.system(size: 15))
                    }
                }
                // save button
                ToolbarItem(placement: .topBarTrailing) {
                    Button {} label: {
                        Text("저장")
                            .font(.system(size: 15))
                    }
                }
            }
            .foregroundStyle(.black)
        }
    }
}

#Preview {
    CategoryAddModal()
}
