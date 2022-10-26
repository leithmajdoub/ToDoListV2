//
//  ListItemModel.swift
//  ToDoListV2
//
//  Created by Leith on 26/10/2022.
//

import Foundation

struct ListItemModel: Identifiable {
    let id = UUID().uuidString
    let title: String
    let isCompleted: Bool
}
