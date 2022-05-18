//
//  SummaryView.swift
//  e-market
//
//  Created by Phonthep Aungkanukulwit on 18/5/2565 BE.
//

import SwiftUI

struct SummaryView: View {
  @EnvironmentObject var viewModel: OrderSummaryViewModel
  @Binding var rootIsActive : Bool
  @State var isActive = false
  
  var body: some View {
    VStack(spacing: 20) {
      HStack {
        Text("Total")
          .font(.system(size: 18))
          .fontWeight(.bold)
          .foregroundColor(.black)
        Spacer()
        Text("$ \(viewModel.total)")
          .font(.system(size: 18))
          .fontWeight(.bold)
          .foregroundColor(.black)
      }
      
      NavigationLink(isActive: $isActive) {
        OrderSuccessView(shouldPopToRootView: $rootIsActive)
      } label: {
        Button {
          viewModel.checkout()
          isActive = true
        } label: {
          HStack {
            Spacer()
            Text("Checkout")
              .font(.system(size: 18))
              .fontWeight(.semibold)
              .foregroundColor(.white)
            Spacer()
          }
        }
      }
      .disabled(viewModel.isDisableBtn)
      .padding()
      .frame(maxWidth: .infinity)
      .background(Style.Colors.textBrown)
      .cornerRadius(8)
    }
  }
}

struct SummaryView_Previews: PreviewProvider {
  static var previews: some View {
    SummaryView(rootIsActive: .constant(false))
      .padding()
  }
}
