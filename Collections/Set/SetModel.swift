//
//  SetModel.swift
//  Collections
//
//  Created by Константин Канюка on 17.08.2022.
//

import Foundation

struct SetModel {
    var firsTextFieldText = Set<Character>()
    var secondTextFieldText = Set<Character>()
    var matchingLettersResult = ""
    var notMatchingLettersResult = ""
    var uniqueLettersResult = ""
    
    mutating func matchingLetters() {
        matchingLettersResult = String(firsTextFieldText.intersection(secondTextFieldText))
    }
    
    mutating func notMatchingLetters() {
        notMatchingLettersResult = String(firsTextFieldText.symmetricDifference(secondTextFieldText))
    }
    
    mutating func uniqueLetters() {
        uniqueLettersResult = String(firsTextFieldText.subtracting(secondTextFieldText))
    }
}
