//
//  ViewController.swift
//  Calculator
//
//  Created by Temirlan Dzodziev on 03.06.2020.
//  Copyright © 2020 Temirlan Dzodziev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    @IBOutlet var buttons: [UIButton]!
    private var finishTyping: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        editButtons()
    }
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        finishTyping = true
        guard let number = Double(displayLabel.text!) else{return print("Some troubles with calcNumbers")}
        
        if let calcMethod = sender.currentTitle{
            
            if calcMethod == "±"{
                displayLabel.text = String(number * -1)
            }else if calcMethod == "AC"{
                displayLabel.text = "0"
            }else if calcMethod == "%"{
                displayLabel.text = String(number / 100)
            }
        }
        
        
    }
    @IBAction func numButtonPressed(_ sender: UIButton) {
        if let num = sender.currentTitle{
            if finishTyping{
                displayLabel.text = num
                finishTyping = false
            }else{
                displayLabel.text = displayLabel.text! + num
            }
        }
        
    }
    
    
    func editButtons(){
        
        for button in buttons{
            if button.titleLabel!.text == "0" {
                button.clipsToBounds = true
                button.layer.cornerRadius = button.bounds.size.width / 3
                
                button.transform = CGAffineTransform(rotationAngle: CGFloat( -45 * Float.pi / 180))
                
                
                
            }else{
                button.clipsToBounds = true
                button.layer.cornerRadius = button.bounds.size.width / 2
                
                button.transform = CGAffineTransform(rotationAngle: CGFloat(45 * Float.pi / 180))
                
            }
        }
    }
}

