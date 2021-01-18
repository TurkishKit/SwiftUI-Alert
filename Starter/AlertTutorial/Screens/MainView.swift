//
//  MainView.swift
//  AlertTutorial
//
//  Created by Ufuk Kosker on 11.01.2021.
//

import SwiftUI

struct MainView: View {
    
    // MARK: - Properties
    @State var questions: [Question] = []
    @State var isPresented = false
    
    // MARK: - UI Elements
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    ForEach(questions) { question in
                        NavigationLink(
                            destination: QuestionView(question: question),
                            label: {
                                GroupBox {
                                    HStack {
                                        Text("\(question.text)")
                                        Spacer()
                                    }
                                }
                                .foregroundColor(.black)
                                .padding(EdgeInsets(top: 12, leading: 12, bottom: 0, trailing: 12))
                            }
                        )
                    }
                }
            }
            .navigationBarTitle("Sorular")
            .navigationBarItems(
                trailing:
                    Button(action: {
                        
                    }) {
                        Image(systemName: "plus.circle")
                    }
            )
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
