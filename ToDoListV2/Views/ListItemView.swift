//
//  ListItemView.swift
//  ToDoListV2
//
//  Created by Leith on 26/10/2022.
//

import SwiftUI

struct ListItemView: View {
    let item: ListItemModel
    var body: some View {
        HStack {
            Text(item.title)
            Spacer()
            Image(systemName: item.isCompleted ? "checkmark.circle.fill" : "circle")
        }
    }
}

struct ListItemView_Previews: PreviewProvider {
    static var previews: some View {
            ListItemView(item: ListItemModel(title: "Hello", isCompleted: true))
            
    }
}

