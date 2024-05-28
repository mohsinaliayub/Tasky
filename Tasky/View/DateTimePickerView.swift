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
        Rectangle().foregroundStyle(DrawingConstants.didiverRectangleColor)
    }
    var horizontalDivider: some View {
        dividerRectangle.frame(height: DrawingConstants.verticalDividerHeight)
    }
    var verticalDivider: some View {
        dividerRectangle.frame(width: DrawingConstants.horizontalDividerWidth,
                               height: DrawingConstants.buttonHeight)
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
        static let didiverRectangleColor = Color.gray.opacity(0.8)
        static let verticalDividerHeight: CGFloat = 0.4
        static let horizontalDividerWidth: CGFloat = 0.4
    }
}

#Preview {
    DateTimePickerView()
        .preferredColorScheme(.dark)
}
