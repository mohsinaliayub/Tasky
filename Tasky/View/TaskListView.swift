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
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                ForEach(taskManager.ongoingTasks) { task in
                    TaskInfoView(task: task, manager: taskManager)
                }
                
                ForEach(taskManager.completedTasks) { task in
                    TaskInfoView(task: task, manager: taskManager)
                }
            }
        }
    }
}


#Preview {
    TaskListView(taskManager: TaskListViewModel())
        .preferredColorScheme(.dark)
}
