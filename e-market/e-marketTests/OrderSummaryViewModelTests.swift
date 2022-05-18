//
//  OrderSummaryViewModelTests.swift
//  e-marketTests
//
//  Created by Phonthep Aungkanukulwit on 18/5/2565 BE.
//

import XCTest
@testable import e_market

class OrderSummaryViewModelTests: XCTestCase {
  
  var viewModel: OrderSummaryViewModel!
  var mockNetworkManager: MockNetworkManager!
  
  override func setUp() {
    mockNetworkManager = MockNetworkManager()
    viewModel = .init(networkManager: mockNetworkManager)
  }
  
  func testDeliveryAddressWhenAddressIsLess() {
    viewModel.deliveryAddress(address: "289/4")
    
    XCTAssertTrue(viewModel.isDisableBtn)
  }
  
  func testDeliveryAddressWhenAddressIsMore() {
    viewModel.deliveryAddress(address: "289/4 Bangkok")
    
    XCTAssertFalse(viewModel.isDisableBtn)
  }
  
}
