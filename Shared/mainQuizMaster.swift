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

extension Sequence where Element: AdditiveArithmetic {
    func sum() -> Element { reduce(.zero, +) }
}

class quizStuff: ObservableObject {
    struct side {
        var buttonColor = Color.gray
        var color: Color
        var isSelected = false
        var score = 0
        var corrT = 0 //Number of individuals that answered (NOT number of correct answers)
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
    @Published public var empty = side(color: Color.gray)
    init (leftColor: Color, rightColor: Color) {
        self.left.color = leftColor
        self.right.color = rightColor
        
    }
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
    @discardableResult func jump(side: String) -> String? {
        var team = self.empty
        var notTeam = self.empty
        if activeSide == "left"  {
            team = left
            notTeam = right
        }
        else if activeSide == "right" {
            team = right
            notTeam = left
        }
        else {return "error: jump"}
        team.isSelected = true
        notTeam.isSelected = false
        team.buttonColor = team.color
        notTeam.buttonColor = Color.gray
        return nil
    }
    
    func disArm() {
        left.isSelected = false
        right.isSelected = false
        left.buttonColor = Color.gray
        right.buttonColor = Color.gray
        
    }
    func reset() {
        disArm()
    }
    @discardableResult func quesAns(ansType: Bool) -> String? {
        var team = self.empty
        var quizzer = team.quizzer.q1
        
        if activeSide == "left"  {team = self.left}
        else if activeSide == "right" {team = self.left}
        else {return "error"}
        

        switch quizerPicker { //give correct answer to respective quizzer
            case 1:
                quizzer = team.quizzer.q1
            case 2:
                quizzer = team.quizzer.q2
            case 3:
                quizzer = team.quizzer.q3
            case 4:
                quizzer = team.quizzer.q4
            case 5:
                quizzer = team.quizzer.q5
            case 6:
                quizzer = team.quizzer.q6
            case 7:
                quizzer = team.quizzer.q7
            default:
                return "quizzerPicker is invalid"
        }
        switch ansType {
            case true:
                team.score += 20
                quizzer.corr[Int(questionNum-1)] = 1
                let err = quizzer.err.sum()
                let corr = quizzer.corr.sum()
                if corr == 5 { //Check quizOut
                    if err == 0 { //Check w/o errors
                        //"Congratulations to \(quizzer.name) for quizzing out with out errors!"
                        team.score += 20
                    } else {
                        //Notify: "Congratulations to \(quizzer.name) for quizzing out!"
                    }
                }
                team.corrT += 1
                if team.corrT == 5 {
                    //"Congratulations to \(team.name) for getting a team bonus!"
                }
            case false:
                quizzer.err[Int(questionNum-1)] = 1
                team.errT += 1
                if quizzer.err.sum() == 4 { //Check quizOut
                    //Notify: "\(Quizzer) quizzed out!"
                }
        }
        questionNum += 1
        disArm()
        return nil
    }
    func text() {}
    func foul() {}
    func timer() {}
}

struct mainQuizMaster: View {
    @EnvironmentObject var appState: AppState
    @ObservedObject var quiz = quizStuff(leftColor: Color.cyan, rightColor: Color.orange)
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
                } // Incorrect
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
                } // Correct
                Spacer()
                
            } //Correct/incorrect bar
            HStack {
                Button {
                    appState.UiState = 4
                } label: {
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
                Spacer()
                Button {
                    appState.UiState = 0
                } label: {
                    ZStack {
                        Circle()
                            .fill(Color.gray)
                            .aspectRatio(0.75, contentMode: .fit)
                            .frame(width: 100, height: 100)
                            .border(Color("AccentColor"))
                        Text(" Setup ").foregroundColor(Color.white)
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
