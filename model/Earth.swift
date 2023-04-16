//
//  Earth.swift
//  Earth Debugging
//
//  Created by 최명근 on 2023/04/07.
//

import Foundation

struct Earth {
    
    // MARK: Polution Factors
    var water: Amount = Amount()
    var air: Amount = Amount()
    var soil: Amount = Amount()
    var ocean: Amount = Amount()
    var forest: Amount = Amount()
    
    // MARK: Sustainability Factors
    var fatigue: Amount = Amount()
    var energy: Amount = Amount()
    
}

struct Amount {
    let max: Float
    var amount: Float
    
    init(max: Float = 100, amount: Float = 100) {
        self.max = max
        self.amount = amount
    }
    
    init(max: Float = 100, _ percentage: Float) {
        self.max = max
        self.amount = percentage * max
    }
    
    var percentage: Float {
        amount / max
    }
    
    var reversePercentage: Float {
        1.0 - amount / max
    }
}
