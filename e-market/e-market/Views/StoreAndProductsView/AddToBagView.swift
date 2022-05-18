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
      HStack {
        Button {
          print("bag")
        } label: {
          Image(systemName: "cart.fill.badge.plus")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(height: 30)
            .foregroundColor(Style.Colors.gradientBlack)
            .padding()
            .cornerRadius(10)
            .cornerRadius(10)
            .overlay(
              RoundedRectangle(cornerRadius: 10)
                .stroke(Style.Colors.gradientBlack!, lineWidth: 2))
        }
        
        NavigationLink(isActive: $isActive) {
          OrderSummaryView(rootIsActive: $isActive, cart: viewModel.cart)
            .environmentObject(OrderSummaryViewModel())
        } label: {
          HStack {
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
}

struct AddToBagView_Previews: PreviewProvider {
    static var previews: some View {
      AddToBagView(isActive: .constant(false))
    }
}
