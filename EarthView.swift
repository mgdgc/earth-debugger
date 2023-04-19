//
//  EarthView.swift
//  Earth Debugger
//
//  Created by 최명근 on 2023/04/15.
//

import SwiftUI

struct EarthLayer: View {
    @Binding var earth: Earth
    
    // earth frame
    @State private var earthFrame: CGRect = CGRect.zero
    
    let oceanImages = ["can_1", "can_2", "fish_1", "fish_2", "fish_3", "plastic_bag_1", "plastic_bag_2"]
    
    var body: some View {
        // MARK: - Earth
        VStack {
            
            ZStack {
                
                // MARK: Base Earth
                Image("earth")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding()
                    .background(
                        GeometryReader { proxy in
                            Spacer()
                                .onAppear {
                                    earthFrame = proxy.frame(in: .global)
                                }
                        }
                    )
                
                
                // MARK: Water Pollution
                if earth.water.percentage < 1.0 {
                    Image("red_ocean")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding()
                        .opacity(Double(earth.water.percentage))
                }
                
                
                // MARK: Forest
                if earth.forest.percentage < 1.0 {
                    Image("desert")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding()
                        .opacity(Double(earth.forest.percentage))
                }
                
                
                // MARK: Soil Pollution
                if earth.soil.percentage < 1.0 {
                    ZStack {
                        GeometryReader { proxy in
                            ForEach(0..<Int(earth.soil.percentage * 10)) { i in
                                Image("trash")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: CGFloat.random(in: 24...36))
                                    .position(
                                        x: CGFloat.random(in: ((proxy.size.width / 2) - (earthFrame.width / 2) + (earthFrame.width / 3)) ... ((proxy.size.width / 2) + (earthFrame.width / 2)) - (earthFrame.width / 3)),
                                        
                                        y: CGFloat.random(in: (proxy.size.height / 2) - (earthFrame.height / 2) + (earthFrame.height / 10) ... proxy.size.height / 2 - (earthFrame.height / 10))
                                    )
                            }
                        }
                    }
                    .mask(Circle().padding())
                }
                
                
                // MARK: Ocean Pollution
                if earth.ocean.percentage < 1.0 {
                    ZStack {
                        GeometryReader { proxy in
                            ForEach(0..<Int(earth.ocean.percentage * 20)) { i in
                                Image(oceanImages[Int.random(in: 0..<oceanImages.count)])
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: CGFloat.random(in: 24...36))
                                    .position(
                                        x: CGFloat.random(in: ((proxy.size.width / 2) - (earthFrame.width / 2) + (earthFrame.width / 3)) ... ((proxy.size.width / 2) + (earthFrame.width / 2)) - (earthFrame.width / 3)),
                                        
                                        y: CGFloat.random(in: (proxy.size.height / 2) + (earthFrame.size.height / 10) ... (proxy.size.height / 2) + (earthFrame.height / 2) - (earthFrame.size.height / 10))
                                    )
                            }
                        }
                    }
                    .mask(Circle().padding())
                }
                
                
                // MARK: Air Pollution
                if earth.air.percentage < 1.0 {
                    Color.green.opacity(Double(earth.air.percentage * 0.2))
                        .mask(Circle())
                        .padding()
                }
            }
            
        }
        .frame(maxWidth: 500, maxHeight: 500)
    }
}

struct EarthView: View {
    
    @Binding var earth: Earth
    
    // earth status graph
    @State private var showStatusGraph: Bool = false
    
    var body: some View {
        ZStack {
            
            Color.black.edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer()
                EarthLayer(earth: $earth)
                Spacer()
                
                if UIDevice.current.userInterfaceIdiom == .pad {
                    EarthGraphView(earth: $earth)
                        .frame(maxWidth: 360)
                        .padding()
                }
            }
            
            if UIDevice.current.userInterfaceIdiom == .phone {
                VStack {
                    Spacer()
                    
                    HStack {
                        Spacer()
                        
                        Button {
                            withAnimation {
                                showStatusGraph.toggle()
                            }
                        } label: {
                            Image(systemName: showStatusGraph ? "xmark" : "chart.bar.doc.horizontal")
                        }
                        .buttonStyle(.borderedProminent)
                    }
                }
                .padding()
                
                if showStatusGraph {
                    EarthGraphView(earth: $earth)
                        .frame(maxWidth: 360)
                        .padding()
                }

            }
            
        }
    }
}

struct EarthView_Previews: PreviewProvider {
    static var previews: some View {
        EarthView(earth: .constant(
            Earth(
                water: Amount(0),
                air: Amount(0.1),
                soil: Amount(0.2),
                ocean: Amount(0.1),
                forest: Amount(0),
                motivated: Amount(),
                energy: Amount()
            )
        ))
        .previewDevice("iPhone 14 Pro")
        .previewInterfaceOrientation(.landscapeLeft)
    }
}
