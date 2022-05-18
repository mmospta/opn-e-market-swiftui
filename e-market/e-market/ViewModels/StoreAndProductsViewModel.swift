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
  @Published var isDisableBtn: Bool = true
  @Published var totalPrice: Int = 0
  
  var cart: Cart = Cart(total: 0, selectProducts: [])
  var selectedProduct: [SelectedProduct] = []
  
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
  
  func selectedOrderCheckBox(isSelect: Bool, product: Product, quantity: Int) {
    if isSelect {
      let rowTotalPrice = calculateTotalPriceOfRow(price: product.price, quantity: quantity)
      selectedProduct.append(SelectedProduct(id: product.id, product: product, quantity: quantity, totalPrice: rowTotalPrice))
      disableAddToBagButton()
      print(selectedProduct)
    } else {
      if let index = selectedProduct.firstIndex(where: { $0.id == product.id }) {
        selectedProduct.remove(at: index)
        disableAddToBagButton()
      }
    }
  }
  
  func changeQuantity(isSelect: Bool, product: Product, quantity: Int) {
    if isSelect, let index = selectedProduct.firstIndex(where: { $0.id == product.id }) {
      selectedProduct[index].quantity = quantity
      let rowTotalPrice = calculateTotalPriceOfRow(price: product.price, quantity: quantity)
      print(rowTotalPrice)
      selectedProduct[index].totalPrice = rowTotalPrice
      disableAddToBagButton()
      print(selectedProduct)
    }
  }
  
  func disableAddToBagButton() {
    if !selectedProduct.isEmpty {
      isDisableBtn = false
      calculateTotalPrice()
    } else {
      isDisableBtn = true
    }
  }
  
  func clearSelectedProductData() {
    selectedProduct = []
    isDisableBtn = true
  }
  
  func calculateTotalPriceOfRow(price: Int, quantity: Int) -> Int {
    return price * quantity
  }
  
  func calculateTotalPrice() {
    var total = 0
    for product in selectedProduct {
      total += product.totalPrice
    }
    totalPrice = total
    cart = Cart(total: total, selectProducts: selectedProduct)
  }
  
  func clearTotalPrice() {
    totalPrice = 0
  }
}
