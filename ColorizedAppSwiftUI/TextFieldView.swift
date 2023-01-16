//
//  TextFieldView.swift
//  ColorizedAppSwiftUI
//
//  Created by Vladislav Suslov on 16.12.22.
//

import SwiftUI

struct TextFieldView: View {
    @Binding var value: Double
    
    var body: some View {
        TextField(
            "",
            value: $value,
            formatter: NumberFormatter()
        )
            .textFieldStyle(.roundedBorder)
            .frame(width: 50, height: 20)
            .multilineTextAlignment(.center)
    }
    
}

struct TextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldView(value: .constant(2))
    }
}
