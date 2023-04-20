//
//  CodeView.swift
//  Earth Debugging
//
//  Created by 최명근 on 2023/04/07.
//

import SwiftUI

struct BlockAddCell: View {
    var action: Action
    var onAddClick: (Action) -> Void
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        CardView(backgroundColor: action.color) {
            HStack(spacing: 16) {
                VStack(alignment: .leading) {
                    Text(action.code)
                        .font(.title.bold())
                        .foregroundColor(.white)
                    Text(action.description)
                        .font(.body)
                        .foregroundColor(.white)
                    
                    HStack(spacing: 12) {
                        if action.pollution.water != 0 {
                            HStack {
                                Image(systemName: "drop.fill")
                                Text("\(action.pollution.water)")
                            }
                        }
                        if action.pollution.air != 0 {
                            HStack {
                                Image(systemName: "wind")
                                Text("\(action.pollution.air)")
                            }
                        }
                        if action.pollution.soil != 0 {
                            HStack {
                                Image(systemName: "leaf.fill")
                                Text("\(action.pollution.soil)")
                            }
                        }
                        if action.pollution.ocean != 0 {
                            HStack {
                                Image(systemName: "water.waves")
                                Text("\(action.pollution.ocean)")
                            }
                        }
                        if action.pollution.forest != 0 {
                            HStack {
                                Image(systemName: "tree.fill")
                                Text("\(action.pollution.forest)")
                            }
                        }
                        if action.sustainable.motivated != 0 {
                            HStack {
                                Image(systemName: "figure.fall")
                                Text("\(action.sustainable.motivated)")
                            }
                        }
                        if action.sustainable.energy != 0 {
                            HStack {
                                Image(systemName: "bolt.fill")
                                Text("\(action.sustainable.energy)")
                            }
                        }
                    }
                    .foregroundColor(.white)
                    .padding(8)
                }
                Spacer()
                
                Button("Add") {
                    onAddClick(action)
                    dismiss()
                }
                .buttonStyle(.bordered)
                .buttonBorderShape(.capsule)
                .foregroundColor(.white)
                
            }
            .padding()
        }
    }
}

struct BlockAddView: View {
    
    var actionGroup: ActionGroup
    var onAddClick: (Action) -> Void
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            HStack {
                Text(actionGroup.groupName)
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
                        .foregroundColor(Color(uiColor: .label))
                }
            }
            .padding()
            
            Divider()
            
            List(actionGroup.actions) { action in
                BlockAddCell(action: action) { action in
                    onAddClick(action)
                }
                .listRowSeparator(.hidden)
            }
            .listStyle(.plain)
        }
        .padding()
    }
}

struct BlockCell: View {
    var action: Action
    
    var onRemove: () -> Void
    
    var body: some View {
        CardView(backgroundColor: action.color) {
            HStack(spacing: 16) {
                VStack(alignment: .leading) {
                    Text(action.code)
                        .font(.title.bold())
                        .foregroundColor(.white)
                    Text(action.description)
                        .font(.body)
                        .foregroundColor(.white)
                }
                Spacer()
                
                Button {
                    onRemove()
                } label: {
                    Image(systemName: "xmark")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 16, height: 16)
                        .foregroundColor(Color.white)
                }
                .buttonStyle(.plain)
            }
            .padding()
        }
    }
}

struct InitialBlockCell: View {
    var body: some View {
        CardView {
            VStack {
                Text("Oops! There's something wrong with the Earth!")
                Text("Is there any code we can write to fix the Earth?")
                Divider()
                Text("Code Start")
                    .font(.title)
                    .foregroundColor(Color.accentColor)
                Image(systemName: "arrow.down")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 24)
                    .foregroundColor(Color.accentColor)
            }
            .padding()
        }
    }
}

struct CodeView: View {
    
    @State var blocks: [Action] = []
    
    @Binding var earth: Earth
    @Binding var result: [CodeResult]?
    
    @State private var initialEarth: Earth?
    
    @State private var selectedActionGroup: ActionGroup?
    
    @State private var hasRun: Bool = false
    
    var body: some View {
        ZStack {
            List {
                
                InitialBlockCell()
                    .listRowSeparator(.hidden)
                
                ForEach(Array(zip(blocks.indices, blocks)), id: \.0) { i, b in
                    BlockCell(action: b) {
                        self.blocks.remove(at: i)
                    }
                    .listRowSeparator(.hidden)
                }
                .onMove { indices, newOffset in
                    blocks.move(fromOffsets: indices, toOffset: newOffset)
                }
                
                Spacer()
                    .frame(height: 100)
                    .listRowSeparator(.hidden)
                
            }
            .listStyle(.plain)
            
            // MARK: Control
            VStack {
                Spacer()
                
                HStack {
                    
                    if hasRun {
                        // MARK: Clear Button
                        Button {
                            hasRun = false
                            
                            if let initialEarth = initialEarth {
                                earth = initialEarth
                            }
                            
                        } label: {
                            HStack {
                                Image(systemName: "arrow.clockwise")
                                Text("Retry")
                                    .font(.headline)
                            }
                        }
                        .buttonStyle(.bordered)
                        .buttonBorderShape(.capsule)
                        .padding()
                        
                    } else {
                        // MARK: Run Button
                        Button {
                            
                            hasRun = true
                            result = run()
                            
                        } label: {
                            HStack {
                                Image(systemName: "play.fill")
                                Text("Run")
                                    .font(.headline)
                            }
                        }
                        .buttonStyle(.borderedProminent)
                        .buttonBorderShape(.capsule)
                        .padding()
                    }
                    
                    Divider()
                        .frame(height: 48)
                    
                    // MARK: Blocks
                    ScrollView(.horizontal) {
                        LazyHStack {
                            
                            VStack {
                                Text("Choose\ncodes here")
                                    .font(.caption)
                                    .multilineTextAlignment(.center)
                                Image(systemName: "arrow.right")
                            }
                            
                            ForEach(CodeDataSource.actionGroups) { actionGroup in
                                
                                VStack {
                                    Image(actionGroup.iconName)
                                        .resizable()
                                        .renderingMode(.template)
                                        .colorMultiply(actionGroup.color)
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 24, height: 24)
                                    
                                    Text(actionGroup.groupName)
                                }
                                .foregroundColor(actionGroup.color)
                                .padding()
                                .onTapGesture {
                                    selectedActionGroup = actionGroup
                                }
                                
                            }
                            
                        }
                    }
                    .frame(height: 56)
                    .sheet(item: $selectedActionGroup, content: { actionGroup in
                        BlockAddView(actionGroup: actionGroup) { action in
                            withAnimation {
                                blocks.append(action)
                            }
                        }
                    })
                }
                .background(
                    Color(uiColor: .secondarySystemBackground)
                        .shadow(color: Color.black.opacity(0.3), radius: 8, x: 0, y: 2)
                        .edgesIgnoringSafeArea(.bottom)
                )
                
            }
            .background(Color.clear)
        }
        .onAppear {
            self.initialEarth = earth
        }
    }
    
    
    // MARK: Run function
    private func run() -> [CodeResult] {
        
        var result: [CodeResult] = []
        
        for block in blocks {
            
            // Check runnable: motivated
            if block.dependency.contains(.motivated) {
                print("\(earth.motivated.amount) \(block.sustainable.motivated)")
                if earth.motivated.amount < abs(block.sustainable.motivated) {
                    result.append(CodeResult(code: block, result: .failed, message: "People might not be motivated enough to run this code. (current: \(earth.motivated), required: \(abs(block.sustainable.motivated)))"))
                    continue
                }
            }
            
            // Check runnable: motivated
            if block.dependency.contains(.energy) {
                if earth.energy.amount < abs(block.sustainable.energy) {
                    result.append(CodeResult(code: block, result: .failed, message: "More energies required to run this code. (current: \(earth.energy), required: \(abs(block.sustainable.energy)))"))
                    continue
                }
            }
            
            var pollutionAffected: [String : BeforeAfterValue] = [:]
            var sustainableAffected: [String : BeforeAfterValue] = [:]
            
            if block.pollution.water != 0 {
                let ba = earth.water.calculate(block.pollution.water)
                if ba.hasChanged {
                    pollutionAffected["water"] = ba
                }
            }
            
            if block.pollution.air != 0 {
                let ba = earth.air.calculate(block.pollution.air)
                if ba.hasChanged {
                    pollutionAffected["air"] = ba
                }
            }
            
            if block.pollution.soil != 0 {
                let ba = earth.soil.calculate(block.pollution.soil)
                if ba.hasChanged {
                    pollutionAffected["soil"] = ba
                }
            }
            
            if block.pollution.ocean != 0 {
                let ba = earth.ocean.calculate(block.pollution.ocean)
                if ba.hasChanged {
                    pollutionAffected["ocean"] = ba
                }
            }
            
            if block.pollution.forest != 0 {
                let ba = earth.forest.calculate(block.pollution.forest)
                if ba.hasChanged {
                    pollutionAffected["deforestation"] = ba
                }
            }
            
            if block.sustainable.motivated != 0 {
                let ba = earth.motivated.calculate(block.sustainable.motivated)
                if ba.hasChanged {
                    sustainableAffected["motivated"] = ba
                }
            }
            
            if block.sustainable.energy != 0 {
                let ba = earth.energy.calculate(block.sustainable.energy)
                if ba.hasChanged {
                    sustainableAffected["energy"] = ba
                }
            }
            
            var affectedString = ""
            for (key, value) in pollutionAffected {
                affectedString.append("\(key)(\(value.before.reverseAmount)→\(value.after.reverseAmount)) ")
            }
            
            for (key, value) in sustainableAffected {
                affectedString.append("\(key)(\(value.before.amount)→\(value.after.amount)) ")
            }
            
            if pollutionAffected.isEmpty && sustainableAffected.isEmpty {
                result.append(CodeResult(code: block, message: "No status has been changed."))
            } else {
                result.append(CodeResult(code: block, message: "\(affectedString) status has been affected."))
            }
            
        }
        
        return result
    }
    
    
}

struct CodeView_Previews: PreviewProvider {
    static var previews: some View {
        CodeView(earth: .constant(
            Earth(
                water: Amount(0),
                air: Amount(0.1),
                soil: Amount(0.2),
                ocean: Amount(0.1),
                forest: Amount(0),
                motivated: Amount(),
                energy: Amount()
            )
        ), result: .constant(nil))
    }
}
