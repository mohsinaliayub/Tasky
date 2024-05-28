//
//  TodoItemDetailView.swift
//  Tasky
//
//  Created by Mohsin Ali Ayub on 19.05.24.
//

import SwiftUI

struct TodoItemDetailView: View {
    @Environment(\.dismiss) private var dismiss
    
    @State private var isComplete = false
    @State private var title = "TODO"
    
    var body: some View {
        VStack(alignment: .leading, spacing: 32) {
            VStack {
                HStack(alignment: .top) {
                    TaskCircleView(isComplete: isComplete)
                        .onTapGesture {
                            // TODO: change todo status
                        }
                    VStack {
                        TextField("Enter task", text: $title, axis: .vertical)
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
        TodoItemDetailView()
            .preferredColorScheme(.dark)
    }
}
