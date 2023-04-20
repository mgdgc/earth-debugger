//
//  File.swift
//  
//
//  Created by 최명근 on 2023/04/18.
//

import Foundation

protocol Strategy {
    var dependency: [SustainableFactor]? { get set }
    var pollution: [PollutionFactor : Float] { get set }
    var sustainable: [SustainableFactor : Float] { get set }
}
