//
//  File.swift
//  
//
//  Created by 최명근 on 2023/04/19.
//

import Foundation


struct CodeResult: Identifiable {
    var id: UUID = UUID()
    var code: Action
    var result: RunResult = .success
    var message: String?
}

enum RunResult: String {
    case success
    case failed
}
