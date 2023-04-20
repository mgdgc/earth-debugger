//
//  File.swift
//  
//
//  Created by 최명근 on 2023/04/17.
//

import Foundation

protocol Block: Identifiable {
    var id: UUID { get }
}

struct RunnableBlock: Block, Executable {
    var id: UUID = UUID()
    var strategy: any Strategy
    
    func effect(earth: Earth) -> Earth {
        var earth: Earth = earth
        
        // Check if Earth has enough sustainability or not if strategy has dependency
        if let dependency = strategy.dependency {
            if (dependency.contains(.energy) && earth.energy.amount > 0) && (dependency.contains(.motivated) && earth.motivated.amount > 0) {
                // Effective
                earth = effective(earth: earth)
            }
        } else {
            // Effective
            earth = effective(earth: earth)
        }
        return earth
    }
    
    private func effective(earth: Earth) -> Earth {
        var earth = earth
        earth.effect(pollution: strategy.pollution, sustainable: strategy.sustainable)
        return earth
    }
}

struct ConditionBlock: Block, Executable {
    
    var id: UUID = UUID()
    
    var runnableBlock: [any Block]
    var comparator: Comparator
    var compareValue: Float
    
    func executable(earth: Earth) -> Bool {
        // TODO: Executable
        return false
    }
    
    func effect(earth: Earth) -> Earth {
        return Executer.execute(earth, runnableBlock, iteration: 1)
    }
    
}

enum Comparator {
    case equal
    case biggerThan
    case lessThan
    case biggerOrEqualTo
    case lessOrEqualTo
}
