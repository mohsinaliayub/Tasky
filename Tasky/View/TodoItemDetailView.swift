//
//  TodoItemDetailView.swift
//  Tasky
//
//  Created by Mohsin Ali Ayub on 19.05.24.
//

import SwiftUI

struct TodoItemDetailView: View {
    @ObservedObject var model: TodoDetailViewModel
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack(alignment: .leading, spacing: 32) {
            VStack {
                HStack(alignment: .top) {
                    TaskCircleView(isComplete: model.isComplete)
                        .onTapGesture {
                            model.changeStatus()
                        }
                    VStack {
                        TextField("Enter task", text: $model.todoTitle, axis: .vertical)
                            .font(.headline)
                            .lineLimit(5)
                            .padding(.bottom, 8)
                        Divider()
                    }
                }
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
                    model.save()
                }) {
                    Text("Done").font(.headline)
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
        TodoItemDetailView(model: TodoDetailViewModel(manager: TodoManager(), todo: TodoItem(title: "Finish the Chapter 6: Enumerations of The Swift Programming Language (Swift 5.7) book")))
            .preferredColorScheme(.dark)
    }
}
