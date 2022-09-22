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
    
    func matchingLetters() -> String {
        let matchingLettersResult = String(firstTextFieldText.intersection(secondTextFieldText))
        return matchingLettersResult
    }
    
    func notMatchingLetters() -> String {
        let notMatchingLettersResult = String(firstTextFieldText.symmetricDifference(secondTextFieldText))
        return notMatchingLettersResult
    }
    
    func uniqueLetters() -> String {
        let uniqueLettersResult = String(firstTextFieldText.subtracting(secondTextFieldText))
        return uniqueLettersResult
    }
    
    func transformFirstText(topTextField: String) -> Set<Character> {
     return Set(topTextField)
    }
    
    func transformSecondText(bottomTextField: String) -> Set<Character> {
       return Set(bottomTextField)
    }
}
