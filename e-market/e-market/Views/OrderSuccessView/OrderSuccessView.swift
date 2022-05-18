//
//  OrderSuccessView.swift
//  e-market
//
//  Created by Phonthep Aungkanukulwit on 18/5/2565 BE.
//

import SwiftUI

struct OrderSuccessView: View {
  @Binding var shouldPopToRootView : Bool
  
  var body: some View {
    VStack(spacing: 10) {
      Text("Order success")
        .font(.system(size: 26))
        .fontWeight(.bold)
        .foregroundColor(Style.Colors.dark)
      Image("delivery")
        .resizable()
        .aspectRatio(contentMode: .fit)
        .frame(width: 400)
        .foregroundColor(.brown)
      Button {
        self.shouldPopToRootView = false
      } label: {
        Text("Back To Store")
          .font(.system(size: 18))
          .fontWeight(.semibold)
          .foregroundColor(.white)
          .padding()
          .background(Style.Colors.textBrown)
          .cornerRadius(8)
      }
      .navigationBarBackButtonHidden(true)
      .padding()
    }
  }
}

struct OrderSuccessView_Previews: PreviewProvider {
  static var previews: some View {
    OrderSuccessView(shouldPopToRootView: .constant(false))
  }
}
