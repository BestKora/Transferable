//
//  DropItem.swift
//  EmojiArt
//
//  Created by Tatiana Kornilova on 22.11.2022.
//

import CoreTransferable
import UniformTypeIdentifiers
import SwiftUI

enum DropItem: Codable,Transferable {
    
    case text(String)
    case non
    case url (URL)
    case data (Data)
    
    static var transferRepresentation: some TransferRepresentation {
        ProxyRepresentation{DropItem.text($0)}
        ProxyRepresentation{DropItem.url($0)}
        ProxyRepresentation{DropItem.data($0)}
    }
    
    var text: String? {
        switch self {
        case .text(let str): return str
        default: return nil
        }
    }
    
    var url: URL? {
        switch self {
        case .url(let url): return url
        default: return nil
        }
    }
    
    var data: Data? {
        switch self {
        case .data(let data): return data
        default: return nil
        }
    }
}

extension UTType {
    static var dropItem = UTType(exportedAs: "com.besrkora.cs193p.EmojiArt.dropItem")
}
