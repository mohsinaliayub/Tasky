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
            HStack {
                Image(systemName: "calendar")
                Text("Select a date")
                    .font(.caption)
                Spacer()
            }
            .padding(12)
            .background {
                RoundedRectangle(cornerRadius: 5)
                    .foregroundStyle(.gray.opacity(0.3))
            }
            .onTapGesture {
                withAnimation(.linear) {
                    showDatePicker.toggle()
                }
            }
            if showDatePicker {
                DatePicker("", selection: $date, in: Date()..., displayedComponents: .date)
                    .datePickerStyle(.graphical)
                    .opacity(showDatePicker ? 1 : 0)
                    .transition(.scale)
            }
                
            RoundedRectangle(cornerRadius: 5)
                .foregroundStyle(.gray.opacity(0.3))
                .frame(height: 100)
        }
        .padding()
    }
}

#Preview {
    DateTimePickerView()
        .preferredColorScheme(.dark)
}
