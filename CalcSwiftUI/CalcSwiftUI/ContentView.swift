//
//  ContentView.swift
//  CalcSwiftUI
//
//  Created by Temirlan Dzodziev on 04.06.2020.
//  Copyright © 2020 Temirlan Dzodziev. All rights reserved.
//

import SwiftUI

enum CalculatorButtons: String{
    case zero, one, two, three, four, five, six, seven, eight, nine
    case equals, plus, minus, multiply, divide
    case dot
    case ac, minusPlus, percent
    
    var title: String{
        
        switch self {
        case .zero: return "0"
        case .one: return "1"
        case .two: return "2"
        case .three: return "3"
        case .four: return "4"
        case .five: return "5"
        case .six: return "6"
        case .seven: return "7"
        case .eight: return "8"
        case .nine: return "9"
        case .plus: return "+"
        case .percent: return "%"
        case .multiply: return "x"
        case .minusPlus: return "±"
        case .divide: return "÷"
        case .equals: return "="
        case .dot: return "."
        case .minus: return "-"
            
        default:
            return "AC"
        }
        
        
    }
    
    
    var backgroundColor: Color {
        switch self {
        case .zero, .one, .two, .three, .four, .five, .six, .seven, .eight, .nine, .dot:
            return Color(.darkGray)
        case .ac, .minusPlus, .percent:
            return Color(.lightGray)
        default:
            return .orange  
        }
    }
}

struct ContentView: View {
    
    let buttons: [[CalculatorButtons]] = [
        [.ac, .minusPlus, .percent, .divide],
        [.seven, .eight, .nine, .multiply],
        [.four,.five,.six,.minus],
        [.one, .two, .three, .plus],
        [.zero, .dot,  .equals]
    ]
    var body: some View {
        ZStack(alignment:.bottom){
            Color.black.edgesIgnoringSafeArea(.all)
            VStack(spacing: 14){
                
                HStack {
                    Spacer()
                    Text("0")
                        .foregroundColor(.white)
                        .font(.system(size:52))
                        
                        .padding()
                }
                
                ForEach(buttons, id: \.self) {row in
                    HStack(spacing: 14){
                        ForEach(row, id: \.self){ button in
                            Button(action: {
                                
                            }) {
                                Text(button.title)
                                .font(.system(size:32))
                                .frame(width: self.buttonWidth(button: button), height: (UIScreen.main.bounds.width - 5 * 10) / 4)
                                .foregroundColor(.white)
                                .background(button.backgroundColor)
                                .cornerRadius(self.buttonWidth(button: button) / 3)
                                    .rotationEffect(.degrees(45))
                            }
                            
                        }
                    }
                    
                }
            }.padding(.bottom)
        }
        
        
    }
    func buttonWidth(button: CalculatorButtons) -> CGFloat{
        
        if button == .zero{
            return (UIScreen.main.bounds.width - 16 * 14) / 4 * 2
            
        }
        
        return (UIScreen.main.bounds.width - 5 * 14) / 4
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
