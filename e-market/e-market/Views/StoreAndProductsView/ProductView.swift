//
//  ProductView.swift
//  e-market
//
//  Created by Phonthep Aungkanukulwit on 18/5/2565 BE.
//

import SwiftUI

struct ProductView: View {
  let product: Product
  
  var body: some View {
    HStack(spacing: 12) {
      Image(systemName: "checkmark.square")
        .resizable()
        .frame(width: 16, height: 16)
        .foregroundColor(Style.Colors.grayb)
      
      AsyncImage(url: URL(string: product.imageUrl)) { image in
        image
          .resizable()
          .scaledToFill()
      } placeholder: {
        ProgressView()
      }
      .frame(width: 80, height: 80)
      .cornerRadius(8)
      
      VStack(alignment: .leading, spacing: 8) {
        Text(product.name)
          .font(.system(size: 18))
          .fontWeight(.bold)
          .lineLimit(2)
          .foregroundColor(Style.Colors.textBlack)
        Text("$ \(product.price)")
          .font(.system(size: 16))
          .fontWeight(.bold)
          .foregroundColor(Style.Colors.textGray)
      }
      
      Spacer()
      
      HStack {
        Button {
          print("-")
        } label: {
          Image(systemName: "minus.circle.fill")
            .foregroundColor(Style.Colors.textBrown)
        }
        
        Text("0")
        
        Button {
          print("+")
        } label: {
          Image(systemName: "plus.circle.fill")
            .foregroundColor(Style.Colors.textBrown)
        }
        
      }
    }
    .padding()
    .cornerRadius(10)
  }
}

struct ProductView_Previews: PreviewProvider {
  static var previews: some View {
    ProductView(product: Product(name: "Dark", price: 100, imageUrl: "https://www.nespresso.com/shared_res/mos/free_html/sg/b2b/b2ccoffeerecipes/listing-image/image/dark-tiramisu-mocha.jpg"))
      .previewLayout(.fixed(width: 600, height: 160))
  }
}
