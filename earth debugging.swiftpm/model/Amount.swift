//
//  File.swift
//  
//
//  Created by 최명근 on 2023/04/18.
//

import Foundation

struct Amount: Comparable {
    
    static let zero = Amount(0)
    
    let max: Int
    var amount: Int
    
    init(max: Int = 100, amount: Int = 100) {
        self.max = max
        self.amount = amount
    }
    
    init(max: Int = 100, _ percentage: Float) {
        self.max = max
        self.amount = Int(percentage * Float(max))
    }
    
    var percentage: Float {
        Float(amount) / Float(max)
    }
    
    var reversePercentage: Float {
        1.0 - Float(amount) / Float(max)
    }
    
    var reverseAmount: Int {
        max - amount
    }
    
    mutating func calculate(_ i: Int) -> BeforeAfterValue {
        let before = self
        
        self.amount += i
        
        if self.amount > 100 {
            self.amount = 100
        } else if self.amount < 0 {
            self.amount = 0
        }
        
        let after = self
        
        return BeforeAfterValue(before: before, after: after)
    }
    
    mutating func effect(percentage: Float) {
        self.amount += Int(Float(amount) * percentage)
    }
    
    static func < (lhs: Amount, rhs: Amount) -> Bool {
        return lhs.percentage < rhs.percentage
    }
    
    
}

struct BeforeAfterValue {
    var before: Amount
    var after: Amount
    
    var hasChanged: Bool {
        before.amount != after.amount
    }
}
