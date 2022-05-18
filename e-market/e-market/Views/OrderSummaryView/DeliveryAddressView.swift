//
//  DeliveryAddressView.swift
//  e-market
//
//  Created by Phonthep Aungkanukulwit on 18/5/2565 BE.
//

import SwiftUI

struct DeliveryAddressView: View {
  @State var deliveryAddress: String = ""
  
    var body: some View {
      VStack(alignment: .leading, spacing: 16) {
        Text("Delivery Address:")
          .font(.system(size: 16))
          .fontWeight(.bold)
          .lineLimit(0)
          .foregroundColor(.gray)
        Text("\(deliveryAddress)")
          .font(.system(size: 14))
          .fontWeight(.bold)
          .lineLimit(0)
          .foregroundColor(.gray)
        TextField("Please fill delivery address", text: $deliveryAddress)
          .textFieldStyle(.plain)
          .lineLimit(0)
      }
    }
}

struct DeliveryAddressView_Previews: PreviewProvider {
    static var previews: some View {
        DeliveryAddressView()
        .padding()
    }
}
