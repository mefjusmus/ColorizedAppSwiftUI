//
//  ColorView.swift
//  ColorizedAppSwiftUI
//
//  Created by Vladislav Suslov on 15.12.22.
//

import SwiftUI

struct ColorView: View {
    let red: Double
    let green: Double
    let blue: Double
    
    var body: some View {
        Color(cgColor: CGColor(
            red: red / 255,
            green: green / 255,
            blue: blue / 255,
            alpha: 1.0
        )
        )
            .frame(width: 350, height: 150)
            .cornerRadius(20)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(.white, lineWidth: 4)
            )
    }
}

struct ColorView_Previews: PreviewProvider {
    static var previews: some View {
        ColorView(red: 4, green: 2, blue: 2)
    }
}
