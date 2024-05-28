//
//  CollapsibleContent.swift
//  Tasky
//
//  Created by Mohsin Ali Ayub on 28.05.24.
//

import SwiftUI

protocol CollapsibleViewWithSection: View {
    associatedtype Section: View
    associatedtype Content: View
    
    var contentState: Binding<ContentState> { get set }
    var section: () -> Section { get set }
    var content: () -> Content { get set }
    
    init(contentState: Binding<ContentState>, section: @escaping () -> Section, content: @escaping () -> Content)
}

extension CollapsibleViewWithSection {
    init(contentState: Binding<ContentState>, @ViewBuilder _ section: @escaping () -> Section, @ViewBuilder _ content: @escaping () -> Content) {
        self.init(contentState: contentState, section: section, content: content)
        self.contentState = contentState
        self.section = section
        self.content = content
    }
    
    var body: some View {
        VStack {
            section()
                .padding(12)
                .background {
                    RoundedRectangle(cornerRadius: 5)
                        .foregroundStyle(.gray.opacity(0.3))
                }
                .onTapGesture {
                    withAnimation {
                        contentState.wrappedValue = (contentState.wrappedValue == .expanded) ? .collapsed : .expanded
                    }
                }
            if contentState.wrappedValue == .expanded {
                content()
                    .transition(.asymmetric(insertion: .scale, removal: .identity))
            }
        }
    }
}

struct CollapsibleContent<Section, Content>: CollapsibleViewWithSection where Section: View, Content: View {
    var contentState: Binding<ContentState>
    var section: () -> Section
    var content: () -> Content
}

struct CollapsibleContentPreview: View {
    @State var contentState = ContentState.expanded
    @State var date = Date()
    
    var body: some View {
        CollapsibleContent(contentState: $contentState) {
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

struct CollapsibleContainer: View {
    var body: some View {
        VStack {
            
        }
    }
}

struct CollapsibleViewWithSectionPreview: View {
    @State private var state = ContentState.expanded
    
    var body: some View {
        VStack {
            
        }
    }
}

#Preview {
    CollapsibleContentPreview()
        .preferredColorScheme(.dark)
}

#Preview {
    CollapsibleViewWithSectionPreview()
        .preferredColorScheme(.dark)
}
