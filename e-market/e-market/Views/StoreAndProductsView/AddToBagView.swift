//
//  AddToBagView.swift
//  e-market
//
//  Created by Phonthep Aungkanukulwit on 18/5/2565 BE.
//

import SwiftUI

struct AddToBagView: View {
  @EnvironmentObject var viewModel: StoreAndProductsViewModel
  @Binding var isActive: Bool
  
  var body: some View {
    NavigationLink(isActive: $isActive) {
      OrderSummaryView(rootIsActive: $isActive, cart: viewModel.cart)
        .environmentObject(OrderSummaryViewModel())
    } label: {
      HStack(spacing: 8) {
        Text("ADD TO BAG")
          .font(.system(size: 20))
          .fontWeight(.semibold)
        Divider()
          .background(.white)
        Text("$ \(viewModel.totalPrice)")
          .font(.system(size: 20))
          .fontWeight(.semibold)
      }
    }
    .disabled(viewModel.isDisableBtn)
    .foregroundColor(Color.white)
    .padding()
    .frame(maxWidth: .infinity)
    .background(LinearGradient(gradient: Gradient(colors: [Style.Colors.gradientBlack!, Style.Colors.gradientGray!]), startPoint: .leading, endPoint: .trailing))
    .cornerRadius(10)
  }
}

struct AddToBagView_Previews: PreviewProvider {
  static var previews: some View {
    AddToBagView(isActive: .constant(false))
  }
}
