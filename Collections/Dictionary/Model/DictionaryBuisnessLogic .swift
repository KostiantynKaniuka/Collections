//
//  DictionaryManipulator .swift
//  Collections
//
//  Created by Kostiantyn Kaniuka on 18.08.2022.
//

import Foundation

final class DictionaryBuisnessLogic {
    private var contactArray = [String]()
    private var contactDictionary = [String: String]()
    private var resultOfFindingTheFirstContactArray = ""
    private var resultOfFindingTheFirstContactDictionary = ""
    private var resultOfFindingTheLastContactArray = ""
    private var resultOfFindingTheLastContactDictionary = ""
    private var resultOfSearchingForANonExistingElementArray = ""
    private var resultOfSearchingForANonExistingElementDictionary = ""
    
    func contactArrayGenerator() {
        var i = 0
        while contactArray.count < 10000000 {
            contactArray.append("Name\(i)")
            i += 1
        }
    }
    
    func contactDictionaryGenetor() {
        var i = 0
        while contactDictionary.count < 10000000 {
            contactDictionary[String(i)] = "Name"
            i += 1
        }
    }
    
    func findTheFirstContactArray() {
        let result = contactArray[0]
        resultOfFindingTheFirstContactArray = result
        
    }
    
    func findTheFirstContactDictionary() {
        let result = "\(contactDictionary["0"]!)0"
        resultOfFindingTheFirstContactDictionary = result
    }
    
    func findTheLastContactArray() {
        let result = contactArray[contactArray.count-1]
        resultOfFindingTheLastContactArray = result
    }
    
    func findTheLastContactDictionary() {
        let result = "\(contactDictionary[String(contactDictionary.count-1)]!)\(contactDictionary.count-1)"
        resultOfFindingTheLastContactDictionary = result
    }
    
    func searchForANonExistingElementArray() {
        var result = "0"
        for item in contactArray {
            if item == "Non existing" {
                result = "Success!"
            }
        }
        resultOfSearchingForANonExistingElementArray = result
    }
    
    func searchForANonExistingElementDictionary() {
        var result = "0"
        for item in contactDictionary.keys {
            if item == "Non existing" {
                result = "Success!"
            }
        }
        resultOfSearchingForANonExistingElementDictionary = result
    }
}
