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
    @StateObject var appState = AppState(hasOnboarded: 0, isTesting: 0)
    var body: some Scene {
        WindowGroup {
            switch appState.UiState {
                case 0:
                    OnboardingView()
                        .environmentObject(appState)
                case 1:
                    mainQuizMaster()
                        .environmentObject(appState)
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
                
                default:
                    exit(1)
            }
            
        }
    }
}
