//
//  MainModel.swift
//  MyCV
//
//  Created by Arsenkin Bogdan on 4/18/19.
//  Copyright © 2019 Arsenkin Bogdan. All rights reserved.
//

import UIKit

class MainModel {
    let numberOfButtons = 8
    let myName = "Bogdan"
    
    let alphabetArray = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
    var tempArray: [String]
    var randomCharSet = Set<String>()
    var myNameArray = [String]()
    var myNameForCheck = [String]()
    var outputString = String()
    var outputStringWithRevealedLetters = [String]()
    var lastLettersNotification = false
    
    init() {
        tempArray = alphabetArray
        arrayFromMyName()
        initialStateOf(myName)
    }
    
    func initialStateOf(_ word: String) {
        for _ in word {
            outputString += "_ "
            outputStringWithRevealedLetters += ["_"]
        }
    }
    
    // MARK: - Create name array
    private func arrayFromMyName() {
        for char in myName {
            myNameArray.append(String(char).uppercased())
            myNameForCheck.append(String(char).uppercased())
        }
    }
    
    //MARK: - Create random char set with one correct and other random
    func arrayOfOneCorrectAndRandomChars() -> [String] {
        
        randomCharSet = []
        
        var randomCharSetCounter = randomCharSet.count
        let tempArrayCount = tempArray.count
        
        let randomChrFromWord = myNameArray.randomElement()
        
        if tempArrayCount >= numberOfButtons {
            
            if let correctCharFromWord = randomChrFromWord {
                randomCharSet.insert(String(correctCharFromWord).uppercased())
                
                while randomCharSetCounter != numberOfButtons {
                    let randomChr = tempArray.randomElement()
                    
                    if let insertedChar = randomChr {
                        randomCharSet.insert(insertedChar)
                        
                    }
                    
                    randomCharSetCounter = randomCharSet.count
                }
                
            }
            
        } else {
            lastLettersNotification = true
        }
        
        // MARK: - Make array from random char set
        let randomCharSetToArray = Array(randomCharSet)
        
        return randomCharSetToArray
    }
    
    // MARK: - Letter check
    func letterCheckFor(_ letter: String) -> Bool {
        tempArray = tempArray.filter { $0 != String(letter)}
        
        if myNameArray.contains(letter) {
            myNameArray = myNameArray.filter { $0 != letter}
            insertCorrect(letter: letter, in: outputStringWithRevealedLetters)
            
            return true
        }
        
        return false
    }
    
    // Looks for indexes in myName
    func indexesOfCorrectLetter(in letter: String) -> [Int] {
        let indexesOfCorrectLetter = myNameForCheck.indexes(of: letter)
        
        return indexesOfCorrectLetter
    }
    
    func insertCorrect(letter: String, in array: [String]) {
        var tempArr = array
        let indexes = indexesOfCorrectLetter(in: letter)
        for (index, _ ) in array.enumerated() {
            if indexes.contains(index) {
                tempArr[index] = letter
            }
        }
        
        outputStringWithRevealedLetters = tempArr
        outputString = ""
        outputString = outputStringWithRevealedLetters.joined(separator: " ")
    }
    
}

//MARK: - Find duplicates indexes in array
extension Array where Element: Equatable {
    func indexes(of element: Element) -> [Int] {
        return self.enumerated().filter({ element == $0.element }).map({ $0.offset })
    }
}

