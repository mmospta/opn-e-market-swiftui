//
//  StoreAndProductsViewModel.swift
//  e-market
//
//  Created by Phonthep Aungkanukulwit on 17/5/2565 BE.
//

import Foundation

class StoreAndProductsViewModel {
  
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
  
}
