//
//  CustomTimer.swift
//  EcommerceSwiftUi
//
//  Created by Karim Hamed  on 19/06/2025.
//
import SwiftUI

struct CustomTimer: View {
    
    //MARK: -attributes
    
    @State var timeRemaining: String = ""
    let futureDate: Date = Date().addingTimeInterval(8433)
    let timer = Timer.publish(every: 1.0, on: .main, in: .common).autoconnect()
    
    var body: some View {
        Text(timeRemaining)
            .font(Fonts.regular.getFont(size: 14))
            .padding(.vertical, 5)
            .padding(.horizontal, 8)
            .background( RoundedRectangle( cornerRadius: 6 ).fill( Color.prim ) )
            .onReceive(timer) { _ in
                updateTimeRemaining()
            }
    }
    
   //MARK: -Functions
    
    func updateTimeRemaining() {
        let remaining = Calendar.current.dateComponents([.hour, .minute, .second], from: Date(), to: futureDate)
        let hour = remaining.hour ?? 0
        let minute = remaining.minute ?? 0
        let second = remaining.second ?? 0
        
        timeRemaining = "\(hour):\(minute):\(second)"
    }
    
}
