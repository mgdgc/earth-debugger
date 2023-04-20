//
//  CodeView.swift
//  Earth Debugging
//
//  Created by 최명근 on 2023/04/07.
//

import SwiftUI


struct DebuggingView: View {
    
    @State var earth: Earth = Earth(
        water: Amount(0.8),
        air: Amount(0.8),
        soil: Amount(0.8),
        ocean: Amount(0.8),
        forest: Amount(0.8),
        motivated: Amount(0.7),
        energy: Amount(0.7)
    )
    
    @State var result: [CodeResult]? = []
    
    var body: some View {
        ZStack {
            // MARK: Split View
            SplitView {
                CodeView(earth: $earth, result: $result)
                EarthView(earth: $earth)
            }
            
            if let results = result, !results.isEmpty {
                ZStack {
                    Color.black.opacity(0.3).ignoresSafeArea()
                        .onTapGesture {
                            result = nil
                        }
                    
                    CardView {
                        VStack(alignment: .leading) {
                            HStack {
                                Text("Code Result")
                                    .font(.largeTitle.bold())
                                
                                Spacer()
                                
                                Button {
                                    result = nil
                                } label: {
                                    Image(systemName: "xmark")
                                        .resizable()
                                        .frame(width: 16, height: 16)
                                        .background(
                                            Circle()
                                                .fill(Color(uiColor: .secondarySystemBackground))
                                                .frame(width: 32, height: 32)
                                        )
                                        .foregroundColor(Color(uiColor: .label))
                                }
                            }
                            .padding()
                            
                            Divider()
                            
                            ResultView(earth: earth, results: results) {
                                result = nil
                            }
                        }
                        .padding()
                    }
                    .frame(maxWidth: 680, maxHeight: 720)
                    .padding()
                }
            }
        }
    }
}


struct DebuggingView_Previews: PreviewProvider {
    static var previews: some View {
        DebuggingView()
            .previewDevice("iPad Pro (12.9-inch) (6th generation)")
            .previewInterfaceOrientation(.landscapeRight)
    }
}
