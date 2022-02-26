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
    var body: some View {
        VStack() {
            Spacer ()
            VStack {
                HStack {
                    Spacer()
                    Picker(selection: $appState.leftSelection, label: Text("Choose team")) {
                        ForEach(0...(teamArray.count - 1), id: \.self) { i in
                            Text(teamArray[i].name)
                        }
                    }
                    Spacer()
                    Picker(selection: $appState.rightSelection, label: Text("Choose team")) {
                        ForEach(0...(teamArray.count - 1), id: \.self) { i in
                            Text(teamArray[i].name)
                        }
                    }
                    Spacer()
                }
                ForEach(Range(0...5), id: \.self) { i in
                    HStack {
                        Spacer()
                        if (teamArray[appState.leftSelection].name != "Custom") {
                            Text(teamArray[appState.leftSelection].quizzers[i].name)
                        } else {
                            Text("Choose another team")
                        }
                        Spacer()
                        if (teamArray[appState.rightSelection].name != "Custom") {
                            Text(teamArray[appState.rightSelection].quizzers[i].name)
                        } else {
                            Text("Choose another team")
                        }
                        Spacer()
                    }
                }
                Spacer ()
                Button {
                    appState.UiState = 1
                    appState.UiTestState = 0
                    
                    rightSel = appState.rightSelection
                    leftSel = appState.leftSelection
                    
                } label: {
                    ZStack {
                        Rectangle()
                            .fill(Color("buttonColor"))
                            .cornerRadius(5)
                        Text("Continue").foregroundColor(Color("textPri"))
                    }.frame(width: 200, height: 100, alignment: .center)
                }
            }
        }
    }
}
struct teamSetup_Previews: PreviewProvider {
    static var previews: some View {
        teamSetup()
    }
}
