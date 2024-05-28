//
//  TodoDetailViewController.swift
//  Tasky
//
//  Created by Mohsin Ali Ayub on 28.05.24.
//

import Foundation

class TodoDetailViewModel: ObservableObject {
    var manager: TodoManager
    
    private var todoItem: TodoItem
    
    @Published var todoTitle: String
    @Published var isComplete: Bool
    
    init(manager: TodoManager, todo: TodoItem) {
        self.manager = manager
        self.todoItem = todo
        
        todoTitle = todo.title
        isComplete = todo.isComplete
    }
    
    func save() {
        todoItem.title = todoTitle
        todoItem.isComplete = isComplete
        
        manager.save(todoItem)
    }
    
    func changeStatus() {
        isComplete.toggle()
    }
    
}
