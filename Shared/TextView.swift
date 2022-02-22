//
//  ActsView.swift
//  QuizBox
//
//  Created by Jonathan Crosby on 12/21/21.
//


let iCor1 =  [
    "Paul, called to be an apostle of Jesus Christ through the will of God, and Sosthenes our brother,",
    "Unto the church of God which is at Corinth, to them that are sanctified in Christ Jesus, called to be saints, with all that in every place call upon the name of Jesus Christ our Lord, both theirs and ours:",
    "Grace be unto you, and peace, from God our Father, and from the Lord Jesus Christ.",
    "I thank my God always on your behalf, for the grace of God which is given you by Jesus Christ;",
    "That in every thing ye are enriched by him, in all utterance, and in all knowledge;",
    "Even as the testimony of Christ was confirmed in you:",
    "So that ye come behind in no gift; waiting for the coming of our Lord Jesus Christ:",
    "Who shall also confirm you unto the end, that ye may be blameless in the day of our Lord Jesus Christ.",
    "God is faithful, by whom ye were called unto the fellowship of his Son Jesus Christ our Lord.",
    "Now I beseech you, brethren, by the name of our Lord Jesus Christ, that ye all speak the same thing, and that there be no divisions among you; but that ye be perfectly joined together in the same mind and in the same judgment.",
    "For it hath been declared unto me of you, my brethren, by them which are of the house of Chloe, that there are contentions among you.",
    "Now this I say, that every one of you saith, I am of Paul; and I of Apollos; and I of Cephas; and I of Christ.",
    "Is Christ divided? was Paul crucified for you? or were ye baptized in the name of Paul?",
    "I thank God that I baptized none of you, but Crispus and Gaius;",
    "Lest any should say that I had baptized in mine own name.",
    "And I baptized also the household of Stephanas: besides, I know not whether I baptized any other.",
    "For Christ sent me not to baptize, but to preach the gospel: not with wisdom of words, lest the cross of Christ should be made of none effect.",
    "For the preaching of the cross is to them that perish foolishness; but unto us which are saved it is the power of God.",
    "For it is written, I will destroy the wisdom of the wise, and will bring to nothing the understanding of the prudent.",
    "Where is the wise? where is the scribe? where is the disputer of this world? hath not God made foolish the wisdom of this world?",
    "For after that in the wisdom of God the world by wisdom knew not God, it pleased God by the foolishness of preaching to save them that believe.",
    "For the Jews require a sign, and the Greeks seek after wisdom:",
    "But we preach Christ crucified, unto the Jews a stumblingblock, and unto the Greeks foolishness;",
    "But unto them which are called, both Jews and Greeks, Christ the power of God, and the wisdom of God.",
    "Because the foolishness of God is wiser than men; and the weakness of God is stronger than men.",
    "For ye see your calling, brethren, how that not many wise men after the flesh, not many mighty, not many noble, are called:",
    "But God hath chosen the foolish things of the world to confound the wise; and God hath chosen the weak things of the world to confound the things which are mighty;",
    "And base things of the world, and things which are despised, hath God chosen, yea, and things which are not, to bring to nought things that are:",
    "That no flesh should glory in his presence.",
    "But of him are ye in Christ Jesus, who of God is made unto us wisdom, and righteousness, and sanctification, and redemption:",
    "That, according as it is written, He that glorieth, let him glory in the Lord."
] as [String]
let iCor2 =  [
    "And I‭, brethren‭, when I came‭‭ to‭ you‭, came‭‭ not‭ with‭ excellency‭ of speech‭ or‭ of wisdom‭, declaring‭‭ unto you‭ the testimony‭ of God‭.",
    "‭For‭ I determined‭‭ not‭ to know‭‭ any thing‭ among‭ you‭, save‭ Jesus‭ Christ‭, and‭ him‭ crucified‭‭.",
    "‭And‭ I‭ was‭‭ with‭ you‭ in‭ weakness‭, and‭ in‭ fear‭, and‭ in‭ much‭ trembling‭.",
    "‭And‭ my‭ speech‭ and‭ my‭ preaching‭ was not‭ with‭ enticing‭ words‭ of man’s‭ wisdom‭, but‭ in‭ demonstration‭ of the Spirit‭ and‭ of power‭:",
    "‭That‭ your‭ faith‭ should‭‭ not‭ stand‭‭ in‭ the wisdom‭ of men‭, but‭ in‭ the power‭ of God‭.",
    "‭Howbeit‭ we speak‭‭ wisdom‭ among‭ them that are perfect‭: yet‭ not‭ the wisdom‭ of this‭ world‭, nor‭ of the princes‭ of this‭ world‭, that come to nought‭‭:",
    "‭But‭ we speak‭‭ the wisdom‭ of God‭ in‭ a mystery‭, even the hidden‭‭ wisdom, which‭ God‭ ordained‭‭ before‭ the world‭ unto‭ our‭ glory‭:",
    "‭Which‭ none‭ of the princes‭ of this‭ world‭ knew‭‭: for‭‭ had they known‭‭ it, they‭ would‭‭ not‭ have crucified‭‭ the Lord‭ of glory‭.",
    "‭But‭ as‭ it is written‭‭,‭ Eye‭ hath‭‭ not‭ seen‭‭, nor‭‭ ear‭ heard‭‭, neither‭‭ have entered‭‭ into‭ the heart‭ of man‭, the things which‭ God‭ hath prepared‭‭ for them that love‭‭ him‭.",
    "‭But‭ God‭ hath revealed‭‭ them unto us‭ by‭ his‭ Spirit‭: for‭ the Spirit‭ searcheth‭‭ all things‭, yea‭, the deep things‭ of God‭.",
    "‭For‭ what‭ man‭ knoweth‭‭ the things‭ of a man‭, save‭ the spirit‭ of man‭ which‭ is in‭ him‭? even‭ so‭ the things‭ of God‭ knoweth‭‭ no man‭, but‭ the Spirit‭ of God‭.",
    "‭Now‭ we‭ have received‭‭, not‭ the spirit‭ of the world‭, but‭ the spirit‭ which‭ is of‭ God‭; that‭ we might know‭‭ the things that are freely given‭‭ to us‭ of‭ God‭.",
    "‭Which things‭ also‭ we speak‭‭, not‭ in‭ the words‭ which man’s‭ wisdom‭ teacheth‭, but‭ which the Holy‭ Ghost‭ teacheth‭‭; comparing‭‭ spiritual things‭ with spiritual‭.",
    "‭But‭ the natural‭ man‭ receiveth‭‭ not‭ the things‭ of the Spirit‭ of God‭: for‭ they are‭‭ foolishness‭ unto him‭: neither‭‭ can‭‭ he know‭‭ them, because‭ they are spiritually‭ discerned‭‭.",
    "‭But‭ he that is spiritual‭ judgeth‭‭‭ all things‭, yet‭ he himself‭ is judged‭‭ of‭ no man‭.",
    "‭For‭ who‭ hath known‭‭ the mind‭ of the Lord‭, that‭ he may instruct‭‭ him‭? But‭ we‭ have‭‭ the mind‭ of Christ‭."
] as [String]
let iCor3 =  [
    "And‭ I‭, brethren‭, could‭‭ not‭ speak‭‭ unto you‭ as‭ unto spiritual‭, but‭ as‭ unto carnal‭, [even] as‭ unto babes‭ in‭ Christ‭.",
    "‭I have fed‭‭ you‭ with milk‭, and‭ not‭ with meat‭: for‭ hitherto‭‭ ye were‭‭ not‭ able‭‭ [to bear it], neither‭‭ yet‭ now‭ are ye able‭‭.",
    "‭For‭ ye are‭‭ yet‭ carnal‭: for‭ whereas‭ [there is] among‭ you‭ envying‭, and‭ strife‭, and‭ divisions‭, are ye‭‭ not‭ carnal‭, and‭ walk‭‭ as‭ men‭?",
    "‭For‭ while‭ one‭ saith‭‭, I‭‭ am‭‭ of Paul‭; and‭ another‭, I‭ [am] of Apollos‭; are‭ ye‭ not‭ carnal‭?",
    "‭Who‭ then‭ is‭‭ Paul‭, and‭ who‭ [is] Apollos‭, but‭‭ ministers‭ by‭ whom‭ ye believed‭‭, even‭ as‭ the Lord‭ gave‭‭ to every man‭?",
    "‭I‭ have planted‭‭, Apollos‭ watered‭‭; but‭ God‭ gave the increase‭‭.",
    "‭So‭ then neither‭ is‭‭ he that planteth‭‭ any thing‭, neither‭ he that watereth‭‭; but‭ God‭ that giveth the increase‭‭.",
    "‭Now‭ he that planteth‭‭ and‭ he that watereth‭‭ are‭‭ one‭: and‭ every man‭ shall receive‭‭ his own‭ reward‭ according‭ to his own‭ labour‭.",
    "‭For‭ we are‭‭ labourers together‭ with God‭: ye are‭‭ God’s‭ husbandry‭, [ye are] God’s‭ building‭.",
    "‭According‭ to the grace‭ of God‭ which‭ is given‭‭ unto me‭, as‭ a wise‭ masterbuilder‭, I have laid‭‭ the foundation‭, and‭ another‭ buildeth‭‭ thereon. But‭ let‭‭ every man‭ take heed‭‭ how‭ he buildeth‭‭ thereupon.",
    "‭For‭ other‭ foundation‭ can‭‭ no man‭ lay‭‭ than‭ that is laid‭‭, which‭ is‭‭ Jesus‭ Christ‭.",
    "‭Now‭ if any man‭ build‭‭ upon‭ this‭ foundation‭ gold‭, silver‭, precious‭ stones‭, wood‭, hay‭, stubble‭;",
    "‭Every man’s‭ work‭ shall be made‭‭ manifest‭: for‭ the day‭ shall declare‭‭ it, because‭ it shall be revealed‭‭ by‭ fire‭; and‭ the fire‭ shall try‭‭ every man’s‭ work‭ of what sort‭ it is‭‭.",
    "‭If any man’s‭ work‭ abide‭‭ which‭ he hath built‭‭ thereupon, he shall receive‭‭ a reward‭.",
    "‭If any man’s‭ work‭ shall be burned‭‭, he shall suffer loss‭‭: but‭ he himself‭ shall be saved‭‭; yet‭ so‭ as‭ by‭ fire‭.",
    "‭Know ye‭‭ not‭ that‭ ye are‭‭ the temple‭ of God‭, and‭ [that] the Spirit‭ of God‭ dwelleth‭‭ in‭ you‭?",
    "‭If any man‭ defile‭‭ the temple‭ of God‭, him‭ shall‭‭ God‭ destroy‭‭; for‭ the temple‭ of God‭ is‭‭ holy‭, which‭ [temple] ye‭ are‭‭.",
    "‭Let‭‭ no man‭ deceive‭‭ himself‭. If any man‭ among‭ you‭ seemeth‭‭ to be‭‭ wise‭ in‭ this‭ world‭, let him become‭‭ a fool‭, that‭ he may be‭‭ wise‭.",
    "‭For‭ the wisdom‭ of this‭ world‭ is‭‭ foolishness‭ with‭ God‭. For‭ it is written‭‭, He taketh‭‭ the wise‭ in‭ their own‭ craftiness‭.",
    "‭And‭ again‭, The Lord‭ knoweth‭‭ the thoughts‭ of the wise‭, that‭ they are‭‭ vain‭.",
    "‭Therefore‭ let‭‭ no man‭ glory‭‭ in‭ men‭. For‭ all things‭ are‭‭ yours‭;",
    "‭Whether‭ Paul‭, or‭ Apollos‭, or‭ Cephas‭, or‭ the world‭, or‭ life‭, or‭ death‭, or‭ things present‭‭, or‭ things to come‭‭; all‭ are‭‭ yours‭;",
    "‭And‭ ye‭ are Christ’s‭; and‭ Christ‭ [is] God’s‭."
] as [String]
let iCor4 =  [
    "Let‭‭ a man‭ so‭ account‭‭ of us‭, as‭ of the ministers‭ of Christ‭, and‭ stewards‭ of the mysteries‭ of God‭.",
    "‭‭ Moreover‭ it is required‭‭ in‭ stewards‭, that‭ a man‭ be found‭‭ faithful‭.",
    "‭But‭ with me‭ it is‭‭ a very small thing‭‭ that‭ I should be judged‭‭ of‭ you‭, or‭ of‭ man’s‭ judgment‭: yea‭, I judge‭‭ not‭ mine own self‭.",
    "‭For‭ I know‭‭ nothing‭ by myself‭; yet‭ am I‭‭ not‭ hereby‭‭ justified‭‭: but‭ he that judgeth‭‭ me‭ is‭‭ the Lord‭.",
    "‭Therefore‭ judge‭‭ nothing‭‭ before‭ the time‭, until‭‭ the Lord‭ come‭‭, who‭ both‭ will bring to light‭‭ the hidden things‭ of darkness‭, and‭ will make manifest‭‭ the counsels‭ of the hearts‭: and‭ then‭ shall every man‭ have‭‭ praise‭ of‭ God‭.",
    "‭And‭ these things‭, brethren‭, I have in a figure transferred‭‭ to‭ myself‭ and‭ [to] Apollos‭ for‭ your sakes‭; that‭ ye might learn‭‭ in‭ us‭ not‭ to think‭‭ [of men] above‭ that‭ which‭ is written‭‭, that no‭ one‭ of you be puffed up‭‭ for‭ one‭ against‭ another‭.",
    "‭For‭ who‭ maketh‭‭ thee‭ to differ‭‭ [from another]? and‭ what‭ hast thou‭‭ that‭ thou didst‭‭ not‭ receive‭‭?‭ now if‭ thou didst receive‭‭ [it], why‭ dost thou glory‭‭, as‭ if thou hadst‭‭ not‭ received‭‭ [it]?",
    "‭Now‭ ye are‭‭ full‭‭, now‭ ye are rich‭‭, ye have reigned as kings‭‭ without‭ us‭: and‭ I would to God‭‭ ye did reign‭‭, that‭ we‭ also‭ might reign with‭‭ you‭.",
    "‭For‭ I think‭‭ that‭ God‭ hath set forth‭‭ us‭ the apostles‭ last‭, as‭ it were appointed to death‭: for‭ we are made‭‭ a spectacle‭ unto the world‭, and‭ to angels‭, and‭ to men‭.",
    "‭We‭ [are] fools‭ for‭‭ Christ’s‭ sake‭, but‭ ye‭ [are] wise‭ in‭ Christ‭; we‭ [are] weak‭, but‭ ye‭ [are] strong‭; ye‭ [are] honourable‭, but‭ we‭ [are] despised‭.",
    "‭Even‭ unto this present‭ hour‭ we‭‭ both‭ hunger‭‭, and‭ thirst‭‭, and‭ are naked‭‭, and‭ are buffeted‭‭, and‭ have no certain dwellingplace‭‭;",
    "‭And‭ labour‭‭, working‭‭ with our own‭ hands‭: being reviled‭‭, we bless‭‭; being persecuted‭‭, we suffer it‭‭:",
    "‭Being defamed‭‭, we intreat‭‭: we are made‭‭ as‭ the filth‭ of the world‭, [and are] the offscouring‭ of all things‭ unto‭ this day‭.",
    "‭I write‭‭ not‭ these things‭ to shame‭‭ you‭, but‭ as‭ my‭ beloved‭ sons‭ I warn‭‭ [you].",
    "‭For‭ though‭ ye have‭‭ ten thousand‭ instructors‭ in‭ Christ‭, yet‭ [have ye] not‭ many‭ fathers‭: for‭ in‭ Christ‭ Jesus‭ I‭ have begotten‭‭ you‭ through‭ the gospel‭.",
    "‭Wherefore‭ I beseech‭‭ you‭, be ye‭‭ followers‭ of me‭.",
    "‭For‭‭ this‭ cause‭ have I sent‭‭ unto you‭ Timotheus‭, who‭ is‭‭ my‭ beloved‭ son‭, and‭ faithful‭ in‭ the Lord‭, who‭ shall bring‭‭ you‭ into remembrance‭‭ of my‭ ways‭ which‭ be in‭ Christ‭, as‭ I teach‭‭ every where‭ in‭ every‭ church‭.",
    "‭Now‭ some‭ are puffed up‭‭, as though‭ I‭ would‭‭ not‭ come‭‭ to‭ you‭.",
    "‭But‭ I will come‭‭ to‭ you‭ shortly‭, if‭ the Lord‭ will‭‭, and‭ will know‭‭, not‭ the speech‭ of them which are puffed up‭‭, but‭ the power‭.",
    "‭For‭ the kingdom‭ of God‭ [is] not‭ in‭ word‭, but‭ in‭ power‭.",
    "‭What‭ will ye‭‭? shall I come‭‭ unto‭ you‭ with‭ a rod‭, or‭ in‭ love‭, and‭ [in] the spirit‭ of meekness‭?"
] as [String]
let iCor5 =  [] as [String]
let iCor6 =  [] as [String]
let iCor7 =  [] as [String]
let iCor8 =  [] as [String]
let iCor9 =  [] as [String]
let iCor10 = [] as [String]
let iCor11 = [] as [String]
let iCor12 = [] as [String]
let iCor13 = [] as [String]
let iCor14 = [] as [String]
let iCor15 = [] as [String]
let iCor16 = [] as [String]

let iCor1Q  = ["1","5","10","15","20","25","30","31","55"] as [String]
let iCor2Q  = ["1","2","3","5","8","13","21","34","55"] as [String]
let iCor3Q  = ["1","2","3","5","8","13","21","34","55"] as [String]
let iCor4Q  = ["1","2","3","5","8","13","21","34","55"] as [String]
let iCor5Q  = ["1","2","3","5","8","13","21","34","55"] as [String]
let iCor6Q  = ["1","2","3","5","8","13","21","34","55"] as [String]
let iCor7Q  = ["1","2","3","5","8","13","21","34","55"] as [String]
let iCor8Q  = ["1","2","3","5","8","13","21","34","55"] as [String]
let iCor9Q  = ["1","2","3","5","8","13","21","34","55"] as [String]
let iCor10Q = ["1","2","3","5","8","13","21","34","55"] as [String]
let iCor11Q = ["1","2","3","5","8","13","21","34","55"] as [String]
let iCor12Q = ["1","2","3","5","8","13","21","34","55"] as [String]
let iCor13Q = ["1","2","3","5","8","13","21","34","55"] as [String]
let iCor14Q = ["1","2","3","5","8","13","21","34","55"] as [String]
let iCor15Q = ["1","2","3","5","8","13","21","34","55"] as [String]
let iCor16Q = ["1","2","3","5","8","13","21","34","55"] as [String]


let ICor = [
    [iCor1, iCor1Q ],
    [iCor2, iCor2Q ],
    [iCor3, iCor3Q ],
    [iCor4, iCor4Q ],
    [iCor5, iCor5Q ],
    [iCor6, iCor6Q ],
    [iCor7, iCor7Q ],
    [iCor8, iCor8Q ],
    [iCor9, iCor9Q ],
    [iCor10,iCor10Q],
    [iCor11,iCor11Q],
    [iCor12,iCor12Q],
    [iCor13,iCor13Q],
    [iCor14,iCor14Q],
    [iCor15,iCor15Q],
    [iCor16,iCor16Q]
] as [Array<Array<String>>]

import SwiftUI


struct TextView: View {
    @EnvironmentObject var appState: AppState
    //    @ObservedObject public var acts = ACTS()
    @State var selection = 0
    
    var body: some View {
        VStack {
            Button {
                appState.UiState = 1
            } label: {
                Text("Go Back")
            }
            ScrollView {
                HStack {
                    //Text("Acts 1").font(.title).fontWeight(.semibold).multilineTextAlignment(.leading).padding(.bottom)
                    Picker("Chapter Picker", selection: $selection) {
                        Group {
                            Text("I Corinthians 1 ").tag(0)
                            Text("I Corinthians 2 ").tag(1)
                            Text("I Corinthians 3 ").tag(2)
                            Text("I Corinthians 4 ").tag(3)
                            Text("I Corinthians 5 ").tag(4)
                            Text("I Corinthians 6 ").tag(5)
                            Text("I Corinthians 7 ").tag(6)
                            Text("I Corinthians 8 ").tag(7)
                            Text("I Corinthians 9 ").tag(8)
                            Text("I Corinthians 10").tag(9)
                        }
                        Group {
                            Text("I Corinthians 11").tag(10)
                            Text("I Corinthians 12").tag(11)
                            Text("I Corinthians 13").tag(12)
                            Text("I Corinthians 14").tag(13)
                            Text("I Corinthians 15").font(.title).fontWeight(.semibold).multilineTextAlignment(.leading).padding(.bottom).tag(27).tag(14)
                        }
                    }.foregroundColor(Color.red)
                }
                VStack(alignment: .leading){
                    ForEach(Range(0...((ICor[selection][0]).count-1)), id: \.self) { i in
                        HStack {
                            VStack {
                                if (ICor[selection][1].contains(String(i+1))) {
                                    Text("\(i+1) ")
                                        .fontWeight(.bold)
                                        .foregroundColor(Color.orange)
                                        
                                }
                                else {
                                    Text("\(i+1) ")
                                }
                                
                                Spacer()
                            }
                            Text(ICor[0][0][i])
                        }
                        .padding(.bottom, 2.0)
                    }
                }
            }
        }
    }
}

struct ActsView_Previews: PreviewProvider {
    static var previews: some View {
        TextView()
    }
}

/**
 
 ForEach() {
        HStack() {
                        
        }
 
 }
 
 */
