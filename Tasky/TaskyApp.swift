//
//  TaskyApp.swift
//  Tasky
//
//  Created by Mohsin Ali Ayub on 12.05.24.
//

import SwiftUI

@main
struct TaskyApp: App {
    let taskManager = TaskListViewModel()
    
    var body: some Scene {
        WindowGroup {
            TaskListView(taskManager: TaskListViewModel())
        }
    }
}
