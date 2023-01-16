//
//  ContentView.swift
//  ColorizedAppSwiftUI
//
//  Created by Vladislav Suslov on 15.12.22.
//

import SwiftUI

private enum Field: Int {
    case red
    case green
    case blue
}

private enum Direction {
    case up
    case down
}

struct ContentView: View {
    @State private var red = Double.random(in: 0...255).rounded()
    @State private var green = Double.random(in: 0...255).rounded()
    @State private var blue = Double.random(in: 0...255).rounded()
    @FocusState private var focusedField: Field?
    
    
    private func changeField(with direction: Direction) {
        switch focusedField {
        case .red:
            focusedField = direction == .up
            ? .blue
            : .green
        case .green:
            focusedField = direction == .up
            ? .red
            : .blue
        case .blue:
            focusedField = direction == .up
            ? .green
            : .red
        case .none:
            focusedField = nil
        }
    }
    
    
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
                SliderStackView(value: $red, color: .red)
                    .focused($focusedField, equals: .red)
                SliderStackView(value: $green, color: .green)
                    .focused($focusedField, equals: .green)
                SliderStackView(value: $blue, color: Color(uiColor: .blue))
                    .focused($focusedField, equals: .blue)
                Spacer()
            }.padding()
        }
        .toolbar(content: {
            ToolbarItemGroup(placement: .keyboard) {
                Button {
                    changeField(with: .up)
                } label: {
                    Label("", systemImage: "chevron.up")
                }
                Button {
                    changeField(with: .down)
                } label: {
                    Label("", systemImage: "chevron.down")
                }
                
                Spacer()
                
                Button("Done") {
                    focusedField = .none
                }
            }
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct SliderStackView: View {
    @Binding var value: Double
    @FocusState var isFocused: Bool
    
    var color: Color
    
    var body: some View {
        HStack {
            Label(value.formatted(), image: "")
                .frame(width: 40)
            SliderView(value: $value, color: color)
                .animation(.default, value: value)
            TextFieldView(value: $value)
        }
    }
}
