//
//  ViewController.swift
//  Identity
//
//  Created by Or Israeli on 17/05/2019.
//  Copyright © 2019 Or Israeli. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var infoText: UITextView!
    @IBOutlet weak var idInput: UITextField!
    @IBOutlet weak var resultView: UIView!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet var signImageView: UIImageView!
    @IBOutlet weak var creditsText: UITextView!
    
    let checkmarkSign = UIImage(named:"checkmark")
    let xSign = UIImage(named:"x")
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
        if Int(idString) == nil || idString.isEmpty || idString.count < 6 || idString.count > 9 {
            didStringFail = true
            printResult()
        }
            
        else {
            validateID()
            printResult()
            //dismiss keyboard
            idInput.resignFirstResponder()
        }
    }
    
    func validateID() -> Bool {
        
         var idArray = [Int]()
    
        //if string is shorter than 9, fill it with zero's to length
        var fillerCount = 9-idString.count
        while fillerCount > 0 {
            fillerCount -= 1
            idString = "0" + idString
            idInput.text = idString
        }
        
        //adds to array
        for char in idString {
            idArray.append(Int(String(char))!)
        }
        
        //validation algorithm
        var i = 0
        var total = 0
        for element in idArray {
            //mutiply every other array index in 2
            if i % 2 != 0 {
                idArray[i] = element * 2
                //convert 2 digits to 1 digit
                if idArray[i] >= 10 {
                    let remainder = idArray[i] % 10
                    idArray[i] = remainder + 1
                }
            }
            total = total + idArray[i]
            i += 1
        }
        print("result: \(idArray)")
        print("total: \(total)")
        idArray.removeAll()
    
        if total > 0 && total % 10 == 0 {
            validationResult = true
        }
        else {
            validationResult = false
        }
        return validationResult
    }
    
        func printResult(){
            if validationResult {
                print("id valid")
                resultView.backgroundColor = UIColor(red: 39/255.0, green: 200/255.0, blue: 45/255.0, alpha: 1.0)
                signImageView.image = checkmarkSign
                resultLabel.text = "The ID number is valid."
                
            }
            else {
                resultView.backgroundColor = UIColor(red: 259/255.0, green: 21/255.0, blue: 29/255.0, alpha: 1.0)
                signImageView.image = xSign
                if didStringFail {
                    print(didStringFail, "error: string is bad")
                    resultLabel.text = "ERROR"
                }
                else {
                    print("id invalid")
                    resultLabel.text = "The ID number is invalid."
                }
            }
            didStringFail = false
            validationResult = false
        }
   
    //dismiss keyboard when user touch blank spots
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    //run check button event when user press enter + dismiss keyboard
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        didPressCheck((Any).self)
        idInput.resignFirstResponder()
        return true
    }
}

