//
//  TaskyApp.swift
//  Tasky
//
//  Created by Mohsin Ali Ayub on 12.05.24.
//

import SwiftUI

@main
struct TaskyApp: App {
    @StateObject var manager = TodosManagerViewModel(manager: TodoManager())
    
    var body: some Scene {
        WindowGroup {
            TodoListView()
                .environmentObject(manager)
                .environment(\.colorScheme, .dark)
        }
    }
}
