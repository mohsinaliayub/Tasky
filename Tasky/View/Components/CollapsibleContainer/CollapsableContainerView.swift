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
                .onChange(of: contentStates[index]) {
                    if contentStates[index] == .expanded {
                        contentStates.indices.filter({ $0 != index }).forEach { contentStates[$0] = .collapsed }
                    }
                }
            }
        }
        .onAppear {
            contentStates[0] = .expanded
        }
    }
}
