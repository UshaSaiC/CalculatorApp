//
//  ViewController.swift
//  CalculatorApp
//
//  Created by Usha Sai Chintha on 13/09/22.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var displayLabel: UILabel!
        
    // below variable can now be used within this class
    private var isFinishedTyping: Bool = true
    
    
    private var displayValue: Double{
        get{
            guard let number = Double(displayLabel.text!) else{
                fatalError("Cannot convert display label text to Double")
            }
            return number
        }
        set{
            displayLabel.text = String(newValue)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


    @IBAction func calculationButtonPressed(_ sender: UIButton) {
    isFinishedTyping = true
        
        if let calculationMethod = sender.currentTitle{
            let calculatorBrain = CalculatorBrain(number: displayValue)
            guard let result = calculatorBrain.calculation(symbol: calculationMethod) else{
                fatalError("result of calculation is  nil")
            }
                    displayValue = result
        }
        
    }
    
    
    
    @IBAction func numberButtonPressed(_ sender: UIButton) {
        if let numberValue = sender.currentTitle{
            if isFinishedTyping{
                displayLabel.text = numberValue
            isFinishedTyping = false
            }else{
                if numberValue == "."{
                    let isInt = floor(displayValue) == displayValue
                    if !isInt{
                        return
                    }
                }
                displayLabel.text = displayLabel.text! + numberValue
            }
        }
    }
}

