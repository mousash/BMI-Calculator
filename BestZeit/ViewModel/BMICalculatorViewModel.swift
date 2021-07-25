//
//  BMICalculatorViewModel.swift
//  BestZeit
//
//  Created by Mousa on 22.07.21.
//

import Foundation

class BMICalculatorViewModel {
    
    var bmi: BMIModel = BMIModel(height: 0, weight: 0, bmi: 0)
    
    func calculateBMI() -> String {
        let height = Measurement(value: Double(bmi.height), unit: UnitLength.centimeters)
        let heightSensible = height.converted(to: UnitLength.meters)
        
        let heightMultiple = Double(heightSensible.value * heightSensible.value)
        let weight = Double(bmi.weight)
        let result = weight / heightMultiple
        
        let resultInt = Int(result)
        let resultString = String(resultInt)
        return resultString
    }
    
}
