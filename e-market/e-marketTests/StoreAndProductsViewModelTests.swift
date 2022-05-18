//
//  StoreAndProductsViewModelTests.swift
//  e-marketTests
//
//  Created by Phonthep Aungkanukulwit on 18/5/2565 BE.
//

import XCTest
@testable import e_market

class StoreAndProductsViewModelTests: XCTestCase {
  var viewModel: StoreAndProductsViewModel!
  var mockNetworkManager: MockNetworkManager!
  
  override func setUp() {
    mockNetworkManager = MockNetworkManager()
    viewModel = .init(networkManager: mockNetworkManager)
  }
  
  func testDateConvertReturnString() {
    let date = "15:01:01.772Z"
    
    XCTAssertEqual(viewModel.dateConvert(date: date), "10:01 PM")
  }
  
  func testSelectedOrderCheckBoxWithSelected() {
    let isSelect = true
    let product = Product(name: "", price: 1, imageUrl: "")
    let quantity = 1
    
    viewModel.selectedOrderCheckBox(isSelect: isSelect, product: product, quantity: quantity)
    
    XCTAssertTrue(!viewModel.selectedProduct.isEmpty)
  }
  
  func testSelectedOrderCheckBoxWithDeSelected() {
    let isSelect = false
    let product = Product(name: "", price: 1, imageUrl: "")
    let quantity = 1
    
    viewModel.selectedOrderCheckBox(isSelect: isSelect, product: product, quantity: quantity)
    
    XCTAssertTrue(viewModel.selectedProduct.isEmpty)
  }
  
  func testChangeQuantity() {
    let isSelect = true
    let product = Product(name: "", price: 1, imageUrl: "")
    let quantity = 1
    
    viewModel.changeQuantity(isSelect: isSelect, product: product, quantity: quantity)
    
    XCTAssertNotEqual(viewModel.selectedProduct.first?.totalPrice, 0)
  }
  
  func testDisableAddToBagButtonIsDisableBtnShouldBeFalse() {
    let selectedProduct = SelectedProduct(id: UUID(), product: Product(name: "", price: 1, imageUrl: ""), quantity: 1, totalPrice: 1)
    viewModel.selectedProduct = [selectedProduct]
    
    viewModel.disableAddToBagButton()
    
    XCTAssertFalse(viewModel.isDisableBtn)
  }
  
  func testDisableAddToBagButtonIsDisableBtnShouldBeTrue() {
    viewModel.selectedProduct = []
    
    viewModel.disableAddToBagButton()
    
    XCTAssertTrue(viewModel.isDisableBtn)
  }
  
  func testClearSelectedProductData() {
    viewModel.clearSelectedProductData()
    XCTAssertTrue(viewModel.selectedProduct.isEmpty)
    XCTAssertTrue(viewModel.isDisableBtn)
  }
  
  func testCalculateTotalPriceOfRowReturnTotalPriceOfRow() {
    XCTAssertEqual(viewModel.calculateTotalPriceOfRow(price: 10, quantity: 10), 100)
  }
  
  func testCalculateTotalPriceReturnTotalPrice() {
    let selectedProduct = [
      SelectedProduct(id: UUID(), product: Product(name: "", price: 1, imageUrl: ""), quantity: 1, totalPrice: 100),
      SelectedProduct(id: UUID(), product: Product(name: "", price: 1, imageUrl: ""), quantity: 1, totalPrice: 80)
    ]
    viewModel.selectedProduct = selectedProduct
    
    viewModel.calculateTotalPrice()
    
    XCTAssertEqual(viewModel.totalPrice, 180)
  }
  
  func testClearTotalPriceTotalPriceShouldBeZero() {
    viewModel.clearTotalPrice()
    
    XCTAssertEqual(viewModel.totalPrice, 0)
  }
}
