//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {
    
    
    var calculatorBrain = CalculatorBrain(height: 0.0, weight: 0.0)
    
//    var bmiResult = "0.0"
    
    @IBOutlet weak var sliderHeight: UISlider!
    
    @IBOutlet weak var sliderWeight: UISlider!
    
    @IBOutlet weak var heightLabel: UILabel!
    
    @IBOutlet weak var weightLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func sliderHeightChanged(_ sender: UISlider) {
        let currentValue = sender.value
        let currentValueTwoDecimals = String(format: "%.2f", currentValue) + "m"
        heightLabel.text = currentValueTwoDecimals
    }
    
    
    
    @IBAction func sliderWeightChanged(_ sender: UISlider) {
        let currentValue = Int(sender.value)
        weightLabel.text = String(currentValue) + "Kg"
    }
    

    @IBAction func calculatePressed(_ sender: UIButton) {
        let height = sliderHeight.value
        let weight = sliderWeight.value
        
//        let bmi = weight/pow(height,2)
//        print(bmi)
//        bmiResult = String(format: "%.2f", bmi)
        
        
        calculatorBrain.calculateBMI(height: height , weight: weight)
        self.performSegue(withIdentifier: "goToResult", sender: self)
       
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.bmiValue = calculatorBrain.getBMIValue()
            destinationVC.bmiAdvise = calculatorBrain.getBMIAdvice()
            destinationVC.bmiColor = calculatorBrain.getBMIColor()
            
        }
    }
    


}

