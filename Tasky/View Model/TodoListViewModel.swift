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
    
    func string(from date: Date) -> String {
        print(date)
        print(Date())
        let difference = Calendar.current.dateComponents([.year, .month, .day], from: Date(), to: date)
        
        
        if let day = difference.day {
            let components = Calendar.current.dateComponents([.weekday], from: date)
            if let weekday = components.weekday, let string = dayOfWeek(weekday) {
                return "Due \(string)"
            } else {
                return "Due \(day) day\(day > 1 ? "s" : "") later"
            }
        }
        return ""
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
    
    private func dayOfWeek(_ day: Int) -> String? {
        switch day {
        case 1:
            return "Sunday"
        case 2:
            return "Monday"
        case 3:
            return "Tuesday"
        case 4:
            return "Wednesday"
        case 5:
            return "Thursday"
        case 6:
            return "Friday"
        case 7:
            return "Saturday"
        default:
            return nil
        }
    }
    
    
    private static func tomorrowDate() -> Date? {
        let calendar = Calendar.current
        return calendar.date(byAdding: .day, value: 2, to: Date())
    }
}
