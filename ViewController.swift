//
//  ViewController.swift
//  calculator2
//
//  Created by 韩蕊泽 on 2018/10/28.
//  Copyright © 2018 韩蕊泽. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBOutlet weak var screenL: UILabel!
    
    var value1: Double = 0.0
    var value2: Double = 0.0
    var valueT: Double = 0.0
    var result: Double = 0.0
    var operatorFlag: String = ""
    var isDecimalPoint: Bool = false
    var isValue2: Bool = false
    var isOperator: Bool = false
    var isResult: Bool = false
    var error: Bool = false
    
    @IBAction func number(_ sender: UIButton) {
        if (screenL.text == "0" && isDecimalPoint == false)
        {screenL.text = ""}
        if isOperator == false{
            screenL.text = screenL.text! + sender.currentTitle!
        }
        else{if isValue2 == false {
                screenL.text = sender.currentTitle
                isDecimalPoint = false
                isValue2 = true
            }
            else {screenL.text = screenL.text! + sender.currentTitle!}
        }
    }
    
    @IBAction func point(_ sender: UIButton) {
        if !isDecimalPoint {screenL.text = screenL.text! + "."; isDecimalPoint = true}
    }
    
    @IBAction func sign(_ sender: UIButton) {
        if !isOperator
        {
            value1 = NSString(string: screenL.text!).doubleValue
            isOperator = true
            switch sender.currentTitle!{
            case "+" : operatorFlag = "+"
            case "-" : operatorFlag = "-"
            case "×" : operatorFlag = "*"
            case "÷" : operatorFlag = "/"
            default : operatorFlag = ""
            }
        }
        else {
            value2 = NSString(string: screenL.text!).doubleValue
            switch operatorFlag {
            case "+" : value1 = value1 + value2
            case "-" : value1 = value1 - value2
            case "*" : value1 = value1 * value2
            case "/" : value1 = value1 / value2
            default : break
            }
            screenL.text = "\(value1)"
            isValue2 = false
            switch sender.currentTitle!{
            case "+" : operatorFlag = "+"
            case "-" : operatorFlag = "-"
            case "×" : operatorFlag = "*"
            case "÷" : operatorFlag = "/"
            default : operatorFlag = ""
            }
        }
    }
    
    @IBAction func resultSign(_ sender: UIButton) {
        if isValue2 {
            value2 = NSString(string: screenL.text!).doubleValue
        }
        
        switch operatorFlag {
        case "+" : result = value1 + value2
        case "-" : result = value1 - value2
        case "*" : result = value1 * value2
        case "/" :if (operatorFlag == "/" && value2 == 0.0){
                      error = true
                      value1 = 0.0
                      value2 = 0.0
                      result = 0.0
                      operatorFlag = ""
                      isDecimalPoint = false
                      isValue2 = false
                      isOperator = false
                      isResult = false}
                  else{result = value1 / value2}
        default : break
        }
        isResult = true
        isValue2 = false
        if(!error){screenL.text = "\(result)"}
        else{screenL.text = "Error: Divisor must not be zero."}
    }
    
    @IBAction func persentSign(_ sender: UIButton) {
        valueT = NSString(string: screenL.text!).doubleValue
        valueT = 0.01 * valueT
        screenL.text = "\(valueT)"
    }
    
    @IBAction func allClear(_ sender: UIButton) {
        value1 = 0.0
        value2 = 0.0
        result = 0.0
        operatorFlag = ""
        isDecimalPoint = false
        isValue2 = false
        isOperator = false
        isResult = false
        screenL.text = "0"
        error = false}
}

