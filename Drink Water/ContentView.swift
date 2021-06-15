//
//  ContentView.swift
//  Drink Water
//
//  Created by Jorge Giannotta on 13/06/21.
//

import SwiftUI

struct ContentView: View {
    var screenWidth = UIScreen.main.bounds.width
    @State var dynamicHeight = 0
    @State var text = 0
    @State var limitDrink = 2500
    @State var percentage = 0
    var body: some View {
        VStack(alignment: .center, spacing: nil, content: {
            ZStack{
                Rectangle()
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height, alignment: .center)
                    .foregroundColor(.clear)
//                    .overlay(
//                        WaterFill(screenWidth: screenWidth, dynamicHeight: dynamicHeight, text: text)
//                        ,alignment: .bottom
//                    )
//                WaveForm()
//                CircleWaveView(percent: percentage)
                WaterFill(percent: percentage)
//                    .padding()
            }
            .edgesIgnoringSafeArea(.all)
            .overlay(
                VStack(alignment: .center, spacing: nil, content: {
                    HStack(alignment: .center, spacing: nil, content: {
                        Text("Drink Water")
                            .font(.largeTitle)
                            .foregroundColor(.white)
                            .shadow(color: .black, radius: 2, x: 0.3, y: 0.0)
                        Spacer()
                        Button(action: {
                            //Action
                        }, label: {
                            Image(systemName: "gear")
                                .font(.largeTitle)
                                .foregroundColor(.white)
                                .shadow(color: .black, radius: 2, x: 0, y: 0)
                        })
                        
                    })
                    .padding(.vertical, 30)
                    .padding(.horizontal)
                    
                    Spacer()
                    HStack(alignment: .center, spacing: nil, content: {
                        Button(action: {
//                            if dynamicHeight > 0 {
//                                dynamicHeight -= 100
//                                text -= 250
//                            }
                            if percentage > 0 {
                                percentage -= 10
                            }
                        }, label: {
                            Circle()
                                .frame(width: 100, height: 100, alignment: .center)
                                .foregroundColor(Color(#colorLiteral(red: 0.8881979585, green: 0.3072378635, blue: 0.2069461644, alpha: 1)))
                                .overlay(Text("Remove").foregroundColor(.white))
                                .shadow(color: .black, radius: 5, x: 0.8, y: 0.8)
                        })
                        .padding()
                        Spacer()
                        Button(action: {
//                            if dynamicHeight <= 900{
//                                dynamicHeight += 100
//                                text += 250
//                            }
                            if percentage < 100 {
                                percentage += 10
                            }
                        }, label: {
                            Circle()
                                .frame(width: 100, height: 100, alignment: .center)
                                .foregroundColor(Color(#colorLiteral(red: 0.262835294, green: 0.8022480607, blue: 0.3886030316, alpha: 1)))
                                .overlay(Text("Add").foregroundColor(.white))
                                .shadow(color: .black, radius: 5, x: 0.8, y: 0.8)
                        })
                        .padding()
                    })
                })
                ,alignment: .center
            )
            
        })
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
