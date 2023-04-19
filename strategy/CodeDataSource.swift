//
//  Food.swift
//  Earth Debugger
//
//  Created by 최명근 on 2023/04/11.
//

import Foundation
import SwiftUI

class CodeDataSource {
    
    static var actionGroups: [ActionGroup] {
        [
            energy, food
        ]
    }
    
    static var energy: ActionGroup {
        ActionGroup(
            groupName: "Energy",
            iconName: "energy",
            color: Color.orange,
            actions: [
                // MARK: increaseThermalPowerPlant()
                Action(
                    code: "increaseThermalPowerPlant()",
                    dependency: [],
                    pollution: PollutionAffect(water: 0, air: 25, soil: 0, ocean: 0, forest: 0),
                    sustainable: SustainableAffect(motivated: 0, energy: 20),
                    description: "Thermal power plants generate most of the planet's electricity, but they also heavily pollute the atmosphere in the process.",
                    color: Color.orange
                ),
                // MARK: reduceThermalPowerPlant()
                Action(
                    code: "reduceThermalPowerPlant()",
                    dependency: [.energy],
                    pollution: PollutionAffect(water: 0, air: -20, soil: 0, ocean: 0, forest: 0),
                    sustainable: SustainableAffect(motivated: 0, energy: -10),
                    description: "Preventing air pollution by reducing thermal power plants might be a good thing-if the alternative energy is ready.",
                    color: Color.orange
                ),
                // MARK: increaseWindPowerPlant()
                Action(
                    code: "increaseWindPowerPlant()",
                    dependency: [.energy],
                    pollution: PollutionAffect(water: 0, air: -20, soil: 0, ocean: 0, forest: 0),
                    sustainable: SustainableAffect(motivated: 0, energy: -10),
                    description: "Preventing air pollution by reducing thermal power plants might be a good thing-if the alternative energy is ready.",
                    color: Color.orange
                ),
            ]
        )
    }
    
    static var food: ActionGroup {
        ActionGroup(
            groupName: "Food",
            iconName: "food",
            color: Color.green,
            actions: [
                // MARK: reduceBeef()
                Action(
                    code: "reduceBeef()",
                    dependency: [.motivated],
                    pollution: PollutionAffect(water: 0, air: -20, soil: -10, ocean: 0, forest: -10),
                    sustainable: SustainableAffect(motivated: -20, energy: 0),
                    description: "Reduce beef consumption. Beef produces greenhouse gases two times more than a pork, four times more than a chicken.",
                    color: Color.green
                ),
                // MARK: increaseBeef()
                Action(
                    code: "increaseBeef()",
                    dependency: [],
                    pollution: PollutionAffect(water: 0, air: 20, soil: 10, ocean: 0, forest: 10),
                    sustainable: SustainableAffect(motivated: 20, energy: 0),
                    description: "Increase beef consumption. Beef gives people joy.",
                    color: Color.green
                ),
                // MARK: increasePotato()
                Action(
                    code: "increasePotato()",
                    dependency: [],
                    pollution: PollutionAffect(water: 0, air: -10, soil: -5, ocean: 0, forest: 0),
                    sustainable: SustainableAffect(motivated: 0, energy: 0),
                    description: "Potatoes can be grown using less water than other plants, and they don't require nitrogen fertilizers because they thrive in barren soil. They're even delicious.",
                    color: Color.green
                ),
                
            ]
        )
    }
    
    
    
}
