//
//  SplitView.swift
//  Earth Debugger
//
//  Created by 최명근 on 2023/04/16.
//

import SwiftUI

struct SplitView<Content>: View where Content: View {
    
    @ViewBuilder var content: () -> Content
    
    var body: some View {
        GeometryReader { proxy in
            if proxy.size.width > proxy.size.height {
                HStack {
                    content()
                }
            } else {
                VStack {
                    content()
                }
            }
        }
    }
}
