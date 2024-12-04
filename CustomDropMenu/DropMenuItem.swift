//
//  DropMenuItem.swift
//  CustomDropMenu
//
//  Created by Владислав Соколов on 04.12.2024.
//

import Foundation

enum DropDownMenuItem: CaseIterable {
    case one
    case two
    case three
    
    var description: String {
        switch self {
        case .one: return "One"
        case .two: return "Two"
        case .three: return "Three"
        }
    }
}
