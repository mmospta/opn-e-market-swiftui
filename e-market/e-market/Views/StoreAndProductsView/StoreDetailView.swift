//
//  StoreDetailView.swift
//  e-market
//
//  Created by Phonthep Aungkanukulwit on 17/5/2565 BE.
//

import SwiftUI

struct StoreDetailView: View {
  
  @EnvironmentObject var viewModel: StoreAndProductsViewModel
  
  var body: some View {
    VStack(alignment: .leading) {
      HStack(alignment: .bottom) {
        Text(viewModel.store.name)
          .font(.system(size: 20))
          .fontWeight(.bold)
          .foregroundColor(.black)
        Spacer()
        HStack {
          Image(systemName: "star.fill")
            .resizable()
            .frame(width: 16, height: 16)
          Text("\(viewModel.store.rating, specifier: "%.1f")")
            .font(.system(size: 16))
            .fontWeight(.semibold)
        }
        .foregroundColor(Style.Colors.textGold)
      }
      
      Text("Open \(viewModel.dateConvert(date: viewModel.store.openingTime))")
        .font(.system(size: 16))
        .fontWeight(.semibold)
        .foregroundColor(.gray)
      
      Text("Close \(viewModel.dateConvert(date: viewModel.store.closingTime))")
        .font(.system(size: 16))
        .fontWeight(.semibold)
        .foregroundColor(.gray)
    }
  }
}

struct StoreDetailView_Previews: PreviewProvider {
  static var previews: some View {
    StoreDetailView()
      .environmentObject(StoreAndProductsViewModel())
  }
}
