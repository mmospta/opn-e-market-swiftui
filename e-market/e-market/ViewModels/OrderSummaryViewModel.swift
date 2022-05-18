//
//  OrderSummaryViewModel.swift
//  e-market
//
//  Created by Phonthep Aungkanukulwit on 18/5/2565 BE.
//

import Foundation

class OrderSummaryViewModel: ObservableObject {
  @Published var selectedProduct: [SelectedProduct] = []
  @Published var isDisableBtn: Bool = true
  @Published var total: Int = 0
  
  var deliveryAddress: String = ""
  var products: [Product] = []
  
  func checkout() {
    guard !selectedProduct.isEmpty, !deliveryAddress.isEmpty else { return }

    for selected in selectedProduct {
      products.append(selected.product)
    }
    let order: Order = Order(products: products, deliveryAddress: deliveryAddress)
    postOrder(order: order)
  }
  
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
  
  func deliveryAddress(address: String) {
    if address.count < 10 {
      deliveryAddress = ""
      isDisableBtn = true
    } else {
      deliveryAddress = address
      isDisableBtn = false
    }
    print(deliveryAddress)
  }
  
  func calculateRowTotalPrice() {
    
    
  }
  
  
  func calculateTotalPrice() {
    
  }
  
  
}
