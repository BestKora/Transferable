//
//  ColorItem.swift
//  TransferableDemo
//
//  Created by Gabriel Theodoropoulos.
//  https://serialcoder.dev
//

import Foundation
import UniformTypeIdentifiers
import SwiftUI

struct ColorItem: Identifiable, Codable, Transferable {
    var id: Int
    var name: String
    var red: Double
    var green: Double
    var blue: Double
    
    static var transferRepresentation: some TransferRepresentation {
        CodableRepresentation(for: ColorItem.self, contentType: .color)
    }
    
    static var sampleColors: [ColorItem] {
        [
            ColorItem(id: 0, name: "Amethyst", red: 0.6, green: 0.364, blue: 0.898),
            ColorItem(id: 1, name: "Magenta Crayola", red: 0.945, green: 0.357, blue: 0.71),
            ColorItem(id: 2, name: "Minion Yellow", red: 0.996, green: 0.894, blue: 0.25),
            ColorItem(id: 3, name: "Capri", red: 0, green: 0.734, blue: 0.976),
            ColorItem(id: 4, name: "Sea Green Crayola", red: 0, green: 0.96, blue: 0.831),
        ]
    }
}


extension UTType {
    static var color = UTType(exportedAs: "REPLACE_THIS_WITH_YOUR_BUNDLE_ID.color")
}


class Colors: ObservableObject {
    @Published var items = [ColorItem]()
 
    init() {
        items.append(contentsOf: ColorItem.sampleColors)
    }
}
