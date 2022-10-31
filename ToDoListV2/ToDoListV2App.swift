//
//  ToDoListV2App.swift
//  ToDoListV2
//
//  Created by Leith on 26/10/2022.
//

import SwiftUI

@main
struct ToDoListV2App: App {
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ListView()
            }
            .environmentObject(listViewModel)
        }
    }
}
