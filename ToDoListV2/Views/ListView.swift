//
//  ListView.swift
//  ToDoListV2
//
//  Created by Leith on 26/10/2022.
//

import SwiftUI

struct ListView: View {
    @State var items: [ListItemModel] = [
        ListItemModel(title: "Code an IOS app", isCompleted: true),
        ListItemModel(title: "Read", isCompleted: false),
        ListItemModel(title: "Padel training", isCompleted: false)
    ]
    var body: some View {
        List {
            ForEach(items) { item in
                ListItemView(item: item)
            }
            .onTapGesture {
//                item.isCompleted.toggle()
            }
            
        }
        .navigationTitle("Todo List 📓")
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                    NavigationLink("Edit", destination: AddView())
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink("Add", destination: Text("Add"))
            }
            
//            Image(systemName: "plus.circle")
//            Image(systemName: "arrowshape.turn.up.backward")
                
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ListView()
        }
    }
}


