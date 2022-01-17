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
        VStack {
            Spacer()
            Button {
                appState.UiState = 0
            } label: {
                HStack{
                    Spacer()
                    ZStack {
                        Rectangle()
                            .fill(Color("buttonColor"))
                            .cornerRadius(5)
                        Text("Go back to start (still under development").foregroundColor(Color("textPri"))
                    }.frame(width: 200, height: 100, alignment: .center)
                    Spacer()
                }
            }
            Spacer()
        }.background(Color("background"))
    }
}

struct connectBoxView_Previews: PreviewProvider {
    static var previews: some View {
        connectBoxView()
    }
}
