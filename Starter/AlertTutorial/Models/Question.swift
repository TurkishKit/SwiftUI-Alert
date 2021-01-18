//
//  Question.swift
//  AlertTutorial
//
//  Created by Can Balkaya on 15.01.2021.
//

import Foundation

struct Question: Identifiable {
    
    enum Operations: String {
        case carpi = "×"
        case arti = "+"
        case eksi = "-"
        case bolu = "/"
    }
    
    // MARK: - Properties
    var id = UUID()
    let firstNumber: Int
    let secondNumber: Int
    let _operator: Operations
    var text: String {
        "\(firstNumber) \(_operator) \(secondNumber) kaçtır?"
    }
    var result: Int {
        switch _operator {
        case .bolu:
            return firstNumber / secondNumber
        case .eksi:
            return firstNumber - secondNumber
        case .carpi:
            return firstNumber * secondNumber
        case .arti:
            return firstNumber + secondNumber
        }
    }
}
