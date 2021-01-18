//
//  View+Ext.swift
//  AlertTutorial
//
//  Created by Can Balkaya on 15.01.2021.
//

import SwiftUI

extension View {
    func alert(isPresented: Binding<Bool>, _ alert: TextAlert) -> some View {
        AlertWrapper(isPresented: isPresented, alert: alert, content: self)
    }
}
