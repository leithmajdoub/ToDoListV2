//
//  ListView.swift
//  ToDoListV2
//
//  Created by Leith on 26/10/2022.
//

import SwiftUI

struct ListView: View {
    @State var items: [String] = [
        "Code an IOS app",
        "Read",
        "Padel training"
    ]
    var body: some View {
        List {
            ForEach(items, id: \.self) { item in
                ListItemView(title: item)
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


