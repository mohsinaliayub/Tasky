//
//  CollapsibleContent.swift
//  Tasky
//
//  Created by Mohsin Ali Ayub on 28.05.24.
//

import SwiftUI

struct CollapsibleContent<Section, Content>: View where Section: View, Content: View {
    @Binding var contentState: ContentState
    var section: () -> Section
    var content: () -> Content
    
    private let drawingConstants = DrawingConstants()
    
    init(contentState: Binding<ContentState>, @ViewBuilder section: @escaping () -> Section, @ViewBuilder content: @escaping () -> Content) {
        self._contentState = contentState
        self.section = section
        self.content = content
    }
    
    var body: some View {
        VStack {
            sectionView
            if contentState == .expanded {
                content()
                    .transition(.asymmetric(insertion: .scale, removal: .identity)) // FIXME: Fix this transition to scale from top-leading
            }
        }
    }
    
    @ViewBuilder
    private var sectionView: some View {
        section()
            .padding(drawingConstants.sectionPadding)
            .background(sectionBackground)
            .onTapGesture {
                print("\(contentState)", terminator: ":")
                withAnimation(.linear) {
                    contentState = (contentState == .expanded) ? .collapsed : .expanded
                }
                print("\(contentState)")
            }
    }
    
    private var sectionBackground: some View {
        RoundedRectangle(cornerRadius: drawingConstants.sectionBackgroundCornerRadius)
            .foregroundStyle(drawingConstants.sectionBackgroundColor)
    }
    
    private struct DrawingConstants {
        let sectionPadding: CGFloat = 16
        let sectionBackgroundCornerRadius: CGFloat = 5
        let sectionBackgroundColor = Color.gray.opacity(0.3)
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
