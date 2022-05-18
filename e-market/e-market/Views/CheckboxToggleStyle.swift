//
//  CheckboxToggleStyle.swift
//  e-market
//
//  Created by Phonthep Aungkanukulwit on 18/5/2565 BE.
//

import SwiftUI

struct CheckboxToggleStyle: ToggleStyle {
  func makeBody(configuration: Configuration) -> some View {
    return HStack {
      Image(configuration.isOn ? "checkbox.fill" : "checkbox")
        .resizable()
        .foregroundColor(Style.Colors.grayb)
        .frame(width: 20, height: 20)
        .onTapGesture { configuration.isOn.toggle() }
    }
  }
}
