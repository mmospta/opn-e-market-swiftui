//
//  OrderSummaryViewModel.swift
//  e-market
//
//  Created by Phonthep Aungkanukulwit on 18/5/2565 BE.
//

import Foundation

class OrderSummaryViewModel: ObservableObject {
  @Published var products: [Product] = []
  @Published var selectedProduct: [SelectedProduct] = []
  
  func postOrder(order: Order) {
    NetworkManager.shared.postOrder(order: order) { result in
      switch result {
      case .success():
        print("success")
      case .failure(let error):
        print(error)
      }
    }
  }
  
  
}
