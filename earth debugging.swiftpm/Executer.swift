//
//  Executer.swift
//  Earth Debugger
//
//  Created by 최명근 on 2023/04/18.
//

import Foundation

class Executer {
    
    static func execute(_ earth: Earth, _ blocks: [any Block], iteration: Int) -> Earth {
        
        // Copy
        var earth: Earth = earth
        
        // Loop as iteration
        for i in 0..<iteration {
            
            print("iteration \(i)")
            
            // Run blocks
            for block in blocks {
                
                // MARK: Condition Block
                if let block = block as? ConditionBlock {
                    if block.executable(earth: earth) {
                        earth = block.effect(earth: earth)
                    }
                }
                
                // MARK: Runnable Block
                else if let block = block as? RunnableBlock {
                    earth = block.effect(earth: earth)
                }
                
            }
            
            // MARK: Exit if earth is healthy
            if earth.isHealthy {
                return earth
            }
            
        }
        
        return earth
    }
    
}
