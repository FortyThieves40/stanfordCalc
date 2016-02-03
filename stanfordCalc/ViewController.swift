//
//  ViewController.swift
//  stanfordCalc
//
//  Created by carole lang on 1/12/16.
//  Copyright © 2016 Dana Young. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    

    @IBOutlet weak var display: UILabel!
    
    var isUserInMiddleOfTypingNewNumber = false;
    
    var brain = CalcBrain()

    @IBAction func digit(sender: UIButton)
    {
        let digit = sender.currentTitle!
        //print("digit = \(digit)")
        
        if isUserInMiddleOfTypingNewNumber
        {
            display.text = display.text! + digit
            print("digit = \(digit)")        }
        else
        {
            display.text = digit;
            isUserInMiddleOfTypingNewNumber = true;
        }
        
    }
    
    
    @IBAction func operate(sender: UIButton)
    {
        if let operation = sender.currentTitle
        {
            if let result = brain.preformOperation(operation){
                displayValue = result
            }
            else {
                displayValue = 0
            }
        }
        if isUserInMiddleOfTypingNewNumber
        {
            enter()
        }
    }
    
//    func performOperation (operation: (Double, Double) -> Double)
//    {
//        if operandStack.count >= 2
//        {
//            displayValue = operation(operandStack.removeLast(), operandStack.removeLast())
//            enter()
//        }
//    }
//
//    @objc (preformOperation2:) func performOperation (operation: Double ->Double){
//        if operandStack.count >= 1{
//            displayValue = operation(operandStack.removeLast())
//            enter()
//        }
//    }

    @IBAction func enter()
    {
        isUserInMiddleOfTypingNewNumber = false;
        if let result = brain.pushOperand(displayValue){
            displayValue = result
        }
        else{
            displayValue = 0
        }
        
        //operandStack.append(displayValue)
        //print("operandStack = \(operandStack)")
        
    }
    
    var displayValue: Double
    {
        get{
            return NSNumberFormatter().numberFromString(display.text!)!.doubleValue
        }
        set{
            display.text = "\(newValue)"
            isUserInMiddleOfTypingNewNumber = false
        }
    }
    
}

