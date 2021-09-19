//
//  ViewController.swift
//  Calculator
//
//  Created by Decagon on 19/07/2021.


import UIKit
// Enum declaration to handle all cases of operands for their respective operations
enum OperationHandler: String{
    case Add = "+"
    case Subtract = "-"
    case Multiply = "*"
    case Divide = "/"
    case Null = "Null"
}
// View controller class inheriting from UIViewController
class ViewController: UIViewController {
    
// declare output label
    @IBOutlet weak var outputLabel: UILabel!
    
// declared require variables
    var outputNumber = ""
    var firstValue = ""
    var secondValue = ""
    var result = ""
    var currentOperation: OperationHandler = .Null
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        outputLabel.text = "0"
    }
    
    // Number button function
    @IBAction func numberClicked(_ sender: RoundButton) {
        if outputNumber.count <= 8 {
            outputNumber += "\(sender.tag)"
            outputLabel.text = outputNumber
        }
    }
    // function to reset the calculator
    @IBAction func allClear(_ sender: RoundButton) {
        outputNumber = ""
        firstValue = ""
        secondValue = ""
        result = ""
        currentOperation = .Null
        outputLabel.text = "0"
    }
    
    //function to avoid double decimal input
    @IBAction func dotclicked(_ sender: RoundButton) {
        if outputNumber.count <= 7 && !outputNumber.contains(".") {
            outputNumber += "."
            outputLabel.text = outputNumber
        }
    }
    
    // to connect each operand to their respective buttons
    @IBAction func equalClicked(_ sender: RoundButton) {
        operation(operation: currentOperation)
    }
    @IBAction func plusClicked(_ sender: RoundButton) {
        operation(operation: .Add)
    }
    @IBAction func minusClicked(_ sender: RoundButton) {
        operation(operation: .Subtract)
    }
    @IBAction func timesClicked(_ sender: RoundButton) {
        operation(operation: .Multiply)
    }
    @IBAction func divideClicked(_ sender: RoundButton) {
        operation(operation: .Divide)
    }
    
    // function to select the corresponding operation of the operand button clicked
    func operation(operation: OperationHandler){
        if currentOperation != .Null {
            if outputNumber != "" {
                secondValue = outputNumber
                outputNumber = ""
                
                if currentOperation == .Add {
                    result = "\(Double(firstValue)! + Double(secondValue)!)"
                } else if currentOperation == .Subtract {
                    result = "\(Double(firstValue)! - Double(secondValue)!)"
                } else if currentOperation == .Multiply {
                    result = "\(Double(firstValue)! * Double(secondValue)!)"
                } else if currentOperation == .Divide{
                    result = "\(Double(firstValue)! / Double(secondValue)!)"
                }
                firstValue = result
                if (Double(result)!.truncatingRemainder(dividingBy: 1) == 0 ){
                    result = "\(Int(Double(result)!))"
                }
                outputLabel.text = result
            }
            currentOperation =  operation
        } else {
            firstValue = outputNumber
            outputNumber = ""
            currentOperation = operation
        }
    }
}
