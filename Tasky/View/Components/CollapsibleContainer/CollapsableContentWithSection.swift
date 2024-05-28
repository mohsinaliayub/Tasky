//
//  CollapsableContentWithSection.swift
//  Tasky
//
//  Created by Mohsin Ali Ayub on 28.05.24.
//

import SwiftUI

enum ContentState {
    case collapsed
    case expanded
}

protocol CollapsableContentWithSection: View {
    associatedtype Section: View
    associatedtype Content: View
    
    var contentState: Binding<ContentState> { get set }
    var section: () -> Section { get set }
    var content: () -> Content { get set }
    
    init(contentState: Binding<ContentState>, section: @escaping () -> Section, content: @escaping () -> Content)
}

extension CollapsableContentWithSection {
    init(contentState: Binding<ContentState>, @ViewBuilder _ section: @escaping () -> Section, @ViewBuilder _ content: @escaping () -> Content) {
        self.init(contentState: contentState, section: section, content: content)
        self.contentState = contentState
        self.section = section
        self.content = content
    }
    
    var body: some View {
        VStack {
            sectionView
            if contentState.wrappedValue == .expanded {
                content()
                    .transition(.asymmetric(insertion: .scale, removal: .identity))
            }
        }
    }
    
    var sectionView: some View {
        section()
            .padding(12)
            .background {
                RoundedRectangle(cornerRadius: 5)
                    .foregroundStyle(.gray.opacity(0.3))
            }
            .onTapGesture {
                withAnimation {
//                    contentState.wrappedValue = (contentState.wrappedValue == .expanded) ? .collapsed : .expanded
                    // Only expand the content, collapsing of the content is managed by CollapsableContainer
                    // FIXME: Fix the logic so it can be used as a separate component
                    contentState.wrappedValue = .expanded
                }
            }
    }
}

struct CollapsableContent<Section, Content>: CollapsableContentWithSection where Section: View, Content: View {
    var contentState: Binding<ContentState>
    var section: () -> Section
    var content: () -> Content
}

struct CollapsableContentWithSectionPreview: View {
    @State var contentState = ContentState.expanded
    @State var date = Date()
    
    var body: some View {
        CollapsableContent(contentState: $contentState) {
            HStack {
                Image(systemName: "calendar")
                Text("Pick a date").font(.caption.bold())
                Spacer()
            }
        } content: {
            DatePicker("", selection: $date, in: Date()..., displayedComponents: [.date])
                .datePickerStyle(.graphical)
        }
    }
}

#Preview {
    CollapsableContentWithSectionPreview()
        .preferredColorScheme(.dark)
}
