//
//  quizStuff_decleration.swift
//  QuizBox
//
//  Created by Jonathan Crosby on 1/16/22.
//

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

import SwiftUI
import Foundation
class quizzerIndividual {
    var corr = Array(repeating: 0, count: 26)
    var err = Array(repeating: 0, count: 26)
    var isEnabled = true
    
}
class side {
    var _name: String
    var buttonColor = Color.gray
    var _color: Color
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
    init( name: String , color: Color) {
        _name = name
        _color = color
    }
}
class quizStuff: ObservableObject {
    @Published public var left: side
    @Published public var right: side
    @Published public var empty: side
    
    @Published var questionNum = 1
    @Published var boxStates = [
        1: "Standby",
        2: "Ready",
        
        4: "Standing"
    ]
    @Published var boxColors = [
        1: Color("standby"),
        2: Color("ready"),
        
        4: Color("standing")
    ]
    @Published var boxState = 0
    @Published var quizerPicker = 1
    @Published var activeSide: Bool = false
    
    func disArm() {
        left.isSelected = false
        right.isSelected = false
        left.buttonColor = Color.gray
        right.buttonColor = Color.gray
        
    }
    func reset() {
        disArm()
        switch boxState {
            case 1:
                boxState=2
            case 2:
                boxState=3
            case 3:
                boxState=1
            default:
                boxState = 1
        }
    }
    func text() {}
    func foul() {}
    func timer() {}
    func printStats() {
        print("BoxState: \(self.boxState)")
    }
    
    @discardableResult func jump() -> String? {
        self.boxState = 4
        var team = self.right
        var notTeam = self.left
        if activeSide { //right
        } else { //left
            team = self.left
            notTeam = self.right
        }
        
        team.isSelected = true
        team.buttonColor = team._color
        
        notTeam.isSelected = false
        notTeam.buttonColor = .gray
        return nil
    }
    @discardableResult func quesAns(ansType: Bool) -> String? {
        var team: side
        var quizzer: quizzerIndividual
        
        if activeSide {
            team = self.right
        } else if !activeSide {
            team = self.left
        } else {
            exit(1)
        }
        quizzer = team.quizzer[quizerPicker + 1]
        if !quizzer.isEnabled {return nil}
        switch ansType {
            case true:
                team.score += 20
                print("Before: ", quizzer.corr.reduce(0, +))
                quizzer.corr[Int(questionNum-1)] = 1
                print("After: ", quizzer.corr.reduce(0, +))
                let err = quizzer.err.reduce(0, +)
                let corr = quizzer.corr.reduce(0, +)
                print(team._name, corr)
                if corr == 5 { //Check quizOut
                    team.score += 20
                    quizzer.isEnabled = false
                    if err == 0 { //Check w/o errors
                        //"Congratulations to \(quizzer.name) for quizzing out with out errors!"
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
                if quizzer.err.reduce(0, +) == 4 { //Check quizOut
                    quizzer.isEnabled = false
                    //Notify: "\(Quizzer) quizzed out!"
                }
        }
        questionNum += 1
        disArm()
        boxState = 1
        return nil
    }
    init (leftName: String, leftColor: Color, rightName: String, rightColor: Color) {
        left  = side( name: "left" , color: leftColor)
        right = side( name: "right", color: rightColor)
        empty = side( name: "empty", color: .gray)
    }
}