//
//  ToDoListItem.swift
//  PathWay
//
//  Created by Montypass on 19.09.2021.
//

import Foundation

class ToDoListItem: NSObject, Codable {
    var text = ""
    var checked = false
    
    func toggleChecked() {
        checked.toggle()
    }
    
}
