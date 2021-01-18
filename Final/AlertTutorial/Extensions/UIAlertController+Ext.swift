//
//  UIAlertController+Ext.swift
//  AlertTutorial
//
//  Created by Can Balkaya on 15.01.2021.
//

import UIKit

extension UIAlertController {
    convenience init(alert: TextAlert) {
        self.init(title: alert.title, message: nil, preferredStyle: .alert)
        addTextField {
            $0.placeholder = alert.firstPlaceholder
            $0.keyboardType = .numberPad
        }
        addTextField {
            $0.placeholder = alert.secondPlaceholder
            $0.keyboardType = .numberPad
        }
        addTextField {
            $0.placeholder = alert.thirdPlaceholder
            $0.keyboardType = .numbersAndPunctuation
        }
        addAction(UIAlertAction(title: alert.cancel, style: .cancel) { _ in
            alert.action([""])
        })
    
        let firstTextField = textFields![0]
        let secondTextField = textFields![1]
        let thirdTextField = textFields![2]
        addAction(UIAlertAction(title: alert.accept, style: .default) { _ in
            alert.action(["\(firstTextField.text ?? "")", "\(secondTextField.text ?? "")", "\(thirdTextField.text ?? "")"])
        })
    }
}
