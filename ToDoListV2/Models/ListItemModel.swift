//
//  ListItemModel.swift
//  ToDoListV2
//
//  Created by Leith on 26/10/2022.
//

import Foundation


// immutable struct: Let constants for extra safety 
struct ListItemModel: Identifiable, Codable {
    let id: String
    let title: String
    let isCompleted: Bool
    
    init(id: String = UUID().uuidString, title: String, isCompleted: Bool) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }
    
    func updateCompletion() -> ListItemModel {
        return ListItemModel(id: id, title: title, isCompleted: !isCompleted)
    }
}
