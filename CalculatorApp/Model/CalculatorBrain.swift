//
//  CalculatorBrain.swift
//  CalculatorApp
//
//  Created by Usha Sai Chintha on 14/09/22.
//

import Foundation

struct CalculatorBrain{
    
    private var number: Double?
    
    private var intermediateCalculation: (symbol: String, value: Double)? // making entire tuple optional
    
    mutating func setNumber(_ number: Double){
        self.number = number
    }
    
    mutating func calculation(symbol: String) -> Double? {
        if let n=number{
            switch symbol{
            case "+/-":
                return n * -1
            case "AC":
                return 0
            case "%":
                return n * 0.01
            case "=":
                return performTwoNumberCalculation(secondNumber: n)
            default:
                intermediateCalculation = (symbol: symbol, value: n)
            }
        }
        return nil
    }
    
    private func performTwoNumberCalculation(secondNumber: Double) -> Double?{
        if let firstNumber = intermediateCalculation?.value,
            let operation = intermediateCalculation?.symbol {
            switch operation{
            case "+":
                return firstNumber+secondNumber
            case "-":
                return firstNumber-secondNumber
            case "*":
                return firstNumber*secondNumber
            case "/":
                return firstNumber/secondNumber
            default:
                fatalError("The operation passed in does not match any of the cases.")
            }
        }
        return nil
    }

}
