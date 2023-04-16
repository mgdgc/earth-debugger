//
//  Pollution.swift
//  Earth Debugger
//
//  Created by 최명근 on 2023/04/07.
//

import Foundation

struct Pollution {
    var water: Float = 1.0
    var air: Float = 1.0
    var soil: Float = 1.0
    var ocean: Float = 1.0
    var forest: Float = 1.0
}

struct Sustainable {
    var energy: Float = 1.0
    var fatigue: Float = 1.0
}

enum PollutionFactor {
    case water
    case air
    case soil
    case ocean
    case forest
}

enum SustainableFactor {
    case energy
    case fatigue
}
