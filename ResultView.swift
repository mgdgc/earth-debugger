//
//  ResultView.swift
//  Earth Debugger
//
//  Created by 최명근 on 2023/04/19.
//

import SwiftUI


struct ResultCell: View {
    
    var result: CodeResult
    
    var body: some View {
        CardView {
            
            VStack(alignment: .leading) {
                
                if result.result == .success {
                    HStack {
                        Image(systemName: "checkmark")
                        Text("Success")
                    }
                    .padding(8)
                    .background(
                        RoundedRectangle(cornerRadius: .infinity)
                            .fill(Color.green)
                    )
                    .foregroundColor(.white)
                } else {
                    HStack {
                        Image(systemName: "xmark")
                        Text("Failed")
                    }
                    .padding(8)
                    .background(
                        RoundedRectangle(cornerRadius: .infinity)
                            .fill(Color.red)
                    )
                    .foregroundColor(.white)
                }
                
                Text(result.code.code)
                    .font(.largeTitle.bold())
                
                Spacer()
                    .frame(height: 16)
                
                HStack {
                    if let message = result.message {
                        Image(systemName: "arrow.turn.down.right")
                        Text(message)
                    }
                    Spacer()
                }
                
                
            }
            .padding()
        }
    }
    
}

struct ResultView: View {
    
    @State var earth: Earth
    var results: [CodeResult]
    
    var onConfirm: (() -> Void)?
    
    var body: some View {
        List {
            
            VStack(alignment: .center) {
                
                Text(earth.isHealthy ? "Great!!" : "Earth Still Needs Help!")
                    .font(.largeTitle.bold())
                
                HStack {
                    Spacer()
                    Image(earth.isHealthy ? "earth_healthy" : "earth_sick")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: 400, maxHeight: 400)
                    Spacer()
                }
                
                EarthGraphView(earth: $earth)
                    .frame(maxWidth: 360)
            }
            .padding()
            
            ForEach(results) { result in
                ResultCell(result: result)
                    .listRowSeparator(.hidden)
            }
            
            HStack {
                Spacer()
                VStack {
                    Image(systemName: "arrow.down.to.line")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 64, height: 64)
                        .foregroundColor(.accentColor)
                    Button("End Running") {
                        if let onConfirm = onConfirm {
                            onConfirm()
                        }
                    }
                    .buttonStyle(.borderedProminent)
                    .font(.title.bold())
                    .foregroundColor(.white)
                    .padding()
                }
                Spacer()
            }
            .listRowSeparator(.hidden)
            .padding()
            
        }
        .listStyle(.plain)
    }
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView(
            earth: Earth(
                water: Amount(),
                air: Amount(0.1),
                soil: Amount(0.2),
                ocean: Amount(0.1),
                forest: Amount(0.1),
                motivated: Amount(),
                energy: Amount()
            ),
            results: [
                CodeResult(code: Action(code: "reduceBeef()", dependency: [], pollution: PollutionAffect(water: 0, air: 0, soil: 0, ocean: 0, forest: 0), sustainable: SustainableAffect(motivated: 0, energy: 0), description: "success", color: .blue)),
                
                CodeResult(code: Action(code: "reduceBeef()", dependency: [], pollution: PollutionAffect(water: 0, air: 0, soil: 0, ocean: 0, forest: 0), sustainable: SustainableAffect(motivated: 0, energy: 0), description: "No status has been changed", color: .blue), message: "water(20->30) air(10->20) changed"),
                
                CodeResult(code: Action(code: "reduceBeef()", dependency: [], pollution: PollutionAffect(water: 0, air: 0, soil: 0, ocean: 0, forest: 0), sustainable: SustainableAffect(motivated: 0, energy: 0), description: "success", color: .blue), result: .failed, message: "Not enough motivation(current: 50, required: 60)")
            ])
    }
}
