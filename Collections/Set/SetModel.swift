//
//  SetModel.swift
//  Collections
//
//  Created by Kostiantyn Kaniuka on 17.08.2022.
//

import Foundation

final class SetModel {
    var firstTextFieldText = Set<Character>()
    var secondTextFieldText = Set<Character>()
    var matchingLettersResult = ""
    var notMatchingLettersResult = ""
    var uniqueLettersResult = ""
    
    func matchingLetters() {
        matchingLettersResult = String(firstTextFieldText.intersection(secondTextFieldText))
    }
    
    func notMatchingLetters() {
        notMatchingLettersResult = String(firstTextFieldText.symmetricDifference(secondTextFieldText))
    }
    
    func uniqueLetters() {
        uniqueLettersResult = String(firstTextFieldText.subtracting(secondTextFieldText))
    }
}
