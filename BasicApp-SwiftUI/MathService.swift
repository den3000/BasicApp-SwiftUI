//
//  MathService.swift
//  BasicApp-SwiftUI
//
//  Created by Denis Suprun on 31.10.2023.
//

import Foundation

class MathService {
    let increment: Int
    
    init(increment: Int) {
        self.increment = increment
    }
    
    func increase(value: Int) -> Int { return value + increment }
    func decrease(value: Int) -> Int { return value - increment }
}
