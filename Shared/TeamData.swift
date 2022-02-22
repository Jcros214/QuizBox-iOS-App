//
//  TeamData.swift
//  QuizBox
//
//  Created by Jonathan Crosby on 2/12/22.
//

import Foundation

class member {
    var name: String
    init(Name: String) {
        name = Name
    }
}
class team {
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
var teamDict = [
    "Steadfast":    ["Lydia Crosby", "Samuel Unger", "Abby Unger", "Grace Carnell", "Moriah Pipkin"],
    "United":       ["Bethany Carnell", "Jonathan Crosby", "James Crosby", "Megan Carnell", "Lily Pipkin"],
    "Accepted":     ["Joey Crosby", "Destiny Wells", "Miriam Carnell", "Micaiah Pipkin"]
]

