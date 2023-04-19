//
//  InfoView.swift
//  Earth Debugger
//
//  Created by 최명근 on 2023/04/17.
//

import SwiftUI

struct InfoCell: View {
    var title: String
    var image: String
    var source: String
    var url: String
    
    var body: some View {
        VStack {
            HStack {
                Text(title)
                    .font(.title)
                Spacer()
            }
            HStack {
                Text("from: \(source)")
                Spacer()
            }
            Divider()
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fit)
            Text(url)
                .font(.caption.italic())
            if let url = URL(string: url) {
                HStack {
                    Spacer()
                    Link(destination: url) {
                        HStack {
                            Text("Open Link")
                            Image(systemName: "link")
                        }
                    }
                }
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 24)
                .fill(Color(uiColor: UIColor.systemBackground))
                .shadow(color: Color.black.opacity(0.15), radius: 16, x: 0, y: 8)
        )
    }
}

struct InfoView: View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            ScrollView {
                LazyVStack {
                    HStack {
                        Text("Source")
                            .font(.largeTitle.bold())
                        Spacer()
                        Button {
                            dismiss()
                        } label: {
                            Image(systemName: "xmark")
                                .resizable()
                                .frame(width: 16, height: 16)
                                .background(
                                    Circle()
                                        .fill(Color(uiColor: .secondarySystemBackground))
                                        .frame(width: 32, height: 32)
                                )
                        }
                        
                    }
                    .padding()
                    
                    InfoCell(title: "Earth Picture", image: "earth", source: "Wikipedia", url: "https://en.wikipedia.org/wiki/Earth")
                        .listRowSeparator(.hidden)
                }
                .padding()
            }
        }
        .navigationTitle("Licenses")
        
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
    }
}
