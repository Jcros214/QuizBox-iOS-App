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

class quizStuff: ObservableObject {
    struct side {
        var buttonColor = Color.gray
        var color: Color
        var isSelected = false
        var score = 0
        var corrT = 0
        var errT = 0
        struct quizer {
            var corr = Array(repeating: 0, count: 26)
            var err = Array(repeating: 0, count: 26)
            var isStanding = false
        }
        struct quizzzer {
            var q1 = quizer()
            var q2 = quizer()
            var q3 = quizer()
            var q4 = quizer()
            var q5 = quizer()
            var q6 = quizer()
            var q7 = quizer()
        }
        var quizzer = quizzzer()
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
    var activeSide: String = ""
    func jump(side: String) {
        switch side {
            case "left":
                self.left.isSelected = true
                self.right.isSelected = false
                self.left.buttonColor = left.color
                self.right.buttonColor = Color.gray
                self.activeSide = "left"
            case "right":
                self.left.isSelected = false
                self.right.isSelected = true
                self.left.buttonColor =  Color.gray
                self.right.buttonColor = self.right.color
                self.activeSide = "right"
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
    @discardableResult func quesAns(ansType: Bool) -> String? {
        if !self.left.isSelected && !self.right.isSelected {
            return nil
        }
        
        var corr: Int = 0
        var err: Int = 0
        var errT: Int = 0
        
        if self.left.isSelected {
            errT = self.left.errT
            switch self.quizerPicker {
                case 1:
                    corr = self.left.quizzer.q1.corr.reduce(0, +)
                    err = self.left.quizzer.q1.err.reduce(0, +)
                case 2:
                    corr = self.left.quizzer.q1.corr.reduce(0, +)
                    err = self.left.quizzer.q1.err.reduce(0, +)
                case 3:
                    corr = self.left.quizzer.q1.corr.reduce(0, +)
                    err = self.left.quizzer.q1.err.reduce(0, +)
                case 4:
                    corr = self.left.quizzer.q1.corr.reduce(0, +)
                    err = self.left.quizzer.q1.err.reduce(0, +)
                case 5:
                    corr = self.left.quizzer.q1.corr.reduce(0, +)
                    err = self.left.quizzer.q1.err.reduce(0, +)
                case 6:
                    corr = self.left.quizzer.q1.corr.reduce(0, +)
                    err = self.left.quizzer.q1.err.reduce(0, +)
                case 7:
                    corr = self.left.quizzer.q1.corr.reduce(0, +)
                    err = self.left.quizzer.q1.err.reduce(0, +)
                    
                default:
                    exit(1)
            }
        }
        else if self.right.isSelected  {
            errT = self.right.errT
            switch self.quizerPicker {
                case 1:
                    corr = self.right.quizzer.q1.corr.reduce(0, +)
                    err = self.right.quizzer.q1.err.reduce(0, +)
                case 2:
                    corr = self.right.quizzer.q1.corr.reduce(0, +)
                    err = self.right.quizzer.q1.err.reduce(0, +)
                case 3:
                    corr = self.right.quizzer.q1.corr.reduce(0, +)
                    err = self.right.quizzer.q1.err.reduce(0, +)
                case 4:
                    corr = self.right.quizzer.q1.corr.reduce(0, +)
                    err = self.right.quizzer.q1.err.reduce(0, +)
                case 5:
                    corr = self.right.quizzer.q1.corr.reduce(0, +)
                    err = self.right.quizzer.q1.err.reduce(0, +)
                case 6:
                    corr = self.right.quizzer.q1.corr.reduce(0, +)
                    err = self.right.quizzer.q1.err.reduce(0, +)
                case 7:
                    corr = self.right.quizzer.q1.corr.reduce(0, +)
                    err = self.right.quizzer.q1.err.reduce(0, +)
                    
                default:
                    exit(1)
            }
        }
        switch ansType {
            case true:
                if self.left.isSelected {
                    self.left.score += 20
                    switch self.quizerPicker {
                        case 1:
                            self.left.quizzer.q1.corr[Int(questionNum-1)] = 1
                        case 2:
                            self.left.quizzer.q2.corr[Int(questionNum-1)] = 1
                        case 3:
                            self.left.quizzer.q3.corr[Int(questionNum-1)] = 1
                        case 4:
                            self.left.quizzer.q4.corr[Int(questionNum-1)] = 1
                        case 5:
                            self.left.quizzer.q5.corr[Int(questionNum-1)] = 1
                        case 6:
                            self.left.quizzer.q6.corr[Int(questionNum-1)] = 1
                        case 7:
                            self.left.quizzer.q7.corr[Int(questionNum-1)] = 1
                            
                        default:
                            exit(1)
                    }
                }
                else {
                    self.right.score += 20
                    switch self.quizerPicker {
                        case 1:
                            self.right.quizzer.q1.corr[Int(questionNum-1)] = 1
                        case 2:
                            self.right.quizzer.q2.corr[Int(questionNum-1)] = 1
                        case 3:
                            self.right.quizzer.q3.corr[Int(questionNum-1)] = 1
                        case 4:
                            self.right.quizzer.q4.corr[Int(questionNum-1)] = 1
                        case 5:
                            self.right.quizzer.q5.corr[Int(questionNum-1)] = 1
                        case 6:
                            self.right.quizzer.q6.corr[Int(questionNum-1)] = 1
                        case 7:
                            self.right.quizzer.q7.corr[Int(questionNum-1)] = 1
                            
                        default:
                            exit(1)
                    }
                    
                }
                if corr == 4 {
                    if err == 0 {
                        if self.left.isSelected {
                            self.left.score += 20
                        }
                        else {
                            self.right.score += 20
                        }
                        
                        
                        
                        //Disable [quizer]
                    } // Check Quizout w/o errors
                    else { /*PopUp: "[quizzer] has quizzed out!"; Disable [quizer]*/
                        
                    }
                    
                } // Check Quizout
                //Check team bonus
                
            case false:
                if (self.questionNum >= 16) || errT > 3 {
                    if self.left.isSelected {
                        self.left.score -= 10
                        self.left.errT += 1
                        switch self.quizerPicker {
                            case 1:
                                self.left.quizzer.q1.err[Int(questionNum-1)] = 1
                            case 2:
                                self.left.quizzer.q2.err[Int(questionNum-1)] = 1
                            case 3:
                                self.left.quizzer.q3.err[Int(questionNum-1)] = 1
                            case 4:
                                self.left.quizzer.q4.err[Int(questionNum-1)] = 1
                            case 5:
                                self.left.quizzer.q5.err[Int(questionNum-1)] = 1
                            case 6:
                                self.left.quizzer.q6.err[Int(questionNum-1)] = 1
                            case 7:
                                self.left.quizzer.q7.err[Int(questionNum-1)] = 1
                                
                            default:
                                exit(1)
                        }
                    }
                    else {
                        self.right.score -= 10
                        self.right.errT += 1
                        switch self.quizerPicker {
                            case 1:
                                self.right.quizzer.q1.err[Int(questionNum-1)] = 1
                            case 2:
                                self.right.quizzer.q2.err[Int(questionNum-1)] = 1
                            case 3:
                                self.right.quizzer.q3.err[Int(questionNum-1)] = 1
                            case 4:
                                self.right.quizzer.q4.err[Int(questionNum-1)] = 1
                            case 5:
                                self.right.quizzer.q5.err[Int(questionNum-1)] = 1
                            case 6:
                                self.right.quizzer.q6.err[Int(questionNum-1)] = 1
                            case 7:
                                self.right.quizzer.q7.err[Int(questionNum-1)] = 1
                                
                            default:
                                exit(1)
                        }
                        
                    }
                }
                if err == 4 {
                    
                    //PopUp: "[quizzer] has quizzed out without errors!"
                    //Disable [quizer]
                }
        }
        self.questionNum += 1
        disArm()
        return nil
    }
    func text() {}
    func foul() {}
    func timer() {}
}

struct mainQuizMaster: View {
    @EnvironmentObject var appState: AppState
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
                }
                Picker(selection: $quiz.quizerPicker, label: Text("Seat #")) {
                    Text("Quizer #1").tag(1)
                    Text("Quizer #2").tag(2)
                    Text("Quizer #3").tag(3)
                    Text("Quizer #4").tag(4)
                    Text("Quizer #5").tag(5)
                }
            } //TEMP: Choose Team (test quiz.jump())
            Group  {
                Text("Question #"+String(quiz.questionNum))
                Spacer()
                Text("Question from Database")
                Spacer()
                Text("A: From Database")
                Spacer()
            } //Question/Ans (work on db)
            HStack {
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
                }
            } //Reset button
            HStack {
                Spacer()
                Button {
                    if quiz.left.isSelected || quiz.right.isSelected {
                        quiz.quesAns(ansType: false)
                    }
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
                    /* .alert(isPresented: quiz.$showingQuizOut) {
                     Alert(title: Text("Quizzed Out!"), message: Text("Quizzer #\(quiz.quizerPicker) on the \( quiz.activeSide ) has quizzed out!"), dismissButton: .default(Text("OK")))
                     } */
                    
                }
                Spacer()
                Button {
                    if quiz.left.isSelected || quiz.right.isSelected {
                        quiz.quesAns(ansType: true)
                    }
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
        mainQuizMaster()
            .preferredColorScheme(.light)
            .previewInterfaceOrientation(.portrait)
    }
}
