//
//  ActsView.swift
//  QuizBox
//
//  Created by Jonathan Crosby on 12/21/21.
//

import SwiftUI

struct ActsView: View {
    @EnvironmentObject var appState: AppState
    var acts26 = [
        "Then‭ Agrippa‭ said‭‭ unto‭ Paul‭, Thou‭ art permitted‭‭ to speak‭‭ for‭ thyself‭. Then‭ Paul‭ stretched forth‭‭ the hand‭, and answered for himself‭‭:‭ ",
        "‭I think‭‭ myself‭ happy‭, king‭ Agrippa‭, because I shall‭‭ answer for myself‭‭ this day‭ before‭ thee‭ touching‭ all the things‭ whereof‭ I am accused‭‭ of‭ the Jews‭:‭",
        "‭Especially‭ [because I know‭‭] thee‭ to be‭‭ expert‭‭ in all‭ customs‭ and‭ questions‭ which are among‭ the Jews‭: wherefore‭ I beseech‭‭ thee‭ to hear‭‭ me‭ patiently‭.‭ ",
        "‭My‭ manner‭‭ of life‭ from‭ my youth‭, which‭ was‭‭ at‭ the first‭ among‭ mine‭ own nation‭ at‭ Jerusalem‭, know‭‭ all‭ the Jews‭;‭ ",
        "‭Which knew‭‭ me‭ from the beginning‭, if‭ they would‭‭ testify‭‭, that‭ after‭ the most straitest‭ sect‭ of our‭ religion‭ I lived‭‭ a Pharisee‭.‭ ",
        "‭And‭ now‭ I stand‭‭ and am judged‭‭ for‭ the hope‭ of the promise‭ made‭‭ of‭ God‭ unto‭ our fathers‭:‭ ",
        "‭Unto‭ which‭ [promise] our‭ twelve tribes‭, instantly‭‭ serving‭‭ [God] day‭ and‭ night‭, hope‭‭ to come‭‭. For‭ which‭ hope’s sake‭, king‭ Agrippa‭, I am accused‭‭ of‭ the Jews‭.‭ ",
        "‭Why‭ should it be thought a thing‭‭ incredible‭ with‭ you‭, that‭ God‭ should raise‭‭ the dead‭?‭ ",
        "‭I‭ verily‭‭ thought‭‭ with myself‭, that I ought‭‭ to do‭‭ many things‭ contrary‭ to‭ the name‭ of Jesus‭ of Nazareth‭.‭ ",
        "‭Which thing‭ I‭‭ also‭ did‭‭ in‭ Jerusalem‭: and‭ many‭ of the saints‭ did‭‭ I‭ shut up‭‭ in prison‭, having received‭‭ authority‭ from‭ the chief priests‭; and‭ when they‭ were put to death‭‭, I gave‭‭ my voice‭ against [them].‭ ",
        "‭And‭ I punished‭‭ them‭ oft‭ in‭ every‭ synagogue‭, and compelled‭‭ [them] to blaspheme‭‭; and‭ being‭‭ exceedingly‭ mad against‭‭ them‭, I persecuted‭‭ [them] even‭ unto‭‭ strange‭ cities‭.‭ ",
        "‭Whereupon‭‭ as I went‭‭ to‭ Damascus‭ with‭ authority‭ and‭ commission‭ from‭ the chief priests‭,‭ ",
        "‭At midday‭‭, O king‭, I saw‭‭ in‭ the way‭ a light‭ from heaven‭, above‭ the brightness‭ of the sun‭, shining round about‭‭ me‭ and‭ them which journeyed‭‭ with‭ me‭.‭ ",
        "‭And‭ when we‭ were‭‭ all‭ fallen‭‭ to‭ the earth‭, I heard‭‭ a voice‭ speaking‭‭ unto‭ me‭, and‭ saying‭‭ in the Hebrew‭ tongue‭, Saul‭, Saul‭, why‭ persecutest thou‭‭ me‭? [it is] hard‭ for thee‭ to kick‭‭ against‭ the pricks‭.‭ ",
        "‭And‭ I‭ said‭‭, Who‭ art thou‭‭, Lord‭? And‭ he said‭‭, I‭ am‭‭ Jesus‭ whom‭ thou‭ persecutest‭‭.‭ ",
        "‭But‭ rise‭‭, and‭ stand‭‭ upon‭ thy‭ feet‭: for‭ I have appeared‭‭ unto thee‭ for‭ this purpose‭, to make‭‭ thee‭ a minister‭ and‭ a witness‭ both‭ of these things which‭ thou hast seen‭‭, and‭ of those things in the which‭ I will appear‭‭ unto thee‭;‭ ",
        "‭Delivering‭‭ thee‭ from‭ the people‭, and‭ [from] the Gentiles‭, unto‭ whom‭ now‭ I send‭‭ thee‭,‭ ",
        "‭To open‭‭ their‭ eyes‭, [and] to turn‭‭ [them] from‭ darkness‭ to‭ light‭, and‭ [from] the power‭ of Satan‭ unto‭ God‭, that they‭ may receive‭‭ forgiveness‭ of sins‭, and‭ inheritance‭ among‭ them which are sanctified‭‭ by faith‭ that is in‭ me‭.‭ ",
        "‭Whereupon‭, O king‭ Agrippa‭, I was‭‭ not‭ disobedient‭ unto the heavenly‭ vision‭:‭ ",
        "‭But‭ shewed‭‭‭‭‭ first‭ unto them of‭ Damascus‭, and‭ at Jerusalem‭, and‭ throughout‭ all‭ the coasts‭ of Judaea‭, and‭ [then] to the Gentiles‭, that they should repent‭‭ and‭ turn‭‭ to‭ God‭, and do‭‭ works‭ meet‭ for repentance‭.‭ ",
        "‭For‭ these causes‭ the Jews‭ caught‭‭ me‭ in‭ the temple‭, and went about‭‭ to kill‭‭ [me].‭ ",
        "‭Having‭‭ therefore‭ obtained‭‭ help‭ of‭ God‭, I continue‭‭ unto‭ this‭ day‭, witnessing‭‭ both‭ to small‭ and‭ great‭, saying‭‭ none other things‭ than‭ those which‭‭ the prophets‭ and‭ Moses‭ did say‭‭ should‭‭ come‭‭:‭ ",
        "‭That‭ Christ‭ should suffer‭, [and] that‭ he should be the first‭ that should rise‭ from‭ the dead‭, and should‭‭ shew‭‭ light‭ unto the people‭, and‭ to the Gentiles‭.‭ ",
        "‭And‭ as he‭ thus‭ spake for himself‭‭, Festus‭ said‭‭ with a loud‭ voice‭, Paul‭, thou art beside thyself‭‭; much‭ learning‭ doth make‭‭ thee‭ mad‭‭.‭ ",
        "‭But‭ he said‭‭, I am‭‭ not‭ mad‭‭, most noble‭ Festus‭; but‭ speak forth‭‭ the words‭ of truth‭ and‭ soberness‭.‭ ",
        "‭For‭ the king‭ knoweth‭‭ of‭ these‭ things, before‭ whom‭ also‭ I speak‭‭ freely‭‭: for‭ I am persuaded‭‭ that‭ none‭‭ of these things‭ are hidden‭‭ from him‭; for‭ this thing‭ was‭‭ not‭ done‭‭ in‭ a corner‭.‭ ",
        "‭King‭ Agrippa‭, believest thou‭‭ the prophets‭? I know‭‭ that‭ thou believest‭‭.‭ ",
        "‭Then‭ Agrippa‭ said‭‭ unto‭ Paul‭, Almost‭‭ thou persuadest‭‭ me‭ to be‭‭ a Christian‭.‭ ",
        "‭And‭ Paul‭ said‭‭, I would‭‭‭ to God‭, that not‭ only‭ thou‭, but‭ also‭ all‭ that hear‭‭ me‭ this day‭, were‭‭ both‭ almost‭‭, and‭ altogether‭‭ such‭ as‭‭ I am‭‭, except‭ these‭ bonds‭.‭ ",
        "‭And‭ when he‭ had‭‭ thus‭ spoken‭‭, the king‭ rose up‭‭, and‭ the governor‭, and‭ Bernice‭, and‭ they that sat with‭‭ them‭:‭ ",
        "‭And‭ when they were gone aside‭‭, they talked‭‭ between‭ themselves‭, saying‭‭,‭ This‭ man‭ doeth‭‭ nothing‭ worthy‭ of death‭ or‭ of bonds‭.‭ ",
        "‭Then‭ said‭‭ Agrippa‭ unto Festus‭, This‭ man‭ might‭‭ have been set at liberty‭‭, if‭‭ he had‭‭ not‭ appealed unto‭‭ Caesar‭."
    ]
    
    var body: some View {
        VStack {
            Button {
                appState.UiState = 1
            } label: {
                Text("Go Back (Still under development)")
            }
            ScrollView {
                HStack {
                    Text("Acts 26")
                        .font(.title)
                        .fontWeight(.semibold)
                        .multilineTextAlignment(.leading)
                }
                VStack {
                    Group {
                        Text("1 \(acts26[0])")
                        Text("2 \(acts26[1])")
                        Text("3 \(acts26[2])")
                        Text("4 \(acts26[3])").fontWeight(.bold)
                        Text("5 \(acts26[4])")
                        Text("6 \(acts26[5])").fontWeight(.bold)
                        Text("7 \(acts26[6])")
                        Text("8 \(acts26[7])").fontWeight(.bold)
                        Text("9 \(acts26[8])")
                    }
                    Group {
                        Text("10 \(acts26[9])")
                        Text("11 \(acts26[10])")
                        Text("12 \(acts26[11])")
                        Text("13 \(acts26[12])").fontWeight(.bold)
                        Text("14 \(acts26[13])")
                        Text("15 \(acts26[14])")
                        Text("16 \(acts26[15])").fontWeight(.bold)
                        Text("17 \(acts26[16])")
                        Text("18 \(acts26[17])").fontWeight(.bold)
                        Text("19 \(acts26[18])").fontWeight(.bold)
                    }
                    Group {
                        Text("20 \(acts26[19])")
                        Text("21 \(acts26[20])")
                        Text("22 \(acts26[21])")
                        Text("23 \(acts26[22])")
                        Text("24 \(acts26[23])").fontWeight(.bold)
                        Text("25 \(acts26[24])")
                        Text("26 \(acts26[25])")
                        Text("27 \(acts26[26])")
                        Text("28 \(acts26[27])").fontWeight(.bold)
                        Text("29 \(acts26[28])")
                    }
                    Group {
                        Text("30 \(acts26[29])")
                        Text("31 \(acts26[30])")
                        Text("32 \(acts26[31])")
                    }
                }
            }
        }
    }
}

struct ActsView_Previews: PreviewProvider {
    static var previews: some View {
        ActsView()
    }
}
