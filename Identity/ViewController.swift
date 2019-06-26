//
//  ViewController.swift
//  Identity
//
//  Created by Or Israeli on 17/05/2019.
//  Copyright © 2019 Or Israeli. All rights reserved.
//

//dummy id number for testing: 789621349

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var infoText: UITextView!
    @IBOutlet weak var idInput: UITextField!
    @IBOutlet weak var resultView: UIView!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet var signImageView: UIImageView!
    @IBOutlet weak var creditsText: UITextView!
    
    var idString = ""
    var validationResult = false
    var didStringFail = false

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        resultView.layer.cornerRadius = 5.0
        resultLabel.textColor = UIColor.white
        infoText.linkTextAttributes = [.foregroundColor: UIColor.lightGray]
        creditsText.linkTextAttributes = [.foregroundColor: UIColor.lightGray]
    }
    
    
    //button event
    @IBAction func didPressCheck(_ sender: Any) {
        
        //read text input
        idString = idInput.text!
        
        //check if string is bad
        if Int(idString) == nil || idString.isEmpty || idString.count < 5 || idString.count > 9 {
            didStringFail = true
            printResult()
        }
        else {
            validateID()
            printResult()
        }
        
        //dismiss keyboard
        idInput.resignFirstResponder()
    }
    
    func validateID(){
    
        //fill string with 0 if shorter than 9 chars
        var fillerCount = 9-idString.count
        while fillerCount > 0 {
            fillerCount -= 1
            idString = "0" + idString
        }
        idInput.text = idString
        
        //adds to array
        var idArray = [Int]()
        for char in idString {
            idArray.append(Int(String(char))!)
        }
        print("array before calc:\(idArray)")
        
        //validation algorithm
        var total = 0
        for (index, value) in idArray.enumerated() {
            //mutiply every other(odd) array index in 2
            if index % 2 != 0 {
                idArray[index] = value * 2
                //if larger than 10, sum the numbers
                if idArray[index] >= 10 {
                    let remainder = idArray[index] % 10
                    idArray[index] = remainder + 1
                }
            }
            total = total + idArray[index]
        }
        
        print("array after calc:\(idArray),total:\(total)")
        idArray.removeAll()
    
        if total > 0 && total % 10 == 0 {
            validationResult = true
        }
        else {
            validationResult = false
        }
    }
    
        func printResult(){
            if validationResult {
                print("id valid")
                resultView.backgroundColor = #colorLiteral(red: 0.07961467654, green: 0.7918785214, blue: 0.1005088463, alpha: 1)
                signImageView.image = #imageLiteral(resourceName: "checkmark")
                resultLabel.text = "ID number is valid."
                
            }
            else {
                resultView.backgroundColor = #colorLiteral(red: 0.9876261353, green: 0.04807233065, blue: 0.01810991764, alpha: 1)
                signImageView.image = #imageLiteral(resourceName: "x")
                if didStringFail {
                    print("error: string is bad")
                    resultLabel.text = "Please use the correct format."
                }
                else {
                    print("id invalid")
                    resultLabel.text = "ID number is invalid."
                }
            }
            didStringFail = false
            validationResult = false
        }
   
    //dismiss keyboard when user touch blank spots
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
}

