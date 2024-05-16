//
//  TaskListView.swift
//  Tasky
//
//  Created by Mohsin Ali Ayub on 12.05.24.
//

import SwiftUI

struct TaskListView: View {
    @ObservedObject var taskManager: TaskListViewModel
    
    var body: some View {
        List {
            Section("ONGOING (\(taskManager.ongoingTasks.count))") {
                ForEach(taskManager.ongoingTasks) { task in
                    TaskInfoView(task: task, manager: taskManager)
                }
            }
            .listRowSeparator(.hidden)
            
            Section("COMPLETED (\(taskManager.completedTasks.count))") {
                ForEach(taskManager.completedTasks) { task in
                    TaskInfoView(task: task, manager: taskManager)
                }
            }
            .listRowSeparator(.hidden)
        }
        .listStyle(.plain)
    }
}


#Preview {
    TaskListView(taskManager: TaskListViewModel())
        .preferredColorScheme(.dark)
}
