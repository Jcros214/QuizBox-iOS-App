//
//  OnboardingFlowView.swift
//  test
//
//  Created by Jonathan Crosby on 12/21/21.
//

import SwiftUI

struct OnboardingView: View {
    @EnvironmentObject var appState: AppState
    var body: some View {
        TabView {
            VStack {
                Spacer()
                Spacer()
                Spacer()
                Text("Welcome!")
                Spacer()
                Text("To get started, swipe left.")
                Spacer()
                Spacer()
                Spacer()
                
            }
            VStack {
                Spacer()
                Spacer()
                Spacer()
                Button {
                    appState.UiState = 2 // change
                } label: {
                Text("Setup New QuizBox")
                    
            }
                Spacer()
                Button {
                    appState.UiState = 3 // change
                } label: {
                Text("Connect to QuizBox")
            }
                Spacer()
                Spacer()
                Spacer()
            }
            Button("Test UI without QuizBox connected") {
                appState.UiState = 1 // change
            }
        }
        .tabViewStyle(.page)
        .indexViewStyle(.page(backgroundDisplayMode: .always))
    }
}

struct OnboardingFlowView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
