//
//  TaskListView.swift
//  Tasky
//
//  Created by Mohsin Ali Ayub on 12.05.24.
//

import SwiftUI

struct TaskListView: View {
    @ObservedObject var taskManager: TaskListViewModel
    @State private var displayTaskDetails = false
    @State private var selectedTaskIndex = 0
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 8) {
                ForEach(0..<taskManager.tasks.count, id: \.self) { taskIndex in
                    TaskInfoView(task: taskManager.tasks[taskIndex], manager: taskManager)
                        .onTapGesture {
                            selectedTaskIndex = taskIndex
                            displayTaskDetails = true
                        }
                }
            }
        }
        .sheet(isPresented: $displayTaskDetails) {
            TaskDetailsView(task: $taskManager.tasks[selectedTaskIndex])
        }
    }
}


#Preview {
    TaskListView(taskManager: TaskListViewModel())
        .preferredColorScheme(.dark)
}
