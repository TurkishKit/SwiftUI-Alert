//
//  TextAlert.swift
//  AlertTutorial
//
//  Created by Can Balkaya on 15.01.2021.
//

import Foundation

struct TextAlert {
    
    // MARK: - Properties
    var title: String
    var firstPlaceholder = "İlk Sayı"
    var secondPlaceholder = "İkinci Sayı"
    var thirdPlaceholder = "İşlem: +, -, / veya *"
    var accept: String = "Tamam"
    var cancel: String = "Vazgeç"
    var action: ([String?]) -> ()
}
