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

struct scoreNoQuizBox: View {
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
                        .foregroundColor(Color("secText"))
                        .padding()
                        .background(Color("Secondary"))
                        .cornerRadius(50.0)
                }//Previous
                Spacer()
                Button {
                    quiz.questionNum += 1
                    quiz.disArm()
                } label: {
                    Text("Next Question")
                        .foregroundColor(Color("secText"))
                        .padding()
                        .background(Color("Secondary"))
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
                        Text(String(quiz.left.score)).foregroundColor(Color.black)
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
                        Text(String(quiz.right.score)).foregroundColor(Color.black)
                    }
                } // Right jump
            } //TEMP: Choose Team (test quiz.jump())
            Spacer()
            ZStack {
                Rectangle()
                    .fill(Color.black)
                    .frame(width: 200, height: 100, alignment: .center)
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
            
            VStack {
                Spacer()
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
                                .border(Color.accentColor)
                                .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                            Text(" Incorrect ")
                                .padding(10.0)
                                .foregroundColor(Color("priText"))
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
                                .border(Color.accentColor)
                            Text(" Correct ")
                                .foregroundColor(Color("priText"))
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
                                .fill(Color("Secondary"))
                                .aspectRatio(0.75, contentMode: .fit)
                                .frame(width: 100, height: 100)
                                .border(Color.accentColor)
                            
                            Text(" Text ")
                                .padding(10.0)
                                .foregroundColor(Color("secText"))
                            
                        }
                    }
                    Spacer()
                    Button {
                        quiz.printStats()
                    } label: {
                        ZStack {
                            Circle()
                                .fill(Color("Secondary"))
                                .aspectRatio(0.75, contentMode: .fit)
                                .frame(width: 100, height: 100)
                                .border(Color.accentColor)
                            
                            Text(" Print Debug ")
                                .foregroundColor(Color("secText"))
                                .padding(10.0)
                            
                        }
                    }
                    Spacer()
                    Button {} label: {
                        ZStack {
                            Circle()
                                .fill(Color("Secondary"))
                                .aspectRatio(0.75, contentMode: .fit)
                                .frame(width: 100, height: 100)
                                .border(Color.accentColor)
                            Text(" Timer ").foregroundColor(Color("secText"))
                                .padding(10.0)
                        }
                    }
                    Spacer()
                    Button {
                        appState.UiState = 0
                    } label: {
                        ZStack {
                            Circle()
                                .fill(Color("Secondary"))
                                .aspectRatio(0.75, contentMode: .fit)
                                .frame(width: 100, height: 100)
                                .border(Color.accentColor)
                            Text(" Setup ").foregroundColor(Color("secText"))
                                .padding(10.0)
                        }
                    }
                } //Extra functions bar
            }
        }.background(Color("AccentColor"))
    }
}
struct scoreNoQuizBox_Previews: PreviewProvider {
    static var previews: some View {
        scoreNoQuizBox()
            .preferredColorScheme(.light)
            .previewInterfaceOrientation(.portrait)
    }
}
