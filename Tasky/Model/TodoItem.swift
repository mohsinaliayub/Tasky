//
//  TodoItem.swift
//  Tasky
//
//  Created by Mohsin Ali Ayub on 16.05.24.
//

import Foundation

struct TodoItem: Identifiable, CustomStringConvertible {
    var title: String
    var isComplete = false
    var taskDescription: String?
    var dueDate: Date?
    var priority: Priority?
    
    var description: String {
        "{\(title), isComplete: \(isComplete)}"
    }
    
    var id = UUID()
    
    enum Priority {
        case low
        case medium
        case high
    }
}
