//
//  CollapsableContainerView.swift
//  Tasky
//
//  Created by Mohsin Ali Ayub on 28.05.24.
//

import SwiftUI

struct CollapsableContainerView<Section, Content>: View where Section: View, Content: View {
    private var numberOfSections: Int
    @State private var contentStates: [ContentState]
    
    var sectionProvider: (Int) -> Section
    var contentProvider: (Int) -> Content
    
    init(numberOfSections: Int, sectionProvider: @escaping (Int) -> Section, contentProvider: @escaping (Int) -> Content) {
        self.numberOfSections = numberOfSections
        self.sectionProvider = sectionProvider
        self.contentProvider = contentProvider
        
        contentStates = Array(repeating: .collapsed, count: numberOfSections)
        contentStates[0] = .expanded
    }
    
    var body: some View {
        VStack {
            ForEach(0..<numberOfSections, id: \.self) { index in
                CollapsableContent(contentState: $contentStates[index]) {
                    sectionProvider(index)
                } content: {
                    contentProvider(index)
                }
            }
        }
    }
}

struct CollapsableContainerPreview: View {
    @State private var date = Date()
    
    var body: some View {
        VStack {
            CollapsableContainerView(numberOfSections: 2) { sectionIndex in
                section(for: sectionIndex)
            } contentProvider: { sectionIndex in
                content(for: sectionIndex)
            }

        }
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
        DatePicker("", selection: $date, in: Date()..., displayedComponents: [.date])
            .datePickerStyle(.graphical)
    }
}

#Preview {
    CollapsableContainerPreview()
        .preferredColorScheme(.dark)
}
