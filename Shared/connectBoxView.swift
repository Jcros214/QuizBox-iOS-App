//
//  connectBoxView.swift
//  QuizBox
//
//  Created by Jonathan Crosby on 12/21/21.
//

import SwiftUI

struct connectBoxView: View {
    @EnvironmentObject var appState: AppState
    var body: some View {
        Button {
            appState.UiState = 0
        } label: {
            Text("Go Back (Still under development)")
        }
    }
}

struct connectBoxView_Previews: PreviewProvider {
    static var previews: some View {
        connectBoxView()
    }
}
