//
//  OrderSummaryView.swift
//  e-market
//
//  Created by Phonthep Aungkanukulwit on 18/5/2565 BE.
//

import SwiftUI

struct OrderSummaryView: View {
  @EnvironmentObject var viewModel: OrderSummaryViewModel
  @Binding var rootIsActive : Bool
  var selectedProduct: [SelectedProduct] = []
  
  var body: some View {
      List {
        Section {
          ForEach(viewModel.selectedProduct, id: \.id) { selectedProduct in
            CartRow(selectedProduct: selectedProduct)
          }
        }
        
        Section {
          DeliveryAddressView()
        }
        
        Section {
          SummaryView(rootIsActive: $rootIsActive)
            .listRowBackground(Color.clear)
        }
        .buttonStyle(.plain)
        .listRowSeparator(.hidden)
      }
      .buttonStyle(.plain)
      .listStyle(.plain)
      .navigationTitle("Order summary")
      .padding(.vertical)
      .onAppear {
        viewModel.selectedProduct = selectedProduct
      }
    }
}

struct OrderSummaryView_Previews: PreviewProvider {
  static var previews: some View {
    OrderSummaryView(rootIsActive: .constant(false))
      .environmentObject(OrderSummaryViewModel())
  }
}
