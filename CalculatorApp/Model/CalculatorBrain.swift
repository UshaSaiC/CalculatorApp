//
//  CalculatorBrain.swift
//  CalculatorApp
//
//  Created by Usha Sai Chintha on 14/09/22.
//

import Foundation

class CalculatorBrain{
    
    var number: Double
    
    init(number: Double){
        self.number = number
    }
    
    func calculation(symbol: String) -> Double? {
            switch symbol{
            case "+/-":
                return number * -1
            case "AC":
                return 0
            case "%":
                return number * 0.01
            default:
                return nil
            }
        return nil
    }
}
