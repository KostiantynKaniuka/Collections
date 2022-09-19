//
//  ArrayManipulator.swift
//  Collections
//
//  Created by Kostiantyn Kaniuka on 15.08.2022.
//

import Foundation

struct ArrayManipulator {
    
    var originArray = [Int]()
    
    //MARK: - Default values
    let oneThousandElements = (0..<1000).map{ _ in Int.random(in: 1 ... 100) }
    var resultOfInsertionAtTheBeginningOneByOne = 0
    var resultOfInsertionAtTheBeginningAtOnce = 0
    var resultOfInsertionInTheMiddleOneByOne = 0
    var resultOfInsertionInTheMiddleAtOnce = 0
    var resultOfAppearanceInTheEndOneByOne = 0
    var resultOfAppearanceInTheEndAtOnce = 0
    var resultOfRemovingAtTheBeginningOneByOne = 0
    var resultOfRemovingAtTheBeginningAtOnce = 0
    var resultOfRemovingInTheMiddleOneByOne = 0
    var resultOfRemovingInTheMiddleAtOnce = 0
    var resultOfRemovingAtTheEndOneByOne = 0
    var resultOfRemovingAtTheEndAtOnce = 0
    
    //MARK: - Manipulations with array
    mutating func arrayCreating() {
        originArray = (0..<10000000).map{ _ in Int.random(in: 1 ... 100) }
    }
    
    mutating func insertAtTheBeginningOneByOne() {
        var newArray = originArray
        for i in oneThousandElements {
            newArray.insert(oneThousandElements[i], at: 0)
        }
        resultOfInsertionAtTheBeginningOneByOne = newArray.count
    }
    
    mutating func insertAtTheBeginningAtOnce() {
        var newArray = originArray
        newArray.insert(contentsOf: oneThousandElements, at: 0)
        resultOfInsertionAtTheBeginningAtOnce = newArray.count
    }
    
    mutating func insertInTheMiddleOneByOne() {
        var newArray = originArray
        for i in oneThousandElements {
            newArray.insert(oneThousandElements[i], at: ((newArray.count)/2)-1)
        }
        resultOfInsertionInTheMiddleOneByOne = newArray.count
    }
    
    mutating func insertInTheMiddleAtOnce() {
        var newArray = originArray
        newArray.insert(contentsOf: oneThousandElements, at: ((newArray.count)/2)-1)
        resultOfInsertionInTheMiddleAtOnce = newArray.count
    }
    
    mutating func appendToTheEndOneByOne() {
        var newArray = originArray
        for i in oneThousandElements {
            newArray.append(oneThousandElements[i])
        }
        resultOfAppearanceInTheEndOneByOne = newArray.count
    }
    
    mutating func appendToTheEndAtOnce() {
        var newArray = originArray
        newArray.append(contentsOf: oneThousandElements)
        resultOfAppearanceInTheEndAtOnce = newArray.count
    }
    
    mutating func removeAtTheBeginningOneByOne() {
        var newArray = originArray
        while newArray.count > 9999000 {
            newArray.removeLast()
        }
        resultOfRemovingAtTheBeginningOneByOne = newArray.count
    }
    
    mutating func removeAtTheBeginningAtOnce() {
        var newArray = originArray
        newArray.removeLast(1000)
        resultOfRemovingAtTheBeginningAtOnce = newArray.count
    }
    
    mutating func removeInTheMiddleOneByOne() {
        var newArray = originArray
        while newArray.count > 9999000 {
            newArray.remove(at: ((newArray.count)/2)-1)
        }
        resultOfRemovingInTheMiddleOneByOne = newArray.count
    }
    
    mutating func removeInTheMiddleAtOnce() {
        var newArray = originArray
        newArray.removeSubrange(((newArray.count)/2)-500...((newArray.count)/2)+499)
        resultOfRemovingInTheMiddleAtOnce = newArray.count
    }
    
    mutating func removeAtTheEndOneByOne() {
        var newArray = originArray
        while newArray.count > 9999000 {
            newArray.removeLast()
        }
        resultOfRemovingAtTheEndOneByOne = newArray.count
    }
    
    mutating func removeAtTheEndAtOnce() {
        var newArray = originArray
        newArray.removeLast(1000)
        resultOfRemovingAtTheEndAtOnce = newArray.count
    }
}
