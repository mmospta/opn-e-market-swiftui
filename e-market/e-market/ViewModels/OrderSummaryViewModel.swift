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
  var error = false
  
  private let networkManager: NetworkManagerProtocol
  
  init(networkManager: NetworkManagerProtocol = NetworkManager()) {
    self.networkManager = networkManager
  }
  
  func postOrder(order: Order) {
    networkManager.postOrder(order: order) { result in
      DispatchQueue.main.async {
        switch result {
        case .success():
          print("success")
        case .failure(let error):
          print(error)
        }
      }
    }
  }
  
  func checkout() {
    guard !selectedProduct.isEmpty, !deliveryAddress.isEmpty else { return }
    
    for selected in selectedProduct {
      products.append(selected.product)
    }
    
    let orderProducts = products.map { OrderProduct(name: $0.name, price: $0.price, imageUrl: $0.imageUrl) }
    let order: Order = Order(products: orderProducts, deliveryAddress: deliveryAddress)
    postOrder(order: order)
  }
  
  func deliveryAddress(address: String) {
    if address.count < 10 {
      deliveryAddress = ""
      isDisableBtn = true
    } else {
      deliveryAddress = address
      isDisableBtn = false
    }
  }
}
