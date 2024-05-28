//
//  TodoListView.swift
//  Tasky
//
//  Created by Mohsin Ali Ayub on 12.05.24.
//

import SwiftUI

struct TodoListView: View {
    @EnvironmentObject var model: TodosManagerViewModel
    @State private var selectedItem: TodoItem?
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    ForEach(model.todos) { todo in
                        TodoItemInfoView(task: todo, manager: model)
                            .onTapGesture {
                                selectedItem = todo
                            }
                    }
                }
            }
            .navigationTitle("Tasky")
            .padding([.horizontal, .top])
            .navigationDestination(item: $selectedItem) { item in
                TodoItemDetailView()
            }
        }
    }
}


#Preview {
    TodoListView()
        .environmentObject(TodosManagerViewModel(manager: TodoManager()))
        .preferredColorScheme(.dark)
}
