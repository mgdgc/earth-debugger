//
//  GraphView.swift
//  Earth Debugger
//
//  Created by 최명근 on 2023/04/16.
//

import SwiftUI


struct ProgressBar: View {
    
    var colors: [Color]
    var progress: Float
    
    var body: some View {
        GeometryReader { proxy in
            ZStack(alignment: .leading) {
                
                LinearGradient(colors: colors, startPoint: .leading, endPoint: .trailing)
                    .frame(height: 16)
                    .mask(
                        RoundedRectangle(cornerRadius: 8)
                    )
                    .opacity(0.3)
                
                
                LinearGradient(colors: colors, startPoint: .leading, endPoint: .trailing)
                    .frame(height: 16)
                    .frame(width: proxy.size.width * CGFloat(progress))
                    .mask(
                        RoundedRectangle(cornerRadius: 8)
                    )
            }
        }
        .frame(height: 16)
    }
}

struct GraphView: View {
    
    var title: String
    var systemImage: String
    var colors: [Color]
    var progress: Float
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: systemImage)
                    .frame(width: 24)
                    .foregroundColor(Color.black)
                Text(title)
                    .font(.caption.bold())
                    .foregroundColor(Color.black)
                    .frame(width: 86)
                    .multilineTextAlignment(.center)
                ProgressBar(colors: colors, progress: progress)
            }
        }
    }
}

struct GraphView_Previews: PreviewProvider {
    static var previews: some View {
        GraphView(title: "Title", systemImage: "wind", colors: [Color.blue, Color.indigo], progress: 0.3)
    }
}
