//
//  TodoListView.swift
//  Tasky
//
//  Created by Mohsin Ali Ayub on 12.05.24.
//

import SwiftUI

struct TodoListView: View {
    @ObservedObject var model: TodoListViewModel
    @State private var selectedIndex: Int?
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    ForEach(0..<model.todos.count, id: \.self) { todoIndex in
                        TodoItemInfoView(task: model.todos[todoIndex], manager: model)
                            .onTapGesture {
                                selectedIndex = todoIndex
                            }
                    }
                }
            }
            .navigationTitle("Tasky")
            .padding([.horizontal, .top])
            .navigationDestination(item: $selectedIndex) { index in
                TodoItemDetailView()
                    .environmentObject(TodoDetailViewModel(manager: model.manager, todo: model.todos[index]))
            }
        }
    }
}


#Preview {
    TodoListView(model: TodoListViewModel(manager: TodoManager()))
        .preferredColorScheme(.dark)
}
