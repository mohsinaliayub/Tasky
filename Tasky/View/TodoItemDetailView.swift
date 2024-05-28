//
//  TodoItemDetailView.swift
//  Tasky
//
//  Created by Mohsin Ali Ayub on 19.05.24.
//

import SwiftUI

struct TodoItemDetailView: View {
    var todo: TodoItem
    @State private var title = ""
    @Environment(\.dismiss) private var dismiss
    
    init(todo: TodoItem) {
        self.todo = todo
        _title = State<String>(initialValue: todo.title)
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 32) {
            VStack {
                TextField("Enter task", text: $title, axis: .vertical)
                    .font(.headline)
                    .lineLimit(5)
                    .padding(.bottom, 8)
                Divider()
            }
            Spacer()
            
        }
        .padding()
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button("Cancel") {
                    dismiss()
                }
            }
            
            ToolbarItem(placement: .topBarTrailing) {
                Button(action: {
                    dismiss()
                }) {
                    Text("Done").bold()
                }
            }
        }
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
    NavigationStack {
        TodoItemDetailView(todo: TodoItem(title: "Finish the Chapter 6: Enumerations of The Swift Programming Language (Swift 5.7) book"))
    }
}
