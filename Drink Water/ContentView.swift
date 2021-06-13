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
    var body: some View {
        VStack(alignment: .center, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/, content: {
            ZStack{
                Rectangle()
                    .padding(.bottom,0)
                    .frame(width: screenWidth, height: CGFloat(dynamicHeight), alignment: .center)
                    .foregroundColor(.blue)
                    .overlay(
                        HStack(alignment: .center, spacing: nil, content: {
                            Button(action: {
                                if dynamicHeight > 0 {
                                    dynamicHeight -= 100
                                    text -= 250
                                }
                            }, label: {
                                Circle()
                                    .frame(width: 100, height: 100, alignment: .center)
                                    .foregroundColor(.red)
                                    .overlay(Text("Remove").foregroundColor(.white))
                            })
                            .padding()
                            Spacer()
                            Text("\(text)")
                                .foregroundColor(.white)
                            Spacer()
                            Button(action: {
                                if dynamicHeight <= 900{
                                    dynamicHeight += 100
                                    text += 250
                                }
                            }, label: {
                                Circle()
                                    .frame(width: 100, height: 100, alignment: .center)
                                    .foregroundColor(.green)
                                    .overlay(Text("Add").foregroundColor(.white))
                            })
                            .padding()
                        })
                        ,alignment: .center
                    )
            }
        })
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
