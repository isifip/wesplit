//
//  SummaryHeaderView.swift
//  weshouldsplit
//
//  Created by Irakli Sokhaneishvili on 16.01.22.
//

import SwiftUI

struct SummaryHeaderView: View {
    
    var header = ""
    var amount: Double
    var tipAmount: Double
    
    let localCurrency: FloatingPointFormatStyle<Double>.Currency = .currency(code: Locale.current.currencyCode ?? "USD")
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Text(header)
                    .font(.body).fontWeight(.semibold)
                Spacer()
            }
            .padding([.horizontal, .top], 10)
            HStack {
                VStack(alignment: .leading) {
                    Text(amount, format: localCurrency)
                        .font(.title2).fontWeight(.black)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 10)
                Divider()
                Spacer()
                VStack(alignment: .leading) {
                    Text(tipAmount, format: localCurrency)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                    Text("Tip value".uppercased())
                        .font(.subheadline)
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

//struct SummaryHeaderView_Previews: PreviewProvider {
//    static var previews: some View {
//        SummaryHeaderView()
//    }
//}
