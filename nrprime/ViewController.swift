//
//  ViewController.swift
//  nrprime
//
//  Created by Marius Ilie on 08/03/17.
//  Copyright © 2017 Marius Ilie. All rights reserved.
//

import UIKit

class ViewController: UIViewController, NrPrimDelegate {
    var calculatorBrain = VerificarePrim()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calculatorBrain.delegate = self
    }
    
    @IBOutlet weak var statusLabel: UILabel!
    
    @IBOutlet weak var textField: UITextField!
    
    @IBAction func onTap(_ sender: UIButton) {
        if let n = textField.text {
            calculatorBrain.value = Int(n)
        }
    }
    
    func updateUI() {
        if calculatorBrain.status != nil {
            textField.text = String(describing: calculatorBrain.value!)
        }
        else {
            textField.text = nil
        }
        
        statusLabel.text = calculatorBrain.statusMessage
    }
    
    //MARK: VerificarePrimDelegate
    
    func valueDidChange() {
        print("statusDidChange a fost apelat")
        updateUI()
    }
}

