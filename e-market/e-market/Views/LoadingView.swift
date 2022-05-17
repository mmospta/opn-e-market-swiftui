//
//  LoadingView.swift
//  e-market
//
//  Created by Phonthep Aungkanukulwit on 17/5/2565 BE.
//

import SwiftUI

struct LoadingView: View {
  var body: some View {
    ZStack {
      Color(.systemBackground).ignoresSafeArea(.all)
      ProgressView()
        .progressViewStyle(.circular)
        .tint(.gray)
      .scaleEffect(1.5)
    }
  }
}

struct LoadingView_Previews: PreviewProvider {
  static var previews: some View {
    LoadingView()
  }
}
