//
//  DropDownPicker.swift
//  DragDrop
//
//  Created by byeoungjik on 3/25/24.
//

import SwiftUI


struct DropDownPicker: View {
    @Binding var selection: String?
    var options: [String]
    var maxWidth: CGFloat = 180
    
    @State var showDropdown = false
    
    @SceneStorage("drop_down_zindex") private var index = 1000.0
    @State var zindex = 1000.0
    
    var body: some View {
        GeometryReader {
            let size = $0.size
            
            VStack(spacing: 0) {
                HStack {
                    Text(selection == nil ? "Select" : selection!)
                        .foregroundColor(selection != nil ? .black : .gray)
                    
                    Spacer(minLength: 0)
                    
                    Image(systemName:"chevron.down")
                        .font(.title3)
                        .foregroundColor(.gray)
                        .rotationEffect(.degrees((showDropdown ? -180 : 0)))
                }
                .padding(.horizontal, 15)
                .frame(width: 180, height: 50)
                .background(.white)
                .contentShape(.rect)
                .onTapGesture {
                    index += 1
                    zindex = index
//                    바운스가 적은
                    withAnimation(.snappy) {
                        showDropdown.toggle()
                    }
                }
                .zIndex(10)
                
                if showDropdown {
                    OptionsView()
                }
            }
            .clipped()
            .background(.white)
            .cornerRadius(10)
            .overlay {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(.gray)
            }
            .frame(height: size.height, alignment: .top)
            
        }
        .frame(width: maxWidth, height: 50)
        .zIndex(zindex)
    }
    func OptionsView() -> some View {
        VStack(spacing: 0) {
            ForEach(options, id: \.self) { option in
                Text(option)
                    .foregroundStyle(selection == option ? Color.primary : Color.gray)
                    .animation(.none, value: selection)
                    .frame(height: 40)
                    .contentShape(.rect)
                    .padding(.horizontal, 15)
                    .onTapGesture {
                        withAnimation(.snappy) {
                            selection = option
                            showDropdown.toggle()
                        }
                    }
            }
        }
        .transition(.move(edge: .top))
        .zIndex(1)
    }
}

//#Preview {
//    DropDownPicker( selection: Binding<String?>, options: [
//        "iOS",
//        "GDSC",
//        "CS",
//        "PathPal"
//    ])
//}
