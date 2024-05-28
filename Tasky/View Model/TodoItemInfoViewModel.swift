//
//  TodoItemInfoViewModel.swift
//  Tasky
//
//  Created by Mohsin Ali Ayub on 28.05.24.
//

import Foundation

class TodoItemInfoViewModel: ObservableObject {
    private(set) var manager: TodoManager
    
    init(manager: TodoManager) {
        self.manager = manager
    }
    
    func changeTodoStatus(for todo: TodoItem) {
        objectWillChange.send()
        manager.changeStatus(for: todo)
    }
    
    func string(from date: Date) -> String {
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
}
