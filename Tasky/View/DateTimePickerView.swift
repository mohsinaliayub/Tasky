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
            SectionWithContentView(systemIconName: "clock", title: "Add time") {
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
    private let drawingConstants = DrawingConstants()
    
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
            Text(title).font(.caption.bold())
            Spacer()
        }
        .padding(drawingConstants.sectionPadding)
        .background(sectionBackground)
        .onTapGesture {
            withAnimation(.linear) {
                displayingContent.toggle()
            }
        }
    }
    
    var sectionBackground: some View {
        RoundedRectangle(cornerRadius: drawingConstants.sectionBackgroundCornerRadius)
            .foregroundStyle(drawingConstants.sectionBackgroundColor)
    }
    
    private struct DrawingConstants {
        let sectionPadding: CGFloat = 12
        let sectionBackgroundCornerRadius: CGFloat = 5
        let sectionBackgroundColor = Color.gray.opacity(0.3)
    }
}

#Preview {
    DateTimePickerView()
        .preferredColorScheme(.dark)
}
