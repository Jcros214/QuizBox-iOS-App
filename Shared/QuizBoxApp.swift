//
//  QuizBoxApp.swift
//  Shared
//
//  Created by Jonathan Crosby on 12/4/21.
//

import SwiftUI

// Define your observable
class AppState: ObservableObject {
    @Published var UiState: Int
    @Published var UiTestState: Int
    
    init(hasOnboarded: Int, isTesting: Int) {
        self.UiState = hasOnboarded
        self.UiTestState = isTesting
        
    }
}

@main
struct QuizBoxApp: App {
    @StateObject var appState = AppState(hasOnboarded: 1, isTesting: 1)
    @ObservedObject public var quiz = quizStuff(leftName: "left", leftColor: .mint, rightName: "right", rightColor: .cyan)
    var body: some Scene {
        WindowGroup {
            switch appState.UiState {
                case 0:
                    OnboardingView()
                        .environmentObject(appState)
                        .environmentObject(quiz)
                    
                case 1:
                    mainQuizMaster()
                        .environmentObject(appState)
                        .environmentObject(quiz)
                case 2:
                    setupBoxView()
                        .environmentObject(appState)
                case 3:
                    connectBoxView()
                        .environmentObject(appState)
                case 4:
                    ActsView()
                        .environmentObject(appState)
                case 5:
                    scoreNoQuizBox()
                        .environmentObject(appState)
                case 6:
                    teamSetup()
                        .environmentObject(appState)
                        .environmentObject(quiz)
                default:
                    exit(1)
            }
            
        }
    }
}
