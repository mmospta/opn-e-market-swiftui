//
//  ProductView.swift
//  e-market
//
//  Created by Phonthep Aungkanukulwit on 18/5/2565 BE.
//

import SwiftUI

struct ProductView: View {
  @EnvironmentObject var viewModel: StoreAndProductsViewModel
  @State private var counter: Int = 1
  @State private var isSelect = false
  
  let product: Product
  
  var body: some View {
    HStack(spacing: 12) {
      Toggle("", isOn: $isSelect)
        .onChange(of: isSelect) { newValue in
          viewModel.selectedOrderCheckBox(isSelect: newValue, product: product, quantity: counter)
        }
        .labelsHidden()
        .toggleStyle(CheckboxToggleStyle())
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
          .lineLimit(3)
          .foregroundColor(Style.Colors.textBlack)
        Text("$ \(product.price)")
          .font(.system(size: 16))
          .fontWeight(.bold)
          .foregroundColor(Style.Colors.textGray)
      }
      
      Spacer()
      
      HStack(spacing: 12) {
        Button {
          print("-")
          if counter > 1 {
            counter -= 1
            viewModel.changeQuantity(isSelect: isSelect, product: product, quantity: counter)
          }
        } label: {
          Image(systemName: "minus.circle.fill")
            .resizable()
            .frame(width: 24, height: 24)
            .foregroundColor(Style.Colors.textBrown)
        }
        
        Text("\(counter)")
          .font(.system(size: 18))
          .fontWeight(.semibold)
          .foregroundColor(Style.Colors.gradientGray)
          .frame(width: 30)
        
        Button {
          print("+")
          if counter < 100 {
            counter += 1
            viewModel.changeQuantity(isSelect: isSelect, product: product, quantity: counter)
          }
        } label: {
          Image(systemName: "plus.circle.fill")
            .resizable()
            .frame(width: 24, height: 24)
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
