//
//  BMICalculatorViewModel.swift
//  BestZeit
//
//  Created by Mousa on 22.07.21.
//

import Foundation

class BMICalculatorViewModel {
    
    var height: Int
    var weight: Int
    
    init(height:Int, weight: Int) {
        self.height = height
        self.weight = weight
    }
    
    func calculateBMI() -> Double {
        let result = weight / (height * height)
        return Double(result)
    }
    
}
