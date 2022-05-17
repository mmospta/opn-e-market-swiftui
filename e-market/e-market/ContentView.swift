//
//  ContentView.swift
//  e-market
//
//  Created by Phonthep Aungkanukulwit on 17/5/2565 BE.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    StoreAndProductsView()
      .environmentObject(StoreAndProductsViewModel())
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
