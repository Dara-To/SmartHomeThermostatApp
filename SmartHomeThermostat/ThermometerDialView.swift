//
//  ThermometerDialView.swift
//  SmartHomeThermostat
//
//  Created by Dara To on 2022-04-18.
//

import SwiftUI

struct ThermometerDialView: View {
    private let outerDialSize: CGFloat = 200
    private let innerDialSize: CGFloat = 172
    private let setpointSize: CGFloat = 15
    var degrees: CGFloat = 0
    
    var body: some View {
        ZStack {
            // MARK: Outer Dial
            Circle()
                .fill(LinearGradient([Color("Outer Dial 1"), Color("Outer Dial 2")]))
                .frame(width: outerDialSize, height: outerDialSize)
                .shadow(color: .black.opacity(0.2), radius: 60, x: 0, y: 30) // Drop shadow 1
                .shadow(color: .black.opacity(0.2), radius: 16, x: 0, y: 8) // Drop shadow 2
                .overlay {
                    // MARK: Outer Dial Border
                    Circle()
                        .stroke(LinearGradient([.white.opacity(0.2), .black.opacity(0.19)]), lineWidth: 1)
                }
                .overlay {
                    // MARK: Outer Dial Inner Shadow
                    Circle()
                        .stroke(.white.opacity(0.1), lineWidth: 4)
                        .blur(radius: 8)
                        .offset(x: 3, y: 3)
                        .mask {
                            Circle()
                                .fill(LinearGradient([.black, .clear]))
                        }
                }
            
            // MARK: Inner Dial
            Circle()
                .fill(LinearGradient([Color("Inner Dial 1"), Color("Inner Dial 2")]))
                .frame(width: innerDialSize, height: innerDialSize)
            
            // MARK: Temperature Setpoint
            Circle()
                .fill(LinearGradient([Color("Temperature Setpoint 1"), Color("Temperature Setpoint 2")]))
                .frame(width: setpointSize, height: setpointSize)
                .frame(width: innerDialSize, height: innerDialSize, alignment: .top)
                .offset(x: 0, y: 7.5)
                .rotationEffect(.degrees(degrees + 180))
                .animation(.easeInOut(duration: 1), value: degrees)
        }
    }
}

struct ThermometerDialView_Previews: PreviewProvider {
    static var previews: some View {
        ThermometerDialView()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("Background"))
    }
}
