//
//  Task.swift
//  Tasky
//
//  Created by Mohsin Ali Ayub on 16.05.24.
//

import Foundation

struct Task: Identifiable {
    var title: String
    var isComplete = false
    var description: String?
    var dueDate: Date?
    var priority: Priority?
    
    var id = UUID()
    
    enum Priority {
        case low
        case medium
        case high
    }
}
