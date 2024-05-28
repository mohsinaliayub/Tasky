//
//  TodoListView.swift
//  Tasky
//
//  Created by Mohsin Ali Ayub on 12.05.24.
//

import SwiftUI

struct TodoListView: View {
    @ObservedObject var model: TodoListViewModel
    @State private var displayTodoDetails = false
    @State private var selectedTodoIndex = 0
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 8) {
                    ForEach(0..<model.todos.count, id: \.self) { todoIndex in
//                        NavigationLink(destination: TodoItemDetailView(todo: $todoManager.todos[todoIndex])) {
//                            TodoItemInfoView(task: todoManager.todos[todoIndex], manager: todoManager)
//                        }
                        TodoItemInfoView(task: model.todos[todoIndex], manager: model)
                    }
                }
            }
            .navigationTitle("Tasky")
            .padding([.horizontal, .top])
        }
    }
}


#Preview {
    TodoListView(model: TodoListViewModel())
        .preferredColorScheme(.dark)
}
