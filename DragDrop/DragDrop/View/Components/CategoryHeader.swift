//
//  CategoryHeader.swift
//  DragDrop
//
//  Created by 가은 on 4/1/24.
//

import SwiftUI

struct CategoryHeader: View {
    var isOnEditPage: Bool = false
    
    var body: some View {
        VStack(spacing: 10) {
            ZStack(alignment: .trailing) {
                HStack(alignment: .center, spacing: 5) {
                    // category name
                    Text("iOS")
                        .font(.system(size: 25, weight: .semibold))
                    // select button
                    Button {} label: {
                        Image(systemName: "chevron.down")
                            .frame(width: 18, height: 10)
                    }
                }
                .frame(width: screenWidth)
                
                // swipe image
                if isOnEditPage {
                    HStack {
                        Image(systemName: "chevron.forward.2")
                            .foregroundStyle(.hexADADAD)
                    }
                    .padding(.trailing, 20)
                }
            }
            Divider()
                .frame(height: 2)
                .background(.black)
        }
        .foregroundStyle(.black)
    }
}

#Preview {
    CategoryHeader()
}
