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
    init(hasOnboarded: Int) {
        self.UiState = hasOnboarded
    }
}

@main
struct QuizBoxApp: App {
    @StateObject var appState = AppState(hasOnboarded: 0)
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
                default:
                    exit(1)
            }
            
        }
    }
}
