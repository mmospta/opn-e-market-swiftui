//
//  OrderSuccessView.swift
//  e-market
//
//  Created by Phonthep Aungkanukulwit on 18/5/2565 BE.
//

import SwiftUI

struct OrderSuccessView: View {
//  @Environment(\.presentationMode) var mode: Binding<PresentationMode>
  @Binding var shouldPopToRootView : Bool
  
  var body: some View {
    VStack {
      Text("Order success")
        .font(.system(size: 24))
        .fontWeight(.bold)
      Image(systemName: "shippingbox.circle.fill")
        .resizable()
        .aspectRatio(contentMode: .fit)
        .frame(width: 100)
        .foregroundColor(.brown)
      Button {
        self.shouldPopToRootView = false
        print("back")
//        self.mode.wrappedValue.dismiss()
      } label: {
        Text("back to home")
      }
      .navigationBarBackButtonHidden(true)
    }
  }
}

struct OrderSuccessView_Previews: PreviewProvider {
  static var previews: some View {
    OrderSuccessView(shouldPopToRootView: .constant(false))
  }
}
