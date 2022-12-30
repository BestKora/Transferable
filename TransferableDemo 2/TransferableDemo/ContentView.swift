//
//  ContentView.swift
//  TransferableDemo
//
//  Created by Gabriel Theodoropoulos.
//  https://serialcoder.dev
//

import SwiftUI

struct ContentView: View {
    @StateObject private var colors = Colors()
    @State private var draggedColorItem: ColorItem?
    @State private var borderColor: Color = .black
    @State private var borderWidth: CGFloat = 1.0
    @State private var colorName: String = ""
    
    var body: some View {
        HStack {
            VStack {
                ForEach(colors.items, id: \.id) { colorItem in
                    ColorView(colorItem: colorItem)
                }
            }
            .frame(width: 250)
            .frame(maxHeight: 750)
            .padding(.leading)
 
 
            Divider().padding(.horizontal, 75)
 
            VStack {
                VStack {
                    if draggedColorItem != nil {
                        ColorView(colorItem: draggedColorItem!)
                    } else {
                        Text("Drag and Drop a color here!")
                            .foregroundColor(.secondary)
                    }
                }
                .frame(width: 280, height: 220)
                .background(Color.gray.opacity(0.25))
                .border(borderColor, width: borderWidth)
                .padding(.trailing)
                .dropDestination(for: ColorItem.self) { items, location in
                    draggedColorItem = items.first
                    print(location)
                    return true
                } isTargeted: { inDropArea in
                    print("In drop area", inDropArea)
                    borderColor = inDropArea ? .accentColor : .black
                    borderWidth = inDropArea ? 10.0 : 1.0
                }
                
                TextField("", text: $colorName)
                    .multilineTextAlignment(.center)
                    .frame(width: 180, height: 60)
                    .border(Color.gray, width: 2)
                    .padding(.trailing, 20)
                    .padding(.top, 50)
                    .dropDestination(for: String.self) { items, location in
                        colorName = items.first ?? ""
                        return items.first != nil
                    } isTargeted: { inDropArea in
                        if inDropArea {
                            colorName = ""
                        }
                    }
                    
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
