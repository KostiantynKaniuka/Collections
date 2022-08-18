//
//  DictionaryManipulator .swift
//  Collections
//
//  Created by Константин Канюка on 18.08.2022.
//

import Foundation

struct DictionaryManipulator {
    var contactArray = [String]()
    var contactDictionary = [String: String]()
    
    var resultOfFindingTheFirstContactArray = ""
    var resultOfFindingTheFirstContactDictionary = ""
    var resultOfFindingTheLastContactArray = ""
    var resultOfFindingTheLastContactDictionary = ""
    var resultOfSearchingForANonExistingElementArray = ""
    var resultOfSearchingForANonExistingElementDictionary = ""
    
    mutating func contactArrayGenerator() {
        var i = 0
        while contactArray.count < 10000000 {
            contactArray.append("Name\(i)")
            i += 1
        }
    }
    
    mutating func contactDictionaryGenetor() {
        var i = 0
        while contactDictionary.count < 10000000 {
            contactDictionary[String(i)] = "Name"
            i += 1
        }
    }
    
    mutating func findTheFirstContactArray() {
        let result = contactArray[0]
        resultOfFindingTheFirstContactArray = result
        
    }
    
    mutating func findTheFirstContactDictionary() {
        let result = "\(contactDictionary["0"]!)0"
        resultOfFindingTheFirstContactDictionary = result
    }
    
    mutating func findTheLastContactArray() {
        let result = contactArray[contactArray.count-1]
        resultOfFindingTheLastContactArray = result
    }
    
    mutating func findTheLastContactDictionary() {
        let result = "\(contactDictionary[String(contactDictionary.count-1)]!)\(contactDictionary.count-1)"
        resultOfFindingTheLastContactDictionary = result
    }
    
    mutating func searchForANonExistingElementArray() {
        var result = "0"
        for item in contactArray {
            if item == "Non existing" {
                result = "Success!"
            }
        }
        resultOfSearchingForANonExistingElementArray = result
    }
    
    mutating func searchForANonExistingElementDictionary() {
        var result = "0"
        for item in contactDictionary.keys {
            if item == "Non existing" {
                result = "Success!"
            }
        }
        resultOfSearchingForANonExistingElementDictionary = result
    }
}
