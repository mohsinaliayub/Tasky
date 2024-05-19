//
//  TaskDetailsView.swift
//  Tasky
//
//  Created by Mohsin Ali Ayub on 19.05.24.
//

import SwiftUI

struct TaskDetailsView: View {
    @State private var title: String = ""
    
    var body: some View {
        VStack(alignment: .leading, spacing: 32) {
            VStack {
                TextField("Enter task", text: $title)
                    .font(.title2)
                    .padding(.bottom, 8)
                Divider()
            }
            
            LabelAndContentView(systemName: "calendar") {
                HStack {
                    Text("Today")
                        .padding(8)
                        .background {
                            RoundedRectangle(cornerRadius: 25)
                                .strokeBorder(style: .init(lineWidth: 1, dash: [3]))
                        }
                    Text("Tomorrow")
                        .padding(8)
                        .background {
                            RoundedRectangle(cornerRadius: 25)
                                .strokeBorder(style: .init(lineWidth: 1, dash: [3]))
                        }
                    Text("Custom")
                        .padding(8)
                        .background {
                            RoundedRectangle(cornerRadius: 25)
                                .strokeBorder(style: .init(lineWidth: 1, dash: [3]))
                        }
                }
            }
            
            LabelAndContentView(systemName: "bell") {
                
            }
            
            LabelAndContentView(systemName: "exclamationmark.triangle") {
                
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
    TaskDetailsView()
}
