//
//  OrderSummaryView.swift
//  e-market
//
//  Created by Phonthep Aungkanukulwit on 18/5/2565 BE.
//

import SwiftUI

struct SelectProduct {
  let id: UUID
  let product: Product
  let quantity: Int
}

struct OrderSummaryView: View {
  @EnvironmentObject var viewModel: OrderSummaryViewModel
  
  let selectProduct = [SelectProduct(id: UUID(), product: Product(name: "Latte", price: 50, imageUrl: "https://www.nespresso.com/ncp/res/uploads/recipes/nespresso-recipes-Latte-Art-Tulip.jpg"), quantity: 2),
                       SelectProduct(id: UUID(), product: Product(name: "Dark Tiramisu Mocha", price: 75, imageUrl: "https://www.nespresso.com/shared_res/mos/free_html/sg/b2b/b2ccoffeerecipes/listing-image/image/dark-tiramisu-mocha.jpg"), quantity: 5)
  ]
  
  var body: some View {
      VStack {
        Text("Order summary")
        List {
          
          Section {
            ForEach(selectProduct, id: \.id) { product in
              CartRow()
            }
          }
          
          Section {
            DeliveryAddressView()
          }
          
          Section {
            SummaryView()
          }
          .listRowSeparator(.hidden)
          

        }
        .listStyle(.inset)
      }
  }
}

struct OrderSummaryView_Previews: PreviewProvider {
  static var previews: some View {
    OrderSummaryView()
      .environmentObject(OrderSummaryViewModel())
  }
}
