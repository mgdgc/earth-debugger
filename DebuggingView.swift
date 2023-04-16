//
//  CodeView.swift
//  Earth Debugging
//
//  Created by 최명근 on 2023/04/07.
//

import SwiftUI


struct DebuggingView: View {
    
    @State var earth: Earth = Earth(
        water: Amount(),
        air: Amount(0.1),
        soil: Amount(0.2),
        ocean: Amount(0.1),
        forest: Amount(0.1),
        fatigue: Amount(),
        energy: Amount()
    )
    
    var body: some View {
        SplitView {
            CodeView()
            EarthView(earth: $earth)
        }
        
    }
}


struct DebuggingView_Previews: PreviewProvider {
    static var previews: some View {
        DebuggingView()
            .previewDevice("iPhone 14 Pro")
            .previewInterfaceOrientation(.landscapeRight)
    }
}
