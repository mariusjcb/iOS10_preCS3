//
//  ViewController.swift
//  nrprime
//
//  Created by Marius Ilie on 08/03/17.
//  Copyright © 2017 Marius Ilie. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    func checkPrimeWith(value number: Int) -> Bool {
        if number <= 1 {
            return false
        }
        
        if number <= 3 {
            return true
        }
        
        //for (i = 2; i <= n/2; i++)
        for i in 2...(number/2) {
            if number % i == 0 {
                return false
            }
        }
        
        return true
    }
    
    @IBOutlet weak var statusLabel: UILabel!
    
    @IBOutlet weak var textField: UITextField!
    
    @IBAction func onTap(_ sender: UIButton) {
        if let n = textField.text {
            if let number: Int = Int(n) {
                if checkPrimeWith(value: number){
                    statusLabel.text = "Prim"
                }
                else {
                    statusLabel.text = "Neprim"
                }
                
            }
            else {
                statusLabel.text = "Nu este numar"
            }
        }
    }
}

