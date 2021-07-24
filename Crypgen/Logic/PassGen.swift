//
//  PassGen.swift
//  Crypgen
//
//  Created by Nivas Muthu M G on 2021-07-24.
//

func passwordGen(count: Int8, includeSpecialCharacters: Bool, includeNumbers: Bool, includeSpaces: Bool) -> String {
    let letter = "abcdefghijklmnopqrstuvwxyz" + "abcdefghijklmnopqrstuvwxyz".uppercased()
    let numbers = "1234567890"
    let specialCharacters = "!@#$%^&*()_-[]."
    
    var passwordSeed = letter
    if includeSpecialCharacters {
        passwordSeed += specialCharacters
    }
    if includeNumbers {
        passwordSeed += numbers
    }
    if includeSpaces {
        passwordSeed += " "
    }
    
    passwordSeed = String(passwordSeed.shuffled())
    
    return String((0..<count).map { _ in
        passwordSeed.randomElement()!
    })
}


