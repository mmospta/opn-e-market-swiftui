//
//  StoreAndProductsViewModel.swift
//  e-market
//
//  Created by Phonthep Aungkanukulwit on 17/5/2565 BE.
//

import Foundation

class StoreAndProductsViewModel: ObservableObject {
  
  @Published var store: Store = Store(name: "", rating: 5, openingTime: "", closingTime: "")
  @Published var products: [Product] = []
  @Published var isLoading: Bool = false
  
  func getStoreInfo() {
    isLoading = true
    NetworkManager.shared.getStoreInfo { [weak self] result in
      DispatchQueue.main.async { [self] in
        self?.isLoading = false
        switch result {
        case .success(let store):
          self?.store = store
        case .failure(let error):
          print(error)
        }
      }
    }
  }
  
  func getProducts() {
    isLoading = true
    NetworkManager.shared.getProducts { [weak self] result in
      DispatchQueue.main.async { [self] in
        self?.isLoading = false
        switch result {
        case .success(let products):
          self?.products = products
        case .failure(let error):
          print(error)
        }
      }
    }
  }
  
  func dateConvert(date: String) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "HH:mm:ss.SSSZ"
    guard let date = dateFormatter.date(from: date) else { return "-"}
    dateFormatter.timeStyle = .medium
    return dateFormatter.string(from: date)
  }
  
  var quantity: Int = 0
  var counter: Int = 0
  
//  func add(id: UUID, quantity:  Int, counter: Int) {
//    print(id)
//    if counter < 100 {
//      feedback.impactOccurred()
//      counter += 1
//    }
//  }
//  
//  func minus(id: UUID, quantity: Int, counter: Int) {
//    print(quantity)
//    if counter > 0 {
//      counter -= 1
//    }
//  }
  
  
  
}
