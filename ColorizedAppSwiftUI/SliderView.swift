//
//  SliderView.swift
//  ColorizedAppSwiftUI
//
//  Created by Vladislav Suslov on 16.12.22.
//

import SwiftUI

struct SliderView: View {
    @Binding var value: Double
    let color: Color
    
    var body: some View {
        Slider(
            value: $value,
            in: 0...255,
            step: 1
        )
        .tint(color)
        .padding()
    }
}

struct SliderView_Previews: PreviewProvider {
    static var previews: some View {
        SliderView(value: .constant(100), color: .red)
    }
}
