//
//  File.swift
//  
//
//  Created by 최명근 on 2023/04/18.
//

import Foundation
import SwiftUI

struct Action: Identifiable {
    
    var id: UUID = UUID()
    
    var code: String
    var dependency: [SustainableFactor]
    var pollution: PollutionAffect
    var sustainable: SustainableAffect
    var description: String
    var color: Color
}

struct ActionGroup: Identifiable {
    var groupName: String
    var iconName: String
    var color: Color
    var actions: [Action]
    
    var id: String {
        groupName
    }
}

struct PollutionAffect {
    var water: Int
    var air: Int
    var soil: Int
    var ocean: Int
    var forest: Int
}

struct SustainableAffect {
    var motivated: Int
    var energy: Int
}
