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
import SwiftUI
/*
 
 Results:
 +20
 -10
 
 Counted Correct: +20
 Find number of correct answers
 if Team has points from 5 sperate quizzers: +20
 if correctly answered now = 5:
 else Notify "[quizzer] has quizzed out!"
 
 Counted Incorrect:
 if in error zone or team has >3 errors: -10
 if quizzer now has 4 errors: Notify "[quizzer] has quizzed out."
 */
struct mainQuizMaster: View {
    @EnvironmentObject var appState: AppState
    @ObservedObject public var quiz = quizStuff(leftName: "left", leftColor: .mint, rightName: "right", rightColor: .cyan)
    @State private var myRed: Double = 1
    @State private var myGreen: Double = 2
    @State private var myBlue: Double = 3
    
    
    
    
    var body: some View {
        VStack {
            //            HStack {
            //                Button {
            //                    quiz.questionNum -= 1
            //                    quiz.disArm()
            //                } label: {
            //                    Text("Previous Question")
            //                        .foregroundColor(Color("textSec"))
            //                        .padding()
            //                        .background(Color("buttonColor"))
            //                        .cornerRadius(50.0)
            //                }//Previous
            //                Spacer()
            //                Button {
            //                    quiz.questionNum += 1
            //                    quiz.disArm()
            //                } label: {
            //                    Text("Next Question")
            //                        .foregroundColor(Color("textSec"))
            //                        .padding()
            //                        .background(Color("buttonColor"))
            //                        .cornerRadius(50.0)
            //                }//Next
            //            } //Navigation Bar
            HStack {
                Button {
                    quiz.activeSide = false
                    quiz.jump()
                } label: {
                    VStack{
                        Text("Left Team")
                            .foregroundColor(Color.white)
                            .padding()
                            .background(quiz.left.buttonColor)
                            .cornerRadius(50.0)
                        Text(String(quiz.left.score)).foregroundColor(Color.accentColor)
                    }
                } // Left jump
                Spacer()
                Button {
                    quiz.activeSide = true
                    quiz.jump()
                } label: {
                    VStack{
                        Text("Right Team")
                            .foregroundColor(Color.white)
                            .padding()
                            .background(quiz.right.buttonColor )
                            .cornerRadius(50.0)
                        Text(String(quiz.right.score)).foregroundColor(Color.accentColor)
                    }
                } // Right jump
            } //TEMP: Choose Team (test quiz.jump())
            Spacer()
            
            Group {
                Text("Question #\(quiz.questionNum):")
                Text("According to Acts 26:4, where was Paul's life at the first?")
                Spacer()
                Text("Answer: ")
                Text("among mine own nation at Jerusalem")
            }
            Spacer()
            ZStack {
                
                Picker("Quizzer Picker", selection: $quiz.quizerPicker) {
                    if (quiz.activeSide) {Text(quiz.right.quizzer[0].name).tag(0)} else {Text(quiz.left.quizzer[0].name).tag(0)}
                    if (quiz.activeSide) {Text(quiz.right.quizzer[1].name).tag(1)} else {Text(quiz.left.quizzer[1].name).tag(1)}
                    if (quiz.activeSide) {Text(quiz.right.quizzer[2].name).tag(2)} else {Text(quiz.left.quizzer[2].name).tag(2)}
                    if (quiz.activeSide) {Text(quiz.right.quizzer[3].name).tag(3)} else {Text(quiz.left.quizzer[3].name).tag(3)}
                    if (quiz.activeSide) {Text(quiz.right.quizzer[4].name).tag(4)} else {Text(quiz.left.quizzer[4].name).tag(4)}
                    if (quiz.activeSide) {Text(quiz.right.quizzer[5].name).tag(5)} else {Text(quiz.left.quizzer[5].name).tag(5)}
                    if (quiz.activeSide) {Text(quiz.right.quizzer[6].name).tag(6)} else {Text(quiz.left.quizzer[6].name).tag(6)}
                    
                }.foregroundColor(Color.white)
            }//Quizzer Picker
            Spacer()
            VStack {
                if appState.UiTestState==0 {
                    Group  {
                        Button {
                            quiz.reset()
                        } label: {
                            ZStack {
                                Circle()
                                    .fill(quiz.boxColors[ quiz.boxState ] ?? Color("Reset"))
                                    .aspectRatio(1, contentMode: .fit)
                                    .frame(width: 125, height: 125)
                                    .border(Color("background"))
                                Text(" Reset ")
                                    .padding(10.0)
                                    .foregroundColor(Color.black)
                            }
                        }
                    } //Reset button
                }
                HStack {
                    Spacer()
                    Button {
                        if quiz.left.isSelected || quiz.right.isSelected {
                            quiz.quesAns(ansType: false)
                        }
                    } label: {
                        ZStack {
                            Circle()
                                .fill(Color("Incorrect"))
                                .aspectRatio(0.75, contentMode: .fit)
                                .frame(width: 100, height: 100)
                                .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                            Text(" Incorrect ")
                                .padding(10.0)
                                .foregroundColor(Color("textIncor"))
                        }
                    } // Incorrect
                    Spacer()
                    Button {
                        if quiz.left.isSelected || quiz.right.isSelected {
                            quiz.quesAns(ansType: true)
                        }
                    } label: {
                        ZStack {
                            Circle()
                                .fill(Color("Correct"))
                                .aspectRatio(0.75, contentMode: .fit)
                                .frame(width: 100, height: 100)
                            
                            Text(" Correct ")
                                .foregroundColor(Color("textCor"))
                                .padding(10.0)
                        }
                    } // Correct
                    Spacer()
                } //Correct/incorrect bar
                HStack {
                    Button("Text") {appState.UiState = 4}.buttonStyle(secButton())
                    Button("Foul") {quiz.foul()}.buttonStyle(secButton())
                    Button("Timer"){}.buttonStyle(secButton())
                    if appState.UiTestState==1 {
                        Button ("Exit Demo") {appState.UiState = 0}.buttonStyle(secButton())
                    } //Exit Demo
                }
                //Extra functions bar
            }
        }.background(Color("background"))
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        mainQuizMaster()
            .preferredColorScheme(.light)
            .previewInterfaceOrientation(.portrait)
    }
}
