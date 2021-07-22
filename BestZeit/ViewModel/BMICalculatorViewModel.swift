//
//  BMICalculatorViewModel.swift
//  BestZeit
//
//  Created by Mousa on 22.07.21.
//

import Foundation

class BMICalculatorViewModel {
    
    var bmi: BMIModel = BMIModel(height: 0, weight: 0, bmi: 0)
    
    func calculateBMI() -> Double {
        let result = bmi.weight / (bmi.height * bmi.height)
        return Double(result)
    }
    
}
