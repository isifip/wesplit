//
//  ContentView.swift
//  weshouldsplit
//
//  Created by Irakli Sokhaneishvili on 16.01.22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var checkAmount = Double(0)
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    
    let tipPercentages = [10, 15, 20, 25]
    
    let localCurrency: FloatingPointFormatStyle<Double>.Currency = .currency(code: Locale.current.currencyCode ?? "USD")
    
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
                    Text("Split")
                        .foregroundColor(.white)
                        .font(.title)
                        .fontWeight(.black)
                    Spacer()
                    Button {
                        // more code to come
                    } label: {
                        ButtonLabelView(systemName: "arrow.counterclockwise")
                    }
                    .padding(.trailing)
                }
                VStack {
                    TextField("Amount", value: $checkAmount, format: localCurrency)
                        .padding()
                        .frame(height: 50)
                        .background(.ultraThinMaterial)
                        .cornerRadius(34)
                        .padding()
                        .shadow(radius: 20)
                        .keyboardType(.decimalPad)
                    Divider()
                }
                VStack {
                    HStack {
                        Text("Split between")
                        Spacer()
                        Picker("Number of people", selection: $numberOfPeople) {
                            ForEach(2..<11) {
                                Text("\($0) people")
                            }
                        }
                        .pickerStyle(.menu)
                    }
                    .padding([.horizontal, .top])
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(tipPercentages, id: \.self) {
                            Text($0, format: .percent)
                        }
                    }
                    .padding()
                    .pickerStyle(.segmented)
                }
                .frame(maxWidth: .infinity)
                .frame(height: 120)
                .background(.ultraThinMaterial)
                .cornerRadius(34)
                .padding()
                .shadow(radius: 20)
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
