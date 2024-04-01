//
//  CategoryHeader.swift
//  DragDrop
//
//  Created by 가은 on 4/1/24.
//

import SwiftUI

struct CategoryHeader: View {
    var body: some View {
        VStack {
            HStack(spacing: 5) {
                // category name
                Text("iOS")
                    .font(.system(size: 25, weight: .semibold))
                // select button
                Button {} label: {
                    Image(systemName: "chevron.down")
                        .frame(width: 18, height: 10)
                }
            }
            Divider()
                .frame(height: 1)
                .background(.black)
        }
        .foregroundStyle(.black)
    }
}

#Preview {
    CategoryHeader()
}
