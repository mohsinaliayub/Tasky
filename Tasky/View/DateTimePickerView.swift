//
//  DateTimePickerView.swift
//  Tasky
//
//  Created by Mohsin Ali Ayub on 27.05.24.
//

import SwiftUI

struct DateTimePickerView: View {
    @State private var dueDate = Date()
    @State private var reminderTime = Date()
    @State private var statesOfSections: [ContentState] = [.expanded, .collapsed]
    @State private var titleForSection: [String?] = [nil, nil]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Due Date".uppercased())
                .font(.caption)
                .padding(.vertical, 8)
            CollapsableContainerView(numberOfSections: 2) { index in
                section(for: index)
            } contentProvider: { index in
                content(for: index)
            }

            buttonsStack
        }
        .padding()
    }
    
    @ViewBuilder
    func section(for index: Int) -> some View {
        HStack {
            Image(systemName: index == 0 ? "calendar" : "clock")
            Text(index == 0 ? "Pick a date" : "Add time").font(.caption.bold())
            Spacer()
        }
    }
    
    @ViewBuilder
    func content(for index: Int) -> some View {
        if index == 0 {
            dueDatePicker
        } else {
            reminderTimePicker
        }
    }
    
    var dueDatePicker: some View {
        DatePicker("", selection: $dueDate, in: Date()..., displayedComponents: .date)
            .datePickerStyle(.graphical)
    }
    
    var reminderTimePicker: some View {
        DatePicker("", selection: $reminderTime, in: Date()..., displayedComponents: .hourAndMinute)
            .datePickerStyle(.wheel)
    }
    
    func button(_ title: LocalizedStringKey, action: @escaping () -> Void) -> some View {
        Button(title, action: action)
            .frame(maxWidth: .infinity, minHeight: DrawingConstants.buttonHeight)
    }
    
    var dividerRectangle: some View {
        Rectangle().foregroundStyle(.gray.opacity(0.8))
    }
    var horizontalDivider: some View {
        dividerRectangle.frame(height: 0.4)
    }
    var verticalDivider: some View {
        dividerRectangle.frame(width: 0.4, height: DrawingConstants.buttonHeight)
    }
    
    var buttonsStack: some View {
        VStack(spacing: 0) {
            horizontalDivider
            HStack(spacing: 0) {
                button("Cancel") { }
                    .foregroundStyle(.gray)
                verticalDivider
                button("Done") { }
                    .bold()
            }
            horizontalDivider
        }
    }
    
    private enum DrawingConstants {
        static let buttonHeight: CGFloat = 80
    }
}

struct SectionWithContentView<Content>: View where Content: View {
    let systemIconName: String
    let title: String
    /// Keeps tracks of content's state: expanded or collapsed. Hides the content when it's set to .collapsed.
    @Binding var contentState: ContentState
    var content: () -> Content
    /// Use this to change the  other sections' state to collapsed.
    var stateChanged: () -> Void
    
    private let drawingConstants = DrawingConstants()
    
    var body: some View {
        VStack {
            section(with: systemIconName, and: title)
            if contentState == .expanded {
                content()
                    .transition(.asymmetric(insertion: .scale, removal: .identity)) // FIXME: Fix this transition to scale from top-leading
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
            // change the content state: collapsed -> expanded
            withAnimation(.linear) {
                contentState = .expanded
            }
            stateChanged()
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
