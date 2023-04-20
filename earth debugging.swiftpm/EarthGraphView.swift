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
                GraphView(title: "Water\nPollution", systemImage: "drop.fill", colors: [Color.blue, Color.cyan], progress: earth.water.percentage)
                GraphView(title: "Air\nPollution", systemImage: "wind", colors: [Color.blue, Color.cyan], progress: earth.air.percentage)
                GraphView(title: "Soil\nPollution", systemImage: "leaf.fill", colors: [Color.blue, Color.cyan], progress: earth.soil.percentage)
                GraphView(title: "Ocean\nPollution", systemImage: "water.waves", colors: [Color.blue, Color.cyan], progress: earth.ocean.percentage)
                GraphView(title: "Deforestation", systemImage: "tree.fill", colors: [Color.blue, Color.cyan], progress: earth.forest.percentage)
                Divider()
                GraphView(title: "Motivated", systemImage: "figure.fall", colors: [Color.green, Color.teal], progress: earth.motivated.percentage)
                GraphView(title: "Energy", systemImage: "bolt.fill", colors: [Color.yellow, Color.orange], progress: earth.energy.percentage)
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
                motivated: Amount(),
                energy: Amount()
            )))
            Spacer()
        }
        .background(Color.black)
    }
}
