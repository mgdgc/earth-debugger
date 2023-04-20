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
    var motivated: Amount = Amount()
    var energy: Amount = Amount()
    
    var isHealthy: Bool {
        water.percentage < 0.1
        && air.percentage < 0.1
        && soil.percentage < 0.1
        && ocean.percentage < 0.1
        && forest.percentage < 0.1
    }
    
    mutating func effect(pollution: [PollutionFactor : Float]? = nil, sustainable: [SustainableFactor : Float]? = nil) {
        
        // Pollution Effect
        if let pollution = pollution {
            if let waterEffect = pollution[.water] {
                water.effect(percentage: waterEffect)
            }
            
            if let airEffect = pollution[.air] {
                air.effect(percentage: airEffect)
            }
            
            if let soilEffect = pollution[.soil] {
                soil.effect(percentage: soilEffect)
            }
            
            if let oceanEffect = pollution[.ocean] {
                ocean.effect(percentage: oceanEffect)
            }
            
            if let forestEffect = pollution[.forest] {
                forest.effect(percentage: forestEffect)
            }
        }
        
        // Sustainable Effect
        if let sustainable = sustainable {
            if let motivatedEffect = sustainable[.motivated] {
                motivated.effect(percentage: motivatedEffect)
            }
            
            if let energyEffect = sustainable[.energy] {
                energy.effect(percentage: energyEffect)
            }
        }
    }
    
}


