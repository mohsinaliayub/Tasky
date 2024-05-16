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
                ForEach(taskManager.tasks) { task in
                    TaskInfoView(task: task, manager: taskManager)
                }
                .padding(.horizontal)
            }
        }
        .background(Color.black)
    }
}

struct TaskInfoView: View {
    let task: Tasky.Task
    let manager: TaskListViewModel
    
    var body: some View {
        HStack {
            Circle()
                .strokeBorder(lineWidth: 2)
                .foregroundStyle(task.isComplete ? .gray : .purple)
                .frame(width: 20, height: 20)
                .onTapGesture {
                    manager.changeTaskStatus(task)
                }
            
            VStack(alignment: .leading) {
                Text(task.title)
                    .lineLimit(1)
                    .font(.subheadline)
                    .foregroundStyle(task.isComplete ? .gray : .white)
                    .overlay {
                        if task.isComplete {
                            Rectangle().frame(height: 1)
                                .foregroundStyle(.gray)
                        }
                    }
                // TODO: Add Due date here...
            }
        }
    }
}


#Preview {
    TaskListView(taskManager: TaskListViewModel())
}
