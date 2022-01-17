//
//  OnboardingFlowView.swift
//  test
//
//  Created by Jonathan Crosby on 12/21/21.
//
import SwiftUI
struct OnboardingView: View {
    @EnvironmentObject var appState: AppState
    @ObservedObject public var quiz = quizStuff(leftName: "left", leftColor: .mint, rightName: "right", rightColor: .cyan)
    var body: some View {
        TabView {
            VStack {
                Spacer()
                ZStack{
                    Rectangle()
                        .fill(Color("blobColor"))
                        .cornerRadius(0)
                        .frame(width: 200, height: 100, alignment: .center)
                    Text("Welcome!").foregroundColor(Color("textPri"))
                }
                Spacer()
                ZStack{
                    Rectangle()
                        .fill(Color("blobColor"))
                        .cornerRadius(0)
                        .frame(width: 300, height: 100, alignment: .center)
                    Text("To get started, swipe left.").foregroundColor(Color("textPri"))
                }
                Spacer()
                
            }
            VStack {
                Spacer ()
                Button {
                    appState.UiState = 2 // change
                } label: {
                    ZStack {
                        Rectangle()
                            .fill(Color("buttonColor"))
                            .cornerRadius(5)
                        Text("Setup New QuizBox").foregroundColor(Color("textPri"))
                    }.frame(width: 200, height: 100, alignment: .center)
                } //Setup New QuizBox
                Spacer ()
                Button {
                    appState.UiState = 3 // change
                } label: {
                    ZStack {
                        Rectangle()
                            .fill(Color("buttonColor"))
                            .cornerRadius(5)
                        Text("Connect to QuizBox").foregroundColor(Color("textPri"))
                    }.frame(width: 200, height: 100, alignment: .center)
                } //Connect to QuizBox
                Spacer ()
                Button {
                    appState.UiState = 1
                    appState.UiTestState = 1
                    
                } label: {
                    ZStack {
                        Rectangle()
                            .fill(Color("buttonColor"))
                            .cornerRadius(5)
                        Text("Test UI without QuizBox connected").foregroundColor(Color("textPri"))
                    }.frame(width: 200, height: 100, alignment: .center)
                } //UI Test
                Spacer ()
                Button {
                    appState.UiState = 6
                    appState.UiTestState = 0
                    
                } label: {
                    ZStack {
                        Rectangle()
                            .fill(Color("buttonColor"))
                            .cornerRadius(5)
                        Text("Team Setup").foregroundColor(Color("textPri"))
                    }.frame(width: 200, height: 100, alignment: .center)
                } //Team Setup
                Spacer ()
            }
        }
        .tabViewStyle(.page)
        .indexViewStyle(.page(backgroundDisplayMode: .always))
        .background(Color("background"))
    }
}

struct OnboardingFlowView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
