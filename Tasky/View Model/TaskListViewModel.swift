//
//  TaskListViewModel.swift
//  Tasky
//
//  Created by Mohsin Ali Ayub on 16.05.24.
//

import Foundation

class TaskListViewModel: ObservableObject {
    @Published var tasks: [Tasky.Task]
    
    var ongoingTasks: [Tasky.Task] {
        tasks.filter { !$0.isComplete }
    }
    
    var completedTasks: [Tasky.Task] {
        tasks.filter { $0.isComplete }
    }
    
    init() {
        tasks = Self.dummyTasks()
    }
    
    func changeTaskStatus(_ task: Tasky.Task) {
        guard let taskIndex = tasks.firstIndex(where: { $0.id == task.id }) else {
            return
        }
        
        tasks[taskIndex].isComplete.toggle()
    }
    
    private static func dummyTasks() -> [Tasky.Task] {
        [
            Task(title: "Complete \"Strings and Characters\" chapter from Swift book"),
            Task(title: "Complete Lecture 02: List-Based Collections"),
            Task(title: "Finish ExpandableSearchBar app", isComplete: true),
            Task(title: "Watch the LinkedIn video from YouTube \"Watch Later\"", isComplete: true),
            Task(title: "Finish Lesson 1 of \"DSA in Swift\" course", isComplete: true),
        ]
    }
}
