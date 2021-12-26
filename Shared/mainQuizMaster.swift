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
    
    struct quizzerIndividual {
        var corr = Array(repeating: 0, count: 26)
        var err = Array(repeating: 0, count: 26)
        var isStanding = false
    }
    struct humanFrindlyIDs {
        var name: String
    }
    struct side {
        var _name: String
        var humanID = humanFrindlyIDs(name: "Team 1")
        var buttonColor = Color.gray
        var color: Color
        var isSelected = false
        var score = 0
        var corrT = 0 //Number of individuals that answered (NOT number of correct answers)
        var errT = 0
        var quizzer = [
            quizzerIndividual(),
            quizzerIndividual(),
            quizzerIndividual(),
            quizzerIndividual(),
            quizzerIndividual(),
            quizzerIndividual(),
            quizzerIndividual()
        ]
    }
    @Published public var left: side
    @Published public var right: side
    @Published public var empty: side
    
    var questionNum = 0
    var boxStates = [
        1: "Standby",
        2: "Waiting",
        3: "Ready"]
    var boxColors = [
        1: Color.green,
        2: Color.gray,
        3: Color.orange]
    var boxState = 1
    var quizerPicker = 1
    var activeSide: Bool = false
    
    func disArm() {
        left.isSelected = false
        right.isSelected = false
        left.buttonColor = Color.gray
        right.buttonColor = Color.gray
        
    }
    func reset() {
        disArm()
    }
    func text() {}
    func foul() {}
    func timer() {}
    func printStats() {}
    
    @discardableResult func jump() -> String? {
        var team = self.right
        var notTeam = self.left
        if activeSide { //right
        } else { //left
            team = self.left
            notTeam = self.right
        }
        
        team.isSelected = true
        team.buttonColor = team.color
        
        notTeam.isSelected = false
        notTeam.buttonColor = .gray

        print("\(right._name)'s Button Color is: \(right.buttonColor)")
        print("\(left._name)'s Button Color is: \(left.buttonColor)")
        print("\(right._name)'s isSelected value is: \(right.isSelected)")
        print("\(left._name)'s isSelected value is: \(left.isSelected)")
        
        
        
        return nil
    }
    @discardableResult func quesAns(ansType: Bool) -> String? {
        var team: side
        var quizzer: quizzerIndividual
        
        if activeSide {
            team = right
        } else if !activeSide {
            team = left
        } else {
            exit(1)
        }
        quizzer = team.quizzer[quizerPicker + 1]
        
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
    init (leftName: String, leftColor: Color, rightName: String, rightColor: Color) {
        left  = side( _name: "left" , color: leftColor)
        right = side( _name: "right", color: rightColor)
        empty = side( _name: "empty", color: .gray)
    }
}
struct mainQuizMaster: View {
    @EnvironmentObject var appState: AppState
    @ObservedObject var quiz = quizStuff(leftName: "left", leftColor: .cyan, rightName: "right", rightColor: .red)
    var body: some View {
        VStack {
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
                        quiz.activeSide = false
                        quiz.jump()
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
                        quiz.activeSide = true
                        quiz.jump()
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
                    print("Incorrect Pressed", quiz.left.isSelected, quiz.right.isSelected)
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
                    print("Correct Pressed", quiz.left.isSelected, quiz.right.isSelected)
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
                Button {
                    quiz.printStats()
                } label: {
                    ZStack {
                        Circle()
                            .fill(Color.gray)
                            .aspectRatio(0.75, contentMode: .fit)
                            .frame(width: 100, height: 100)
                            .border(Color("AccentColor"))
                        
                        Text(" Print Debug ")
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
