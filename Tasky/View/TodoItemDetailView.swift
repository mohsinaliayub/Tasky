//
//  TodoItemDetailView.swift
//  Tasky
//
//  Created by Mohsin Ali Ayub on 19.05.24.
//

import SwiftUI

struct TodoItemDetailView: View {
    @Binding var todo: TodoItem
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack(alignment: .leading, spacing: 32) {
            VStack {
                TextField("Enter task", text: $todo.title)
                    .font(.headline)
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
        TodoItemDetailView(todo: .constant(TodoItem(title: "Buy apples")))
    }
}
