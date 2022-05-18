//
//  CartRow.swift
//  e-market
//
//  Created by Phonthep Aungkanukulwit on 18/5/2565 BE.
//

import SwiftUI

struct CartRow: View {
    var body: some View {
      HStack(spacing: 16) {
        AsyncImage(url: URL(string: "https://www.nespresso.com/ncp/res/uploads/recipes/nespresso-recipes-Latte-Art-Tulip.jpg")) { image in
          image
            .resizable()
            .scaledToFill()
        } placeholder: {
          ProgressView()
        }
        .frame(width: 80, height: 80)
        .cornerRadius(8)
        
        HStack(alignment: .top) {
          VStack(alignment: .leading, spacing: 8) {
            Text("Latte")
              .font(.system(size: 18))
              .fontWeight(.bold)
              .lineLimit(2)
              .foregroundColor(.black)
            Text("Price: $80")
              .font(.system(size: 14))
              .fontWeight(.bold)
              .foregroundColor(.gray)
            Text("QTY: 1")
              .font(.system(size: 14))
              .fontWeight(.bold)
              .foregroundColor(.gray)
          }
          
          Spacer()
          
          Text("$80")
            .font(.system(size: 18))
            .fontWeight(.bold)
            .foregroundColor(.black)
        }
      }
    }
}

struct CartRow_Previews: PreviewProvider {
    static var previews: some View {
        CartRow()
        .padding()
    }
}
