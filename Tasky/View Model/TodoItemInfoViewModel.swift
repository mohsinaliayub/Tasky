//
//  TodoItemInfoViewModel.swift
//  Tasky
//
//  Created by Mohsin Ali Ayub on 28.05.24.
//

import Foundation

class TodoItemInfoViewModel: ObservableObject {
    @Published var manager: TodoManager
    
    init(manager: TodoManager) {
        self.manager = manager
    }
    
    func changeTodoStatus(for todo: TodoItem) {
        manager.changeStatus(for: todo)
    }
    
    func string(from date: Date) -> String {
        DateFormatHelper.string(from: date) ?? ""
    }
}
