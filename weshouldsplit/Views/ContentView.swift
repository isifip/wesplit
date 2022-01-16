//
//  ContentView.swift
//  weshouldsplit
//
//  Created by Irakli Sokhaneishvili on 16.01.22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var checkAmount: Double = Double(0)
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    
    @FocusState private var amountIsFocused: Bool
    
    let tipPercentages = [5, 10, 15, 20, 25, 30, 40, 50]
    
    let localCurrency: FloatingPointFormatStyle<Double>.Currency = .currency(code: Locale.current.currencyCode ?? "USD")
    
    var totalAmount: Double {
        let tipSelection = Double(tipPercentage)
        let tipValue = checkAmount / 100 * tipSelection
        let grandTotal = checkAmount + tipValue
        return grandTotal
    }
    
    var totalTip: Double {
        let tipSelection = Double(tipPercentage)
        let tipValue = checkAmount / 100 * tipSelection
        return tipValue
    }
    
    var personTip: Double {
        let tipperperson = totalTip / Double(numberOfPeople + 2)
        return tipperperson
    }
    
    var totalPerPerson: Double {
        // Calculate the total per person here
        let peopleCount = Double(numberOfPeople + 2)
        let amountPerPerson = totalAmount / peopleCount
        
        return amountPerPerson
    }
    
    var body: some View {
        ZStack(alignment: .top) {
            Image("background")
                .resizable()
                .scaleEffect(2)
            VStack {
                HStack {
                    buttons
                }
                textField
                picker
                Divider()
                VStack(spacing: 20) {
                    SummaryHeaderView(header: "Total Amount", amount: totalAmount, tipAmount: totalTip)
                    SummaryHeaderView(header: "Total Per Person", amount: totalPerPerson, tipAmount: personTip)
                }
                .padding(.top)
            }
            .padding()
        }
        .toolbar {
            ToolbarItemGroup(placement: .keyboard) {
                Spacer()
                Button {
                    amountIsFocused = false
                } label: {
                    Text("Done")
                }
            }
        }
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//            .preferredColorScheme(.dark)
//    }
//}

extension ContentView {
    var textField: some View {
        VStack {
            TextField("Amount", value: $checkAmount, format: localCurrency)
                .padding()
                .frame(height: 50)
                .background(.ultraThinMaterial)
                .cornerRadius(12)
                .padding(.bottom)
                .shadow(radius: 20)
                .keyboardType(.decimalPad)
                .focused($amountIsFocused)
            Divider()
        }
    }
    
    var buttons: some View {
        HStack {
            Button {
                // more code to come
            } label: {
                ButtonLabelView(systemName: "paintbrush")
            }
            Spacer()
            Text("Split")
                .foregroundColor(.white)
                .font(.title)
                .fontWeight(.black)
            Spacer()
            Button {
                withAnimation {
                    checkAmount = Double(0)
                }
            } label: {
                ButtonLabelView(systemName: "arrow.counterclockwise")
            }
        }
    }
    
    var picker: some View {
        VStack {
            HStack {
                Text("Split between")
                    .padding(.leading, 5)
                Spacer()
                Picker("Number of people", selection: $numberOfPeople) {
                    ForEach(2..<11) {
                        Text("\($0) people")
                    }
                }
                .padding(.horizontal)
                .frame(width: 100)
                .background(.ultraThinMaterial)
                .cornerRadius(12)
                .shadow(radius: 20)
            }
            .padding(.vertical)
            Divider()
            HStack {
                Text("Select tip percentage")
                    .padding(.leading, 5)
                Spacer()
                Picker("Tip percentage", selection: $tipPercentage) {
                    ForEach(tipPercentages, id: \.self) {
                        Text($0, format: .percent)
                    }
                }
                .padding(.horizontal)
                .frame(width: 100)
                .background(.ultraThinMaterial)
                .cornerRadius(12)
                .shadow(radius: 20)
                
            }
            .padding(.vertical)
            //.pickerStyle(.segmented)
        }
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

