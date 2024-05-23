//
//  TaskDetailsView.swift
//  Tasky
//
//  Created by Mohsin Ali Ayub on 19.05.24.
//

import SwiftUI

struct TaskDetailsView: View {
    @Binding var task: Tasky.Task
    
    var body: some View {
        VStack(alignment: .leading, spacing: 32) {
            VStack {
                TextField("Enter task", text: $task.title)
                    .font(.headline)
                    .padding(.bottom, 8)
                Divider()
            }
            Spacer()
            
        }
        .padding()
    }
}

struct LabelAndContentView<Content: View>: View {
    let systemName: String
    @ViewBuilder var content: Content
    
    var body: some View {
        HStack {
            Image(systemName: systemName)
                .imageScale(.large)
                .padding(.trailing)
            content
        }
    }
}

#Preview {
    TaskDetailsView(task: .constant(Tasky.Task(title: "Buy apples")))
}
