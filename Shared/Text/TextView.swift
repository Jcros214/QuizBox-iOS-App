//
//  ActsView.swift
//  QuizBox
//
//  Created by Jonathan Crosby on 12/21/21.
//

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
            } //back
            ScrollView {
                HStack {
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
                } //Chapter Picker
                VStack(alignment: .leading){
                    ForEach(Range(0...((ICorTEXT[selection]).count-1)), id: \.self) { i in
                        HStack {
                            VStack {
//                                if (ICorTEXT[selection][1].contains(String(i+1))) {
//                                    ZStack {
//                                        Circle()
//                                            .fill(Color("AccentColor"))
//                                            .frame(width: 30, height: 30, alignment: .center)
//                                        Text("\(i+1) ")
//                                            .fontWeight(.bold)
//                                            .foregroundColor(Color("buttonColor"))
//                                            .multilineTextAlignment(.center)
//                                    }
//
//                                }
//                                else {
                                Text("\(i+1) ")
                                    .foregroundColor(Color("buttonColor"))
                                    .frame(width: 30, height: 30, alignment: .center)
//                                }
                                Spacer()
                            }
                            Text(String(ICorTEXT[selection][i].string))
                                .padding(.top, 5)
                        }.padding(.bottom, 2.0) //verse
                    }
                }
            }
        }
    }
}
struct TextView_Previews: PreviewProvider {
    static var previews: some View {
        TextView()
    }
}
