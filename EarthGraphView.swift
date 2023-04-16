//
//  EarthGraphView.swift
//  Earth Debugger
//
//  Created by 최명근 on 2023/04/16.
//

import SwiftUI

struct EarthGraphView: View {
    
    @Binding var earth: Earth
    
    var body: some View {
        VStack {
            VStack {
                GraphView(title: "Water\nPollution", systemImage: "drop.fill", colors: [Color.blue, Color.cyan], progress: earth.water.reversePercentage)
                GraphView(title: "Air\nPollution", systemImage: "wind", colors: [Color.purple, Color.pink], progress: earth.air.reversePercentage)
                GraphView(title: "Soil\nPollution", systemImage: "leaf.fill", colors: [Color.yellow, Color.orange], progress: earth.soil.reversePercentage)
                GraphView(title: "Ocean\nPollution", systemImage: "water.waves", colors: [Color.indigo, Color.blue], progress: earth.ocean.reversePercentage)
                GraphView(title: "Deforestation", systemImage: "tree.fill", colors: [Color.green, Color.teal], progress: earth.forest.reversePercentage)
            }
            .padding()
        }
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.white.opacity(0.8))
        )
    }
}

struct EarthGraphView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Spacer()
            EarthGraphView(earth: .constant(Earth(
                water: Amount(0.5),
                air: Amount(0.1),
                soil: Amount(0.2),
                ocean: Amount(0.1),
                forest: Amount(0.1),
                fatigue: Amount(),
                energy: Amount()
            )))
            Spacer()
        }
        .background(Color.black)
    }
}
