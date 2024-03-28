//
//  DropDownPicker.swift
//  DragDrop
//
//  Created by byeoungjik on 3/25/24.
//

import SwiftUI


struct DropDownPicker: View {
    @Binding var selection: String?
    var options: [Category]
    var maxWidth: CGFloat = 180
    
    @State var showDropdown = false
    
    var body: some View {
        GeometryReader { geometry in
            
            VStack(spacing: 0) {
                HStack {
                    Text(selection == nil ? "" : selection!)
                        .foregroundColor(selection != nil ? Color.black : Color.gray)
                        .font(.system(size: 25, weight: .semibold))
                    
//                    Spacer(maxLength: 0)
                    
                    Image(systemName:"chevron.down")
                        .foregroundColor(Color.gray)
                        .rotationEffect(.degrees((showDropdown ? -180 : 0)))
                        .onTapGesture {
                            withAnimation(.snappy) {
                                showDropdown.toggle()
                            }
                        }
                }
                .padding(.horizontal, 15)
                .frame(width: 180, height: 50)
                .background(Color.white)
                .contentShape(.rect)
                
                if showDropdown {
                        OptionsView()
                }
            }
            .clipped()
            .background(.white)
            .cornerRadius(10)
            .overlay {
                if showDropdown {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray)
                }
                else {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.white)
                }
            }
            
        }
        .frame(width: maxWidth, height: 50)
    }
    func OptionsView() -> some View {
        VStack(spacing: 0) {
            ForEach(options, id: \.self) { option in
                Button(action: {
                    withAnimation(.snappy) {
                        selection = option.name
                        showDropdown.toggle()
                    }
                }, label: {
                    Text(option.name)
                        .foregroundColor(.gray)
                })
                .frame(height: 40)
                .padding(.horizontal, 15)
            }
        }
        .transition(.move(edge: .top))
    }
}

//#Preview {
//    DropDownPicker( selection: .constant(""), options: [
//        "iOS",
//        "GDSC",
//        "CS",
//        "PathPal"
//        
//    ])
//}
