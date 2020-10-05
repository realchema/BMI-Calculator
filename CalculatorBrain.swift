//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by Jose M Arguinzzones on 2020-08-18.
//  Copyright © 2020 Angela Yu. All rights reserved.
//

import Foundation
import UIKit

struct CalculatorBrain {
    var height: Float
    var weight: Float
    var bmi: BMI?

    
    
//    init(height: Float, weight: Float, bmi: Float) {
//        self.height = height
//        self.weight = weight
//        self.bmi = bmi
//    }
    
    
    mutating func calculateBMI(height: Float, weight: Float ) {
        let bmiValue = weight/pow(height,2)
        
        if bmiValue < 18.5 {
            print("underweight")
            bmi = BMI(value: bmiValue, advice: "Eat More Donuts!", color: #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1))
        }
        else if  bmiValue < 24.9 {
            print("Normal")
            bmi = BMI(value: bmiValue, advice: "Fit as a fiddle!", color: #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1))
        }
        else {
            print("Overweight")
            bmi = BMI(value: bmiValue, advice: "Dont eat more Donuts", color: #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)) 
        }

        
    }
    
    func getBMIValue() -> String {
         
        return String(format: "%.1f", bmi?.value ?? 0.0)
    }
    
    func getBMIAdvice() -> String {
        return bmi?.advice ?? "No Data"
    }
    
    func getBMIColor() -> UIColor {
        return bmi?.color ?? UIColor.blue
    }
}
