//
//  TodoItemInfoView.swift
//  Tasky
//
//  Created by Mohsin Ali Ayub on 16.05.24.
//

import SwiftUI

struct TodoItemInfoView: View {
    var task: TodoItem
    @ObservedObject var manager: TodoListViewModel
    
    var body: some View {
        HStack(alignment: .top) {
            TaskCircleView(isComplete: task.isComplete)
                .onTapGesture {
                    manager.changeTodoStatus(for: task)
                }
            VStack(alignment: .leading) {
                Text(task.title)
                    .lineLimit(1)
                    .font(.headline)
                    .foregroundStyle(task.isComplete ? .gray : .primary)
                    .overlay {
                        if task.isComplete {
                            Rectangle().frame(height: 1)
                                .foregroundStyle(.gray)
                        }
                    }
                if let dueDate = task.dueDate {
                    Text(manager.string(from: dueDate))
                        .font(.caption)
                        .foregroundStyle(.accent)
                }
            }
        }
    }
    
    private func imageName() -> String {
        task.isComplete ? "checkmark.circle" : "circle"
    }
}
