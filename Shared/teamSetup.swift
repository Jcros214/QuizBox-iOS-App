//
//  teamSetup.swift
//  QuizBox
//
//  Created by Jonathan Crosby on 1/17/22.
//

import SwiftUI

struct teamSetup: View {
    @EnvironmentObject var appState: AppState

    @ObservedObject public var quiz = quizStuff(leftName: "left", leftColor: .mint, rightName: "right", rightColor: .cyan)
    var body: some View {
        VStack() {
            Spacer()
            HStack {
                Spacer()
                VStack(alignment: .center) {
                    ForEach(0...6, id: \.self) {
                        Spacer()
                        TextField("Left: Quizzer #\($0+1)", text: $quiz.left.quizzer[$0].name).padding(.leading, 50.0)
                        Spacer()
                    }
                }
                Spacer()
                VStack(alignment: .center){
                    ForEach(0...6, id: \.self) {
                        Spacer()
                        TextField("Right: Quizzer #\($0+1)", text: $quiz.right.quizzer[$0].name)
                        Spacer()
                    }
                }
                Spacer()
            } //Name Input
            Spacer()
            Button { 
                appState.UiState = 1
                appState.UiTestState = 0
                
            } label: {
                ZStack {
                    Rectangle()
                        .fill(Color("buttonColor"))
                        .cornerRadius(5)
                    Text("Continue").foregroundColor(Color("textPri"))
                }.frame(width: 200, height: 100, alignment: .center)
            } //Team Setup
            Spacer()
        }.background(Color("background"))
    }
}

struct teamSetup_Previews: PreviewProvider {
    static var previews: some View {
        teamSetup()
    }
}

//            ForEach($quiz.left.quizzer[], id: \.self) {
//                TextField("Left: Quizzer #\(quiz.left.quizzer[].number)", text: $quiz.left.quizzer[$0-1].name)
//                TextField("Right: Quizzer #\($0)", text: $quiz.right.quizzer[$0-1].name)
//            }
