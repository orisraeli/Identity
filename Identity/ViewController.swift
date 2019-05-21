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
    
    //int array to hold id number
    var idArray = [Int]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        resultView.layer.cornerRadius = 5.0
        resultLabel.textColor = UIColor.white
        infoText.linkTextAttributes = [.foregroundColor: UIColor.lightGray]
        creditsText.linkTextAttributes = [.foregroundColor: UIColor.lightGray]
        initParameters()
    }
    
    //clears data
    func initParameters() {
        resultLabel.text = nil
        idArray = []
    }
    
    //check button event
    @IBAction func didPressCheck(_ sender: Any) {
        initParameters()
        //read text input
        var idString = idInput.text!
        let idNumber = Int(idString)
        var fillerCount = 0
        
        func addToArray(){
            //if string conatains something other than numbers
            if idNumber == nil {
                resultLabel.text = "Please enter only numeral characters."
                print("error: string is nil")
                resultView.backgroundColor = UIColor(red: 259/255.0, green: 21/255.0, blue: 29/255.0, alpha: 1.0)
                signImageView.image = xSign
            }
            else {
                print("string is ok")
                //adds to array
                for char in idString {
                    idArray.append(Int(String(char))!)
                }
                print("    id: \(idArray)")
                //validate
                validateID()
                //dismiss keyboard
                idInput.resignFirstResponder()
            }
        }
        
        if idString.isEmpty {
            resultView.backgroundColor = UIColor(red: 259/255.0, green: 21/255.0, blue: 29/255.0, alpha: 1.0)
            signImageView.image = xSign
            resultLabel.text = "Please enter an ID number."
            print("error: no value")
        }
            //check strings length
        else if idString.count < 5 || idString.count > 9 {
            resultView.backgroundColor = UIColor(red: 259/255.0, green: 21/255.0, blue: 29/255.0, alpha: 1.0)
            signImageView.image = xSign
            resultLabel.text = "Required length 5-9 characters."
            print("error: id is not in range")
        }
            //if string is shorter than 9, fill it with zero's to length
        else {
            fillerCount = 9-idString.count
            while fillerCount > 0 {
                fillerCount -= 1
                idString = "0" + idString
            }
            addToArray()
            idInput.text = idString
        }
    }
    
    //validation algorithm
    func validateID() {
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
        
        //print result
        if total % 10 == 0 {
            resultView.backgroundColor = UIColor(red: 39/255.0, green: 200/255.0, blue: 45/255.0, alpha: 1.0)
            signImageView.image = checkmarkSign
            resultLabel.text = "The ID number is valid."
            print("id valid")
        }
        else {
            resultView.backgroundColor = UIColor(red: 259/255.0, green: 21/255.0, blue: 29/255.0, alpha: 1.0)
            signImageView.image = xSign
            resultLabel.text = "The ID number is invalid."
            print("id invalid")
        }
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

