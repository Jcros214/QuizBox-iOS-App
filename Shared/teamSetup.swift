//
//  teamSetup.swift
//  QuizBox
//
//  Created by Jonathan Crosby on 1/17/22.
//

import SwiftUI

//class quizzer: ObservableObject {
//    @Published var _name: String
//    init(name: String) {
//        _name = name
//    }
//}
//class team {
//    let _name: String
//    var quizzers: Array<quizzer>
//    init (name: String, q1_name: String = "", q2_name: String = "", q3_name: String = "", q4_name: String = "", q5_name: String = "", q6_name: String = "", q7_name: String = "") {
//        _name = name
//        quizzers = [
//            quizzer(name: q1_name),
//            quizzer(name: q2_name),
//            quizzer(name: q3_name),
//            quizzer(name: q4_name),
//            quizzer(name: q5_name),
//            quizzer(name: q6_name),
//            quizzer(name: q7_name)
//        ]
//    }
//
//}
//enum TeamList: String, CaseIterable, Identifiable {
//    case United, Steadfast
//    var id: Self { self }
//}

struct teamSetup: View {
    @EnvironmentObject var appState: AppState
    //@ObservedObject public var quiz = quizStuff(leftName: "left", leftColor: .mint, rightName: "right", rightColor: .cyan)
    var body: some View {
        //        VStack() {
        //            Spacer()
        //            HStack{
        //                ForEach(teamDict.count) {
        //                    HStack {
        //                        Spacer()
        //                        Text("Left Team #\($0)")
        //                        Spacer()
        //                        Text("Right Team #\($0)")
        //                        Spacer()
        //                    }
        //                }
        //            }
        //            Spacer()
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
            //            } //Team Setup
            //            Spacer()
            //        }.background(Color("background"))
        }
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
