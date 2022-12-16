//
//  ContentView.swift
//  ColorizedAppSwiftUI
//
//  Created by Vladislav Suslov on 15.12.22.
//

import SwiftUI

struct ContentView: View {
    @State private var red = Double.random(in: 0...255).rounded()
    @State private var green = Double.random(in: 0...255).rounded()
    @State private var blue = Double.random(in: 0...255).rounded()
    
    var body: some View {
        ZStack {
            Color(.systemBlue)
                .ignoresSafeArea()
            VStack {
                ColorView(
                    red: red,
                    green: green,
                    blue: blue
                )
                SliderStackView(value: $red, text: .constant(red.formatted()), color: .red)
                SliderStackView(value: $green, text: .constant(green.formatted()), color: .green)
                SliderStackView(value: $blue, text: .constant(blue.formatted()), color: Color(uiColor: UIColor.blue))
                Spacer()
            }.padding()
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct SliderStackView: View {
    @Binding var value: Double
    @Binding var text: String
    var color: Color
    
    var body: some View {
        HStack {
            Label(value.formatted(), image: "")
                .frame(width: 40)
            SliderView(value: $value, color: color)
            TextFieldView(text: $text)
        }
    }
}
