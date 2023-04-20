//
//  SwiftUIView.swift
//  
//
//  Created by 최명근 on 2023/04/17.
//

import SwiftUI

struct CardView<Content>: View where Content: View {
    
    var backgroundColor: Color = Color(uiColor: .systemBackground)
    
    @ViewBuilder var content: () -> Content
    
    var body: some View {
        VStack {
            content()
                .padding()
        }
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(backgroundColor)
                .shadow(color: Color.black.opacity(0.3), radius: 12, x: 0, y: 8)
                .padding()
        )
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView {
            Text("asdf")
                .padding()
        }
    }
}
