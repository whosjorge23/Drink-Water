//
//  WaterFill.swift
//  Drink Water
//
//  Created by Jorge Giannotta on 14/06/21.
//

import SwiftUI

struct WaterFill: View {
    
        @State private var waveOffset = Angle(degrees: 0)
        let percent: Int
        
        var body: some View {

            GeometryReader { geo in
                ZStack {
                    Text("\(self.percent)%")
                        .foregroundColor(.black)
                        .font(Font.system(size: 0.25 * min(geo.size.width, geo.size.height) ))
                    RoundedRectangle(cornerSize: CGSize(width: 20, height: 10))
                        .foregroundColor(.white)
                        .frame(width: UIScreen.main.bounds.width + 5, height: UIScreen.main.bounds.height, alignment: .center)
                        .overlay(
                            Wave(offset: Angle(degrees: self.waveOffset.degrees), percent: Double(percent)/100)
                                .fill(Color(red: 0, green: 0.5, blue: 0.75, opacity: 0.5))
                                .clipShape(Rectangle().scale(1))
                        )
                }
                .overlay(
                    Text("\(self.percent)%")
                            .foregroundColor(.white)
                        .shadow(color: .black, radius: 3, x: 0.0, y: 0.0)
                            .font(Font.system(size: 0.25 * min(geo.size.width, geo.size.height)))
                )
            }
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - 80, alignment: .center)
            .aspectRatio(1, contentMode: .fit)
            .onAppear {
                withAnimation(Animation.linear(duration: 2).repeatForever(autoreverses: false)) {
                self.waveOffset = Angle(degrees: 360)
                }
            }
            
        }
    }

struct WaterFill_Previews: PreviewProvider {
    static var previews: some View {
        WaterFill(percent: 0)
    }
}
