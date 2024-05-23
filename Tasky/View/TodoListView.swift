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
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 8) {
                    ForEach(0..<todoManager.todos.count, id: \.self) { todoIndex in
                        NavigationLink(destination: TodoItemDetailView(todo: $todoManager.todos[todoIndex])) {
                            TodoItemInfoView(task: todoManager.todos[todoIndex], manager: todoManager)
                        }
                    }
                }
            }
            .navigationTitle("Tasky")
            .padding([.horizontal, .top])
        }
    }
}


#Preview {
    TodoListView(todoManager: TodoListViewModel())
        .preferredColorScheme(.dark)
}
