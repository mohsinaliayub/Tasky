//
//  TodoListViewModel.swift
//  Tasky
//
//  Created by Mohsin Ali Ayub on 16.05.24.
//

import Foundation

class TodoListViewModel: ObservableObject {
    @Published var todos: [TodoItem]
    
    init() {
        todos = Self.dummyTasks()
    }
    
    func changeTodoStatus(_ todo: TodoItem) {
        guard let todoIndex = todos.firstIndex(where: { $0.id == todo.id }) else {
            return
        }
        
        todos[todoIndex].isComplete.toggle()
    }
    
    private static func dummyTasks() -> [TodoItem] {
        [
            TodoItem(title: "Complete \"Strings and Characters\" chapter from Swift book"),
            TodoItem(title: "Complete Lecture 02: List-Based Collections"),
            TodoItem(title: "Finish ExpandableSearchBar app", isComplete: true),
            TodoItem(title: "Watch the LinkedIn video from YouTube \"Watch Later\"", isComplete: true),
            TodoItem(title: "Finish Lesson 1 of \"DSA in Swift\" course", isComplete: true),
        ]
    }
}
