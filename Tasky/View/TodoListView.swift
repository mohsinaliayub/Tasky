//
//  TodoListView.swift
//  Tasky
//
//  Created by Mohsin Ali Ayub on 12.05.24.
//

import SwiftUI

struct TodoListView: View {
    @ObservedObject var todoManager: TodoListViewModel
    @State private var displayTodoDetails = false
    @State private var selectedTodoIndex = 0
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 8) {
                ForEach(0..<todoManager.todos.count, id: \.self) { todoIndex in
                    TodoItemInfoView(task: todoManager.todos[todoIndex], manager: todoManager)
                        .onTapGesture {
                            selectedTodoIndex = todoIndex
                            displayTodoDetails = true
                        }
                }
            }
        }
        .sheet(isPresented: $displayTodoDetails) {
            TodoItemDetailView(todo: $todoManager.todos[selectedTodoIndex])
        }
    }
}


#Preview {
    TodoListView(todoManager: TodoListViewModel())
        .preferredColorScheme(.dark)
}
