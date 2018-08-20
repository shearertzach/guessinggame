//
//  main.swift
//  Guessing Game
//
//  Created by Zach Shearer on 8/16/18.
//  Copyright © 2018 Zach Shearer. All rights reserved.
//

import Foundation

var randomNumber = Int(arc4random_uniform(99)) + 1
var guessedNumber: Int? = nil
var numberOfGuesses = 5

print("Guess a number 1-100. You have 5 chances to get it correct or you lose.")
repeat {
    guessedNumber = nil
    
    repeat {
        
        let number = readLine()!
        
        if let number = Int(number) {
            guessedNumber = number
        } else {
            print("Enter a number please")
        }
    } while guessedNumber == nil
    
    guard let guessedNumber = guessedNumber else {
        fatalError()
    }
    
    if guessedNumber == randomNumber {
        numberOfGuesses -= 1
        print("You are correct. Congradulations")
        print("Do you want to try again? Y/N")
        let answer = readLine()!
        if answer == "Y" || answer == "y" {
            print("Guess a number 1-100.")
            randomNumber = Int(arc4random_uniform(99)) + 1
             numberOfGuesses = 5
        } else if answer == "N" || answer == "n" {
            print("Okay, fair enough.")
        }
    } else if guessedNumber > randomNumber {
        numberOfGuesses -= 1
        print("You guessed too high, You have \(numberOfGuesses) guesses")
    } else if guessedNumber < randomNumber {
        numberOfGuesses -= 1
        print("You guessed too low, You have \(numberOfGuesses) guesses")
        
    }
    
    if numberOfGuesses == 0 {
        print("You lose")
        print("Do you want to try again? Y/N")
        let answer = readLine()!
        if answer == "Y" || answer == "y" {
            numberOfGuesses = 5
            randomNumber = Int(arc4random_uniform(99)) + 1
            print("Guess a number 1-100.")
        } else if answer == "N" || answer == "n" {
            print("Okay, fair enough.")
        }
    }
    
}
    while numberOfGuesses > 0

