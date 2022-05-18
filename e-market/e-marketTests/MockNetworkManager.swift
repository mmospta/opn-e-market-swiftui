//
//  MockNetworkManager.swift
//  e-marketTests
//
//  Created by Phonthep Aungkanukulwit on 18/5/2565 BE.
//

import Foundation
@testable import e_market

class MockNetworkManager: NetworkManagerProtocol {
  var storeInfoResult: Result<Store, APIError> = .success(Store(name: "coffee", rating: 4.5, openingTime: "", closingTime: ""))
  var productsResult: Result<[Product], APIError> = .success([Product(name: "coffee", price: 80, imageUrl: "")])
  var orderResult: Result<Void, APIError> = .success(())
  
  func getStoreInfo(_ completion: @escaping (Result<Store, APIError>) -> Void) {
    completion(storeInfoResult)
  }
  
  func getProducts(_ completion: @escaping (Result<[Product], APIError>) -> Void) {
    completion(productsResult)
  }
  
  func postOrder(order: Order, _ completion: @escaping (Result<Void, APIError>) -> Void) {
    completion(orderResult)
  }
}
