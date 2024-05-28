//
//  TodoManager.swift
//  Tasky
//
//  Created by Mohsin Ali Ayub on 28.05.24.
//

import Foundation

class TodoManager: ObservableObject {
    @Published var todos: [TodoItem]
    
    init() {
        todos = Self.dummyTasks()
    }
    
    func changeStatus(for todoItem: TodoItem) {
        guard let todoIndex = index(for: todoItem) else {
            return
        }
        todos[todoIndex].isComplete.toggle()
    }
    
    func save(_ todoItem: TodoItem) {
        guard let index = index(for: todoItem) else { return }
        objectWillChange.send()
        print(todos[index])
        todos[index].title = todoItem.title
        todos[index].isComplete = todoItem.isComplete
        print(todos[index])
    }
    
    private func index(for todoItem: TodoItem) -> Int? {
        todos.firstIndex(where: { $0.id == todoItem.id })
    }
    
    private static func dummyTasks() -> [TodoItem] {
        [
            TodoItem(title: "Complete \"Strings and Characters\" chapter from Swift book", dueDate: tomorrowDate()),
            TodoItem(title: "Complete Lecture 02: List-Based Collections"),
            TodoItem(title: "Finish ExpandableSearchBar app", isComplete: true),
            TodoItem(title: "Watch the LinkedIn video from YouTube \"Watch Later\"", isComplete: true),
            TodoItem(title: "Finish Lesson 1 of \"DSA in Swift\" course", isComplete: true),
        ]
    }
    
    private static func tomorrowDate() -> Date? {
        let calendar = Calendar.current
        return calendar.date(byAdding: .day, value: 2, to: Date())
    }
}
