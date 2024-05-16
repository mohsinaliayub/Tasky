//
//  TaskListViewModel.swift
//  Tasky
//
//  Created by Mohsin Ali Ayub on 16.05.24.
//

import Foundation

class TaskListViewModel: ObservableObject {
    @Published var tasks: [Tasky.Task]
    
    init() {
        tasks = Self.dummyTasks()
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
