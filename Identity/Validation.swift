//
//  Validation.swift
//  Identity
//
//  Created by Or Israeli on 30/07/2019.
//  Copyright © 2019 Or Israeli. All rights reserved.
//

import Foundation

struct Validation {
    
    var id: String
    var idResultText: String?
    
    init(idString: String) {
        id.self = idString
    }
    
    func checkUserString() -> Bool {
        if Int(id) == nil || id.isEmpty || id.count < 5 || id.count > 9 {
            //print error
            return false
        } else {
            //fill with zero's if necessary
            return true
        }
    }
    
    func fillIdWithZeros(idString: String) -> String {
        var workingIdString = id
        var fillerCount: Int = 9 - id.count
        while fillerCount > 0 {
            fillerCount -= 1
            workingIdString.insert("0", at: workingIdString.startIndex)
        }
        return workingIdString
    }
    
    func performValidation(id: String) -> Bool {
        var idArray: [Int] = id.compactMap{Int(String($0))}
                print("array before calc:\(idArray)")
        
                //validation algorithm
                var total: Int = 0
                for (index, value) in idArray.enumerated() {
                    //mutiply every other(odd) array index in 2
                    if index % 2 != 0 {
                        idArray[index] = value * 2
                        //if larger than 10, sum the numbers
                        if idArray[index] >= 10 {
                            let remainder: Int = idArray[index] % 10
                            idArray[index] = remainder + 1
                        }
                    }
                    total = total + idArray[index]
                }
                print("array after calc:\(idArray),total:\(total)")
                idArray.removeAll()
        
                if total > 0 && total % 10 == 0 {
                    return true
                } else {
                    return false
                }
            }

    mutating func validateID() -> Bool {
        if checkUserString() {
            let idString: String = fillIdWithZeros(idString: id)
            if performValidation(id: idString) {
                idResultText = "ID number is valid."
                print("id is valid")
                return true
            } else {
                idResultText = "ID number is invalid."
                print("id is invalid")
                return false
            }
        } else {
            idResultText = "Please use the correct format."
            print("string is bad")
            return false
        }
    }
    
}
    
