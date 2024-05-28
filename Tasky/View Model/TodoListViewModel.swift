//
//  TodoListViewModel.swift
//  Tasky
//
//  Created by Mohsin Ali Ayub on 16.05.24.
//

import SwiftUI

class TodoListViewModel: ObservableObject {
    @Published var manager: TodoManager
    
    var todos: [TodoItem] { manager.todos }
    
    init(manager: TodoManager) {
        self.manager = manager
    }
    
    func changeTodoStatus(for todoItem: TodoItem) {
        manager.changeStatus(for: todoItem)
    }
    
    func string(from date: Date) -> String {
        DateFormatHelper.string(from: date) ?? ""
    }
}
