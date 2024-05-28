//
//  CollapsibleContent.swift
//  Tasky
//
//  Created by Mohsin Ali Ayub on 28.05.24.
//

import SwiftUI

protocol CollapsibleViewWithSection: View {
    associatedtype Section: View
    associatedtype CollapsibleContent: View
    
    var contentState: ContentState { get set }
    var section: () -> Section { get set }
    var content: () -> CollapsibleContent { get set }
    
    func updateContentState(_ state: ContentState)
}

extension CollapsibleViewWithSection {
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
                        updateContentState(contentState == .expanded ? .collapsed : .expanded)
                    }
                }
            if contentState == .expanded {
                content()
                    .transition(.asymmetric(insertion: .scale, removal: .identity))
            }
        }
    }
}

struct CollapsibleContent<Section, Content>: CollapsibleViewWithSection where Section: View, Content: View {
    @Binding var contentState: ContentState
    var section: () -> Section
    var content: () -> Content
    
    init(contentState: Binding<ContentState>, @ViewBuilder section: @escaping () -> Section, @ViewBuilder content: @escaping () -> Content) {
        self._contentState = contentState
        self.section = section
        self.content = content
    }
    
    func updateContentState(_ state: ContentState) {
        contentState = state
    }
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

#Preview {
    CollapsibleContentPreview()
        .preferredColorScheme(.dark)
}
