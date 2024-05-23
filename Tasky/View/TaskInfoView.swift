//
//  TaskInfoView.swift
//  Tasky
//
//  Created by Mohsin Ali Ayub on 16.05.24.
//

import SwiftUI

struct TaskInfoView: View {
    let task: Tasky.Task
    let manager: TaskListViewModel
    
    var body: some View {
        HStack {
            TaskCircleView(isComplete: task.isComplete)
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
    
    private func imageName() -> String {
        task.isComplete ? "checkmark.circle" : "circle"
    }
}

#Preview {
    TaskListView(taskManager: TaskListViewModel())
}
