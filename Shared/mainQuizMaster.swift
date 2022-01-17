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
    @ObservedObject var quiz = quizStuff(leftName: "left", leftColor: .mint, rightName: "right", rightColor: .cyan)
    
    @State private var myRed: Double = 1
    @State private var myGreen: Double = 2
    @State private var myBlue: Double = 3
    
    var body: some View {
        VStack {
            HStack {
                Button {
                    quiz.questionNum -= 1
                    quiz.disArm()
                } label: {
                    Text("Previous Question")
                        .foregroundColor(Color("textSec"))
                        .padding()
                        .background(Color("buttonColor"))
                        .cornerRadius(50.0)
                }//Previous
                Spacer()
                Button {
                    quiz.questionNum += 1
                    quiz.disArm()
                } label: {
                    Text("Next Question")
                        .foregroundColor(Color("textSec"))
                        .padding()
                        .background(Color("buttonColor"))
                        .cornerRadius(50.0)
                }//Next
            } //Navigation Bar
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
            Text("Question #\(quiz.questionNum)")
            Spacer()
            ZStack {
                Picker("Quizzer Picker", selection: $quiz.quizerPicker) {
                    Text("Quizer #1").tag(1)
                    Text("Quizer #2").tag(2)
                    Text("Quizer #3").tag(3)
                    Text("Quizer #4").tag(4)
                    Text("Quizer #5").tag(5)
                    Text("Quizer #6").tag(6)
                    Text("Quizer #7").tag(7)
                    
                }
            } //Quizzer Picker
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
                    Button {
                        appState.UiState = 4
                    } label: {
                        ZStack {
                            Circle()
                                .fill(Color("buttonColor"))
                                .aspectRatio(0.75, contentMode: .fit)
                                .frame(width: 100, height: 100)
                            
                            Text(" Text ")
                                .padding(10.0)
                                .foregroundColor(Color("textSec"))

                        }
                    } //Text
                    Spacer()
                    Button {
                        quiz.foul()
                    } label: {
                        ZStack {
                            Circle()
                                .fill(Color("buttonColor"))
                                .aspectRatio(0.75, contentMode: .fit)
                                .frame(width: 100, height: 100)
                            
                            Text(" Foul ")
                                .foregroundColor(Color("textSec"))
                                .padding(10.0)
                            
                        }
                    } //Print Debug
                    Spacer()
                    Button {
                        
                    } label: {
                        ZStack {
                            Circle()
                                .fill(Color("buttonColor"))
                                .aspectRatio(0.75, contentMode: .fit)
                                .frame(width: 100, height: 100)
                            Text(" Timer ")
                                .foregroundColor(Color("textSec"))
                                .padding(10.0)
                        }
                    } //Timer
                    if appState.UiTestState==1 {
                        Spacer()
                        Button {
                            appState.UiState = 0
                        } label: {
                            ZStack {
                                Circle()
                                    .fill(Color("buttonColor"))
                                    .aspectRatio(0.75, contentMode: .fit)
                                    .frame(width: 100, height: 100)
                                Text(" Exit Demo ")
                                    .foregroundColor(Color("textSec"))
                                    .padding(10.0)
                            }
                        } //Exit Demo
                    }
                } //Extra functions bar
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
