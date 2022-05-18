//
//  SummaryView.swift
//  e-market
//
//  Created by Phonthep Aungkanukulwit on 18/5/2565 BE.
//

import SwiftUI

struct SummaryView: View {
  @Binding var rootIsActive : Bool
  
  var body: some View {
    VStack(spacing: 20) {
      HStack {
        Text("Total")
          .font(.system(size: 18))
          .fontWeight(.bold)
          .foregroundColor(.black)
        Spacer()
        Text("$ 80")
          .font(.system(size: 18))
          .fontWeight(.bold)
          .foregroundColor(.black)
      }
      
      NavigationLink {
        OrderSuccessView(shouldPopToRootView: $rootIsActive)
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
      //        .disabled(true)
      .padding()
      .frame(maxWidth: .infinity)
      .background(.blue)
      .cornerRadius(8)
      
      //        Button {
      //          print("Checkout")
      
      //          self.mode.wrappedValue.dismiss()
      //        } label: {
      //          Text("Checkout")
      //            .font(.system(size: 18))
      //            .fontWeight(.semibold)
      //            .foregroundColor(.white)
      //
      //        }
      //        .padding()
      //        .frame(maxWidth: .infinity)
      //        .background(.blue)
      //        .cornerRadius(8)
    }
  }
}

struct SummaryView_Previews: PreviewProvider {
  static var previews: some View {
    SummaryView(rootIsActive: .constant(false))
      .padding()
  }
}
