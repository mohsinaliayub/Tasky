//
//  TaskCircleView.swift
//  Tasky
//
//  Created by Mohsin Ali Ayub on 19.05.24.
//

import SwiftUI

struct TaskCircleView: View {
    var isComplete: Bool
    
    var body: some View {
        Image(systemName: imageName)
            .font(.title2)
            .imageScale(.medium)
            .foregroundStyle(isComplete ? .gray : .purple)
    }
    
    private var imageName: String {
        isComplete ? "checkmark.circle" : "circle"
    }
}

#Preview {
    TaskCircleView(isComplete: false)
}
