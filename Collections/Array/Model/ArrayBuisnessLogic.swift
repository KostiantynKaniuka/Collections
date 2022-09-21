//
//  ArrayManipulator.swift
//  Collections
//
//  Created by Kostiantyn Kaniuka on 15.08.2022.
//

import Foundation

final class ArrayBuisnessLogic {
    private var originArray = [Int]()
    
    //MARK: - Default values
    private let oneThousandElements = (0..<1000).map{ _ in Int.random(in: 1 ... 100) }
    private var resultOfInsertionAtTheBeginningOneByOne = 0
    private var resultOfInsertionAtTheBeginningAtOnce = 0
    private var resultOfInsertionInTheMiddleOneByOne = 0
    private var resultOfInsertionInTheMiddleAtOnce = 0
    private var resultOfAppearanceInTheEndOneByOne = 0
    private var resultOfAppearanceInTheEndAtOnce = 0
    private var resultOfRemovingAtTheBeginningOneByOne = 0
    private var resultOfRemovingAtTheBeginningAtOnce = 0
    private var resultOfRemovingInTheMiddleOneByOne = 0
    private var resultOfRemovingInTheMiddleAtOnce = 0
    private var resultOfRemovingAtTheEndOneByOne = 0
    private var resultOfRemovingAtTheEndAtOnce = 0
    
    //MARK: - Manipulations with array
    func arrayCreating() {
        originArray = (0..<10000000).map{ _ in Int.random(in: 1 ... 100) }
    }
    
    func insertAtTheBeginningOneByOne() {
        var newArray = originArray
        for i in oneThousandElements {
            newArray.insert(oneThousandElements[i], at: 0)
        }
        resultOfInsertionAtTheBeginningOneByOne = newArray.count
    }
    
    func insertAtTheBeginningAtOnce() {
        var newArray = originArray
        newArray.insert(contentsOf: oneThousandElements, at: 0)
        resultOfInsertionAtTheBeginningAtOnce = newArray.count
    }
    
    func insertInTheMiddleOneByOne() {
        var newArray = originArray
        for i in oneThousandElements {
            newArray.insert(oneThousandElements[i], at: ((newArray.count)/2)-1)
        }
        resultOfInsertionInTheMiddleOneByOne = newArray.count
    }
    
    func insertInTheMiddleAtOnce() {
        var newArray = originArray
        newArray.insert(contentsOf: oneThousandElements, at: ((newArray.count)/2)-1)
        resultOfInsertionInTheMiddleAtOnce = newArray.count
    }
    
    func appendToTheEndOneByOne() {
        var newArray = originArray
        for i in oneThousandElements {
            newArray.append(oneThousandElements[i])
        }
        resultOfAppearanceInTheEndOneByOne = newArray.count
    }
    
    func appendToTheEndAtOnce() {
        var newArray = originArray
        newArray.append(contentsOf: oneThousandElements)
        resultOfAppearanceInTheEndAtOnce = newArray.count
    }
    
    func removeAtTheBeginningOneByOne() {
        var newArray = originArray
        while newArray.count > 9999000 {
            newArray.removeLast()
        }
        resultOfRemovingAtTheBeginningOneByOne = newArray.count
    }
    
    func removeAtTheBeginningAtOnce() {
        var newArray = originArray
        newArray.removeLast(1000)
        resultOfRemovingAtTheBeginningAtOnce = newArray.count
    }
    
    func removeInTheMiddleOneByOne() {
        var newArray = originArray
        while newArray.count > 9999000 {
            newArray.remove(at: ((newArray.count)/2)-1)
        }
        resultOfRemovingInTheMiddleOneByOne = newArray.count
    }
    
    func removeInTheMiddleAtOnce() {
        var newArray = originArray
        newArray.removeSubrange(((newArray.count)/2)-500...((newArray.count)/2)+499)
        resultOfRemovingInTheMiddleAtOnce = newArray.count
    }
    
    func removeAtTheEndOneByOne() {
        var newArray = originArray
        while newArray.count > 9999000 {
            newArray.removeLast()
        }
        resultOfRemovingAtTheEndOneByOne = newArray.count
    }
    
    func removeAtTheEndAtOnce() {
        var newArray = originArray
        newArray.removeLast(1000)
        resultOfRemovingAtTheEndAtOnce = newArray.count
    }
}
