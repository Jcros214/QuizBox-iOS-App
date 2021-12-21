//
//  ContentView.swift
//  Shared
//
//  Created by Jonathan Crosby on 12/4/21.
/*
 
 ToDo:
 Build UI
 Determine points from question result
 
 */
//

import SwiftUI

/*
 
 Situations:
 +20
 -10
 
 Counted Correct: +20
 Check if Team has points from 5 sperate quizzers
 Check if correctly answered now = 5: QUIz
 Check if errors = 0: +10
 
 
 Counted Incorrect:
 Check if in error zone or team has >3 errors: -10
 Check if quizzer now has 4 errors
 
 
 Bounes:
 Team bonus
 Quizout w/o errors
 
 */

class quizStuff: ObservableObject {
    struct side {
        var buttonColor = Color.gray
        var color: Color
        var isSelected = true
        var score = 0
        struct quizer {
            var correct = [
                1: 0,
                2: 0,
                3: 0,
                4: 0,
                5: 0,
                6: 0,
                7: 0,
                8: 0,
                9: 0,
                10: 0,
                11: 0,
                12: 0,
                13: 0,
                14: 0,
                15: 0,
                16: 0,
                17: 0,
                18: 0,
                19: 0,
                20: 0,
                21: 0,
                22: 0,
                23: 0,
                24: 0,
                25: 0,
                26: 0
            ]
            var incorrect = [
                1: 0,
                2: 0,
                3: 0,
                4: 0,
                5: 0,
                6: 0,
                7: 0,
                8: 0,
                9: 0,
                10: 0,
                11: 0,
                12: 0,
                13: 0,
                14: 0,
                15: 0,
                16: 0,
                17: 0,
                18: 0,
                19: 0,
                20: 0,
                21: 0,
                22: 0,
                23: 0,
                24: 0,
                25: 0,
                26: 0
                
            ]
            var isStanding = false
        }
        var quizzer = quizer()
        
    }
    @Published public var left = side(color: Color.orange)
    @Published public var right = side(color: Color.blue)
    var questionNum = 1
    var boxStates = [
        1: "Standby",
        2: "Waiting",
        3: "Ready"]
    var boxColors = [
        1: Color.green,
        2: Color.gray,
        3: Color.orange]
    var boxState = 1
    var quizerPicker: Int = 1
    func jump(side: String) {
        switch side {
        case "left":
            left.isSelected = true
            right.isSelected = false
            left.buttonColor = left.color
            right.buttonColor = Color.gray
        case "right":
            left.isSelected = false
            right.isSelected = true
            left.buttonColor =  Color.gray
            self.right.buttonColor = self.right.color
        default:
            exit(1)
        }
    }
    func disArm() {
        self.left.isSelected = false
        self.right.isSelected = false
        left.buttonColor = Color.gray
        right.buttonColor = Color.gray
        
    }
    func reset() {
        disArm()
    }
    func correct() {
        disArm()
    }
    func incorrect() {
        disArm()
    }
    func text() {}
    func foul() {}
    func timer() {}
}
struct ContentView: View {
    @ObservedObject var quiz = quizStuff()
    var body: some View {
        VStack{
            HStack {
                Button {
                    quiz.questionNum -= 1
                    quiz.disArm()
                } label: {
                    Text("Previous Question")
                        .foregroundColor(Color.white)
                        .padding()
                        .background(Color.gray)
                        .cornerRadius(50.0)
                }//Previous
                Spacer()
                Button {
                    quiz.questionNum += 1
                    quiz.disArm()
                } label: {
                    Text("Next Question")
                        .foregroundColor(Color.white)
                        .padding()
                        .background(Color.gray)
                        .cornerRadius(50.0)
                }//Next
            } //Navigation Bar ////
            Group  {
                HStack {
                    Button {
                        quiz.jump(side: "left")
                    } label: {
                        VStack{
                            Text("Left Team")
                                .foregroundColor(Color.white)
                                .padding()
                                .background(quiz.left.buttonColor)
                                .cornerRadius(50.0)
                            Text(String(quiz.left.score))
                        }
                    }
                    Spacer()
                    Button {
                        quiz.jump(side: "right")
                    } label: {
                        VStack{
                            Text("Right Team")
                                .foregroundColor(Color.white)
                                .padding()
                                .background(quiz.right.buttonColor)
                                .cornerRadius(50.0)
                            Text(String(quiz.right.score))
                        }
                    }
                } //TEMP: Choose Team (test quiz.jump())
                Picker(selection: $quiz.quizerPicker, label: Text("Seat #")) {
                    Text("Quizer #1").tag(1)
                    Text("Quizer #2").tag(2)
                    Text("Quizer #3").tag(3)
                    Text("Quizer #4").tag(4)
                    Text("Quizer #5").tag(5)
                }
            }
            Group  {
                Text("Question #"+String(quiz.questionNum))
                Spacer()
                Text("Question from Database")
                Spacer()
                Text("A: From Database")
            } //Question/Ans (work on db)
            Spacer ()
            Button {
                quiz.reset()
            } label: {
                ZStack {
                    Circle()
                        .fill(Color.yellow)
                        .aspectRatio(1, contentMode: .fit)
                        .frame(width: 125, height: 125)
                        .border(Color("AccentColor"))
                    Text(" Reset ")
                        .padding(10.0)
                        .foregroundColor(Color.white)
                }
            }//Reset button
            HStack {
                Spacer()
                Button {
                    quiz.incorrect()
                } label: {
                    ZStack {
                        Circle()
                            .fill(Color.red)
                            .aspectRatio(0.75, contentMode: .fit)
                            .frame(width: 100, height: 100)
                            .border(Color("AccentColor"))
                            .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                        Text(" Incorrect ")
                            .padding(10.0)
                            .foregroundColor(Color.white)
                    }
                }
                Spacer()
                Button {
                    quiz.correct()
                } label: {
                    ZStack {
                        Circle()
                            .fill(Color.green)
                            .aspectRatio(0.75, contentMode: .fit)
                            .frame(width: 100, height: 100)
                            .border(Color("AccentColor"))
                        Text(" Correct ")
                            .foregroundColor(Color.white)
                            .padding(10.0)
                    }
                }
                Spacer()
            } //Correct/incorrect bar
            HStack {
                Button {} label: {
                    ZStack {
                        Circle()
                            .fill(Color.gray)
                            .aspectRatio(0.75, contentMode: .fit)
                            .frame(width: 100, height: 100)
                            .border(Color("AccentColor"))
                        
                        Text(" Text ")
                            .padding(10.0)
                            .foregroundColor(Color.white)
                        
                    }
                }
                Spacer()
                Button {} label: {
                    ZStack {
                        Circle()
                            .fill(Color.gray)
                            .aspectRatio(0.75, contentMode: .fit)
                            .frame(width: 100, height: 100)
                            .border(Color("AccentColor"))
                        
                        Text(" Foul ")
                            .foregroundColor(Color.white)
                            .padding(10.0)
                        
                    }
                }
                Spacer()
                Button {} label: {
                    ZStack {
                        Circle()
                            .fill(Color.gray)
                            .aspectRatio(0.75, contentMode: .fit)
                            .frame(width: 100, height: 100)
                            .border(Color("AccentColor"))
                        Text(" Timer ").foregroundColor(Color.white)
                            .padding(10.0)
                    }
                }
            } //Extra functions bar
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.light)
            .previewInterfaceOrientation(.portrait)
    }
}
