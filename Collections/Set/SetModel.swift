//
//  SetModel.swift
//  Collections
//
//  Created by Kostiantyn Kaniuka on 17.08.2022.
//

import Foundation

final class SetModel {
    var firsTextFieldText = Set<Character>()
    var secondTextFieldText = Set<Character>()
    var matchingLettersResult = ""
    var notMatchingLettersResult = ""
    var uniqueLettersResult = ""
    
    func matchingLetters() {
        matchingLettersResult = String(firsTextFieldText.intersection(secondTextFieldText))
    }
    
    func notMatchingLetters() {
        notMatchingLettersResult = String(firsTextFieldText.symmetricDifference(secondTextFieldText))
    }
    
    func uniqueLetters() {
        uniqueLettersResult = String(firsTextFieldText.subtracting(secondTextFieldText))
    }
}
