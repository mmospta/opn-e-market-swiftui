//
//  SummaryView.swift
//  e-market
//
//  Created by Phonthep Aungkanukulwit on 18/5/2565 BE.
//

import SwiftUI

struct SummaryView: View {
  
    var body: some View {
      VStack(spacing: 20) {
        HStack {
          Text("Total")
            .font(.system(size: 18))
            .fontWeight(.bold)
            .foregroundColor(.black)
          Spacer()
          Text("$ 80")
            .font(.system(size: 18))
            .fontWeight(.bold)
            .foregroundColor(.black)
        }
        
        Button {
          print("Checkout")
        } label: {
          Text("Checkout")
            .font(.system(size: 18))
            .fontWeight(.semibold)
            .foregroundColor(.white)
          
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(.blue)
        .cornerRadius(8)
      }
    }
}

struct SummaryView_Previews: PreviewProvider {
    static var previews: some View {
        SummaryView()
        .padding()
    }
}
