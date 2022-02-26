//
//  TeamData.swift
//  QuizBox
//
//  Created by Jonathan Crosby on 2/12/22.
//

import Foundation

public var rightSel = 0
public var leftSel = 0

class member {
    var name: String
    init(Name: String) {
        name = Name
    }
}
public class team {
    var name: String
    var quizzers: Array<member>
    init (Name: String, q1: String = "", q2: String = "", q3: String = "", q4: String = "", q5: String = "", q6: String = "", q7: String = "") {
        name = Name
        quizzers = [
            member(Name: q1),
            member(Name: q2),
            member(Name: q3),
            member(Name: q4),
            member(Name: q5),
            member(Name: q6),
            member(Name: q7)
        ]
    }
}

public var teamArray = [
    team(Name: "Steadfast", q1: "Lydia Crosby", q2: "Samuel Unger", q3: "Abby Unger", q4: "Grace Carnell", q5: "Moriah Pipkin"),
    team(Name: "United", q1: "Bethany Carnell", q2: "Jonathan Crosby", q3: "James Crosby", q4: "Megan Carnell", q5: "Lily Pipkin"),
    team(Name: "Accepted", q1: "Joey Crosby", q2: "Destiny Wells", q3: "Miriam Carnell", q4: "Micaiah Pipkin", q5: "Bellhannah Cutler"),
    
    team(Name: "Custom")
    
]
