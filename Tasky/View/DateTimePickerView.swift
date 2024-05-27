//
//  DateTimePickerView.swift
//  Tasky
//
//  Created by Mohsin Ali Ayub on 27.05.24.
//

import SwiftUI

struct DateTimePickerView: View {
    @State private var date: Date = Date()

    var body: some View {
        VStack {
            DatePicker("", selection: $date, in: Date()..., displayedComponents: .date)
                .datePickerStyle(.graphical)
                .labelsHidden()
            DatePicker("", selection: $date, in: Date()..., displayedComponents: .hourAndMinute)
                .datePickerStyle(.wheel)
        }
    }
    
    private func printDateAndTime() {
        let dateComponents = Calendar.current.dateComponents([.year, .month, .day], from: date)
        let timeComponents = Calendar.current.dateComponents([.hour, .minute], from: date)
        
        print("Task deadline: \(dateComponents.day!).\(dateComponents.month!).\(dateComponents.year!) at \(timeComponents.hour!):\(timeComponents.minute!)")
    }
}

#Preview {
    DateTimePickerView()
}
