//
//  ContentView.swift
//  weshouldsplit
//
//  Created by Irakli Sokhaneishvili on 16.01.22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack(alignment: .top) {
            Image("background")
                .resizable()
                .scaleEffect(2)
            VStack {
                HStack {
                    Button {
                        // more code to come
                    } label: {
                        ButtonLabelView(systemName: "paintbrush")
                    }
                    .padding(.leading)
                    Spacer()
                    Button {
                        // more code to come
                    } label: {
                        ButtonLabelView(systemName: "arrow.counterclockwise")
                    }
                    .padding(.trailing)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct ButtonLabelView: View {
    var systemName: String
    var body: some View {
        Image(systemName: systemName)
            .resizable()
            .scaledToFit()
            .frame(width: 20, height: 20)
            .padding()
            .background(.ultraThinMaterial)
            .clipShape(Circle())
            .shadow(radius: 20)
            .foregroundColor(.primary)
    }
}
