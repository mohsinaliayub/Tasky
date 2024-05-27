//
//  DateTimePickerView.swift
//  Tasky
//
//  Created by Mohsin Ali Ayub on 27.05.24.
//

import SwiftUI

struct DateTimePickerView: View {
    @State private var date: Date = Date()
    @State private var showDatePicker = true

    var body: some View {
        VStack {
            SectionWithContentView(systemIconName: "calendar", title: "Pick a date") {
                DatePicker("", selection: $date, in: Date()..., displayedComponents: [.date])
                    .datePickerStyle(.graphical)
            }
            SectionWithContentView(systemIconName: "clock", title: "Add a time") {
                DatePicker("", selection: $date, in: Date()..., displayedComponents: [.hourAndMinute])
                    .datePickerStyle(.wheel)
            }
        }
        .padding()
    }
}

struct SectionWithContentView<Content>: View where Content: View {
    let systemIconName: String
    let title: String
    var content: () -> Content
    
    @State private var displayingContent = true
    
    var body: some View {
        VStack {
            section(with: systemIconName, and: title)
            if displayingContent {
                content()
                    .transition(.scale) // FIXME: Fix this transition to scale from top-leading
            }
        }
    }
    
    @ViewBuilder
    private func section(with systemName: String, and title: String) -> some View {
        HStack {
            Image(systemName: systemName)
            Text(title).font(.caption)
            Spacer()
        }
        .padding(12)
        .background {
            RoundedRectangle(cornerRadius: 5)
                .foregroundStyle(.gray.opacity(0.3))
        }
        .onTapGesture {
            withAnimation(.linear) {
                displayingContent.toggle()
            }
        }
    }
}

#Preview {
    DateTimePickerView()
        .preferredColorScheme(.dark)
}
