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
                    totalAmountView
                    VStack(spacing: 0) {
                        HStack {
                            Text("Total per person")
                                .font(.title3).fontWeight(.semibold)
                            Spacer()
                        }
                        .padding([.horizontal, .top], 10)
                        HStack {
                            VStack(alignment: .leading) {
                                Text(totalPerPerson, format: localCurrency)
                                    .font(.title2).fontWeight(.black)
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 10)
                            Divider()
                            Spacer()
                            VStack(alignment: .leading) {
                                Text(personTip, format: localCurrency)
                                    .font(.subheadline)
                                    .fontWeight(.semibold)
                                Text("Tip value".uppercased())
                                    .font(.body)
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 10)
                        }
                        .frame(height: 70)
                        Spacer()
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 100)
                    .background(.ultraThinMaterial)
                    .cornerRadius(12)
                    .shadow(radius: 20)
                }
                .padding(.top)
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}

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
                checkAmount = Double(0)
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
    
    var totalAmountView: some View {
        VStack(spacing: 0) {
            HStack {
                Text("Total Amount")
                    .font(.title3).fontWeight(.semibold)
                Spacer()
            }
            .padding([.horizontal, .top], 10)
            HStack {
                VStack(alignment: .leading) {
                    Text(totalAmount, format: localCurrency)
                        .font(.title2).fontWeight(.black)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 10)
                Divider()
                Spacer()
                VStack(alignment: .leading) {
                    Text(totalTip, format: localCurrency)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                    Text("Tip value".uppercased())
                        .font(.body)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 10)
            }
            .frame(height: 70)
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .frame(height: 100)
        .background(.ultraThinMaterial)
        .cornerRadius(12)
        .shadow(radius: 20)
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
