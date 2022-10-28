//
//  ListView.swift
//  ToDoListV2
//
//  Created by Leith on 26/10/2022.
//

import SwiftUI

struct ListView: View {
    @EnvironmentObject var listViewModel: ListViewModel
    var body: some View {
        ZStack{
            if listViewModel.items.isEmpty{
                Text("No tasks yet!")
            }else {
                List {
                    ForEach(listViewModel.items) { item in
                        ListItemView(item: item)
                            .onTapGesture {
                                withAnimation(.spring()){
                                    listViewModel.updateItem(item: item)
                                }
                            }
                    }
                    .onDelete(perform: listViewModel.deleteItem)
                    .onMove(perform: listViewModel.moveItem)
                }
            }
            
        }
        .navigationTitle("Todo List 📓")
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                EditButton()
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink("Add", destination: AddView())
            }
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ListView()
        }
        .environmentObject(ListViewModel())
    }
}


