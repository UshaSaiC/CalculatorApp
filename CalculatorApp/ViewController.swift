//
//  ViewController.swift
//  CalculatorApp
//
//  Created by Usha Sai Chintha on 13/09/22.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var displayLabel: UILabel!
    var isFinishedTyping: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func calculationButtonPressed(_ sender: UIButton) {
    isFinishedTyping = true
    }
    
    
    
    @IBAction func numberButtonPressed(_ sender: UIButton) {
        if let numberValue = sender.currentTitle{
            if isFinishedTyping{
                displayLabel.text = numberValue
            isFinishedTyping = false
            }else{
                displayLabel.text = displayLabel.text! + numberValue
            }
        }
    }
}

