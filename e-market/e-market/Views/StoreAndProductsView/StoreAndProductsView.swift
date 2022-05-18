//
//  StoreAndProductsView.swift
//  e-market
//
//  Created by Phonthep Aungkanukulwit on 17/5/2565 BE.
//

import SwiftUI

struct StoreAndProductsView: View {
  @EnvironmentObject var viewModel: StoreAndProductsViewModel
  @State var isActive : Bool = false
  
  var body: some View {
    NavigationView {
      ZStack {
        ScrollView(.vertical, showsIndicators: false) {
          VStack {
            ZStack(alignment: .topLeading) {
              Image("arabica-coffee")
                .resizable()
                .scaledToFill()
                .frame(width: UIScreen.main.bounds.width, height: 400)
              Text(viewModel.store.name)
                .font(.system(size: 14))
                .fontWeight(.semibold)
                .foregroundColor(.gray)
                .padding(.vertical, 72)
                .padding(.horizontal, 24)
            }
            
            StoreDetailView()
              .padding()
            
            ForEach(viewModel.products, id: \.id) { product in
              ProductView(product: product)
            }
            
            AddToBagView(isActive: $isActive)
              .padding()
          }
        }
        .ignoresSafeArea(.all, edges: [.top])
        .onAppear {
          viewModel.clearSelectedProductData()
          viewModel.clearTotalPrice()
          viewModel.getStoreInfo()
          viewModel.getProducts()
        }
        
        if viewModel.isLoading {
          LoadingView()
        }
      }
      .background(Style.Colors.background?.edgesIgnoringSafeArea(.all))
      .navigationBarTitle("")
      .navigationBarHidden(true)
      .navigationBarBackButtonHidden(true)
    }
    .accentColor(.brown)
  }
}

struct StoreAndProductsView_Previews: PreviewProvider {
  static var previews: some View {
    StoreAndProductsView()
      .environmentObject(StoreAndProductsViewModel())
  }
}
