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
    
    init(contentState: Binding<ContentState>, @ViewBuilder section: @escaping () -> Section, @ViewBuilder content: @escaping () -> Content) {
        self._contentState = contentState
        self.section = section
        self.content = content
    }
    
    var body: some View {
        Text("Hello, World!")
    }
}

#Preview {
    @State var contentState = ContentState.expanded
    return CollapsibleContent(contentState: $contentState) {
        
    } content: {
        
    }

}
