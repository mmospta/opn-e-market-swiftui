//
//  CartRow.swift
//  e-market
//
//  Created by Phonthep Aungkanukulwit on 18/5/2565 BE.
//

import SwiftUI

struct CartRow: View {
  let selectedProduct: SelectedProduct
  
  var body: some View {
    HStack(spacing: 16) {
      AsyncImage(url: URL(string: selectedProduct.product.imageUrl)) { image in
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
          Text(selectedProduct.product.name)
            .font(.system(size: 18))
            .fontWeight(.bold)
            .lineLimit(2)
            .foregroundColor(.black)
          Text("Price: $\(selectedProduct.product.price)")
            .font(.system(size: 14))
            .fontWeight(.bold)
            .foregroundColor(.gray)
          Text("QTY: \(selectedProduct.quantity)")
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
    CartRow(selectedProduct: SelectedProduct(id: UUID(), product: Product(name: "Dark Tiramisu", price: 100, imageUrl: "https://www.nespresso.com/shared_res/mos/free_html/sg/b2b/b2ccoffeerecipes/listing-image/image/dark-tiramisu-mocha.jpg"), quantity: 3))
      .padding()
  }
}
