//
//  TaskyApp.swift
//  Tasky
//
//  Created by Mohsin Ali Ayub on 12.05.24.
//

import SwiftUI

@main
struct TaskyApp: App {
    let model = TodosManagerViewModel(manager: TodoManager())
    
    var body: some Scene {
        WindowGroup {
            TodoListView(model: model)
                .environment(\.colorScheme, .dark)
        }
    }
}
