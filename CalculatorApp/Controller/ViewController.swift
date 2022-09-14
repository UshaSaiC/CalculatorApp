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

    private var calculatorBrain = CalculatorBrain()
    
    @IBAction func calculationButtonPressed(_ sender: UIButton) {
    isFinishedTyping = true
        calculatorBrain.setNumber(displayValue)
        if let calculationMethod = sender.currentTitle{
            if let result = calculatorBrain.calculation(symbol: calculationMethod) {
                    displayValue = result
            }
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

