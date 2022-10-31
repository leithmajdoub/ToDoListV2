//
//  ListViewModel.swift
//  ToDoListV2
//
//  Created by Leith on 27/10/2022.
//

import Foundation

class ListViewModel : ObservableObject {
    
    @Published var items: [ListItemModel] = [] {
        // if we make any change to items this function runs
        didSet{
            saveItems()
        }
    }
    let itemsKey: String = "items_list"
    
    init() {
        getItems()
    }
    
    func getItems() {
        guard
            let data = UserDefaults.standard.data(forKey: itemsKey),
            let decodedData = try? JSONDecoder().decode([ListItemModel].self, from: data)
        else {return}
        self.items = decodedData
    }
    
    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    
    func moveItem(from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func addItem(title: String) {
        let newItem = ListItemModel(title: title, isCompleted: false)
        items.append(newItem)
    }
    
    func updateItem(item: ListItemModel) {
//        if let index = items.firstIndex(where: { (existingItem) in
//            return existingItem.id == item.id
//        }) {
//
//        }
        
        // $0 is the selected item in the list to compare with item
        if let index = items.firstIndex(where: { $0.id == item.id}){
            items[index] = item.updateCompletion()
        }
    }
    
    func saveItems() {
        if let encodedData = try? JSONEncoder().encode(items){
            UserDefaults.standard.set(encodedData, forKey: itemsKey)
        }
    }
}
