//
//  ColorView.swift
//  TransferableDemo
//
//  Created by Tatiana Kornilova on 20.11.2022.
//

import SwiftUI

struct ColorView: View {
    var colorItem: ColorItem
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            Color(red: colorItem.red, green: colorItem.green, blue: colorItem.blue)
            
            Color.black.opacity(0.3)
                .frame(height:50)
            
            Text(colorItem.name)
                .font(.title2)
                .fontWeight(.bold)
                .padding()
                .foregroundColor(.white)
        }
        .cornerRadius(8)
    }
}

struct ColorView_Previews: PreviewProvider {
    static var previews: some View {
        ColorView()
    }
}
