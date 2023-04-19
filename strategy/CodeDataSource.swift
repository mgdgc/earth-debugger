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
            energy, food, recycle, transport
        ]
    }
    
    // MARK: - Energy
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
                    pollution: PollutionAffect(water: 0, air: 30, soil: 0, ocean: 0, forest: 0),
                    sustainable: SustainableAffect(motivated: 0, energy: 20),
                    description: "Thermal power plants generate most of the planet's electricity, but they also heavily pollute the atmosphere in the process.",
                    color: Color.orange
                ),
                // MARK: reduceThermalPowerPlant()
                Action(
                    code: "reduceThermalPowerPlant()",
                    dependency: [.energy],
                    pollution: PollutionAffect(water: -20, air: -30, soil: -20, ocean: -20, forest: -20),
                    sustainable: SustainableAffect(motivated: 0, energy: -10),
                    description: "Preventing air pollution by reducing thermal power plants might be a good thing-if the alternative energy is ready.",
                    color: Color.orange
                ),
                // MARK: increaseWindPowerPlant()
                Action(
                    code: "increaseWindPowerPlant()",
                    dependency: [.motivated],
                    pollution: PollutionAffect(water: -20, air: -20, soil: -20, ocean: -20, forest: -20),
                    sustainable: SustainableAffect(motivated: -5, energy: 10),
                    description: "Wind farms are highly dependent on the weather, but they produce electricity with low environmental impact.",
                    color: Color.orange
                ),
                // MARK: increaseNuclearPowerPlant()
                Action(
                    code: "increaseHydroelectricPowerPlant()",
                    dependency: [.motivated],
                    pollution: PollutionAffect(water: -20, air: -20, soil: -20, ocean: -20, forest: -20),
                    sustainable: SustainableAffect(motivated: -10, energy: 30),
                    description: "Hydropower plants are a good alternative for generating electricity with less environmental impact, but they are very expensive to build.",
                    color: Color.orange
                ),
                // MARK: increaseNuclearPowerPlant()
                Action(
                    code: "increaseNuclearPowerPlant()",
                    dependency: [.motivated],
                    pollution: PollutionAffect(water: -20, air: -20, soil: -20, ocean: -20, forest: -20),
                    sustainable: SustainableAffect(motivated: -20, energy: 30),
                    description: "Nuclear power plants can produce a lot of electricity with little pollution if they are managed well.",
                    color: Color.orange
                ),
            ]
        )
    }
    
    // MARK: - Food
    static var food: ActionGroup {
        ActionGroup(
            groupName: "Food",
            iconName: "food",
            color: Color.brown,
            actions: [
                // MARK: reduceBeef()
                Action(
                    code: "reduceBeef()",
                    dependency: [.motivated],
                    pollution: PollutionAffect(water: 0, air: -30, soil: -20, ocean: 0, forest: -20),
                    sustainable: SustainableAffect(motivated: -20, energy: 0),
                    description: "Reduce beef consumption. Beef produces greenhouse gases two times more than a pork, four times more than a chicken.",
                    color: Color.brown
                ),
                // MARK: increaseBeef()
                Action(
                    code: "increaseBeef()",
                    dependency: [],
                    pollution: PollutionAffect(water: 0, air: 35, soil: 10, ocean: 0, forest: 20),
                    sustainable: SustainableAffect(motivated: 20, energy: 0),
                    description: "Increase beef consumption. Beef gives people joy.",
                    color: Color.brown
                ),
                // MARK: increasePotato()
                Action(
                    code: "increasePotato()",
                    dependency: [],
                    pollution: PollutionAffect(water: -30, air: -20, soil: -15, ocean: 0, forest: 0),
                    sustainable: SustainableAffect(motivated: 0, energy: 0),
                    description: "Potatoes can be grown using less water than other plants, and they don't require nitrogen fertilizers because they thrive in barren soil. They're even delicious.",
                    color: Color.brown
                ),
                
            ]
        )
    }
    
    // MARK: - Recycle
    static var recycle: ActionGroup {
        ActionGroup(
            groupName: "Recycle",
            iconName: "recycle",
            color: Color.green,
            actions: [
                // MARK: reducePlasticStraw()
                Action(
                    code: "reducePlasticStraw()",
                    dependency: [.motivated],
                    pollution: PollutionAffect(water: 0, air: 0, soil: -20, ocean: -30, forest: 0),
                    sustainable: SustainableAffect(motivated: -10, energy: 0),
                    description: "Plastic straws are loved by many people, but they are the worst enemy of marine life. It also takes a long time to decomposition.",
                    color: Color.green
                ),
                // MARK: increasePlasticStraw()
                Action(
                    code: "increasePlasticStraw()",
                    dependency: [],
                    pollution: PollutionAffect(water: 0, air: 0, soil: 20, ocean: 25, forest: 0),
                    sustainable: SustainableAffect(motivated: 10, energy: 0),
                    description: "There's nothing like a plastic straw for drinking iced drinks!",
                    color: Color.green
                ),
                // MARK: increasePaperStraw()
                Action(
                    code: "increasePaperStraw()",
                    dependency: [.motivated],
                    pollution: PollutionAffect(water: 0, air: 0, soil: -20, ocean: -25, forest: 15),
                    sustainable: SustainableAffect(motivated: -5, energy: 0),
                    description: "If you need a straw, paper straws are a good alternative - just remember that using too many can lead to deforestation.",
                    color: Color.green
                ),
                // MARK: banPlasticBags()
                Action(
                    code: "banPlasticBags()",
                    dependency: [.motivated],
                    pollution: PollutionAffect(water: 0, air: 0, soil: -20, ocean: -30, forest: 0),
                    sustainable: SustainableAffect(motivated: -10, energy: 0),
                    description: "Prevent stores from using plastic bags. It may be annoying to have to carry your own bag, but it can help prevent soil pollution and protect marine life.",
                    color: Color.green
                )
            ]
        )
    }
    
    // MARK: - Transport
    static var transport: ActionGroup {
        ActionGroup(
            groupName: "Transport",
            iconName: "transport",
            color: Color.blue,
            actions: [
                // MARK: banFuelVehicles()
                Action(
                    code: "banFuelVehicles()",
                    dependency: [.motivated],
                    pollution: PollutionAffect(water: 0, air: -20, soil: 0, ocean: 0, forest: 0),
                    sustainable: SustainableAffect(motivated: -20, energy: 0),
                    description: "Phase out internal combustion vehicles on the road. People will either buy a slightly more expensive electric car or take public transport.",
                    color: Color.blue
                ),
                // MARK: increaseElectricVehicles()
                Action(
                    code: "increaseElectricVehicles()",
                    dependency: [.energy],
                    pollution: PollutionAffect(water: 0, air: -10, soil: 0, ocean: 0, forest: 0),
                    sustainable: SustainableAffect(motivated: 10, energy: -50),
                    description: "Electric vehicles are a good alternative to internal combustion engine vehicles.",
                    color: Color.blue
                ),
            ]
        )
    }
    
}
