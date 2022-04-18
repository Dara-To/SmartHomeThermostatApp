//
//  ThermometerSummaryView.swift
//  SmartHomeThermostat
//
//  Created by Dara To on 2022-04-18.
//

import SwiftUI

struct ThermometerSummaryView: View {
    var status: Status
    var showStatus: Bool
    var temperature: CGFloat
    
    var body: some View {
        VStack(spacing: 0) {
            // MARK: Temperature Status
            Text(status.rawValue)
                .font(.headline)
                .foregroundColor(.white)
                .opacity(showStatus ? 0.6 : 0)
                .animation(.easeIn(duration: 0.5), value: showStatus)
            
            // MARK: Temperature
            Text("\(temperature, specifier: "%.0f")")
                .font(.system(size: 54))
                .foregroundColor(.white)
            
            // MARK: Eco Leaf
            Image(systemName: "leaf.fill")
                .font(.title2.bold())
                .foregroundColor(.green)
        }
        .padding(.top, 40)
    }
}

struct ThermometerSummaryView_Previews: PreviewProvider {
    static var previews: some View {
        ThermometerSummaryView(status: .heating, showStatus: true, temperature: 22)
            .background(Color("Inner Dial 2"))
    }
}
