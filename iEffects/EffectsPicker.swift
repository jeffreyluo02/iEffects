//
//  EffectsPicker.swift
//  iEffects
//
//  Created by Jeffrey Luo on 2019-11-14.
//  Copyright © 2019 Jeffrey Luo. All rights reserved.
//

import SwiftUI

struct EffectsPicker: View {
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.gray, .white]), startPoint: .bottom, endPoint: .top).edgesIgnoringSafeArea(.all)
            VStack {
                HStack {
                    Button(action: {
                        // do something
                    }) {
                        Image(systemName: "wind")
                            .renderingMode(.original)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.black, lineWidth: 1))
                            .shadow(color: .black, radius: 2)
                    }
                    Button(action: {
                        // do something
                    }) {
                        Image(systemName: "snow")
                            .renderingMode(.original)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.black, lineWidth: 1))
                            .shadow(color: .black, radius: 2)
                    }
                }
                HStack {
                    Button(action: {
                        // do something
                    }) {
                        Image(systemName: "flame")
                            .renderingMode(.original)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.black, lineWidth: 1))
                            .shadow(color: .black, radius: 2)
                    }
                    Button(action: {
                        // do something
                    }) {
                        Image(systemName: "tropicalstorm")
                            .renderingMode(.original)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.black, lineWidth: 1))
                            .shadow(color: .black, radius: 2)
                    }
                }
            }
        }
    }
}

struct EffectsPicker_Previews: PreviewProvider {
    static var previews: some View {
        EffectsPicker()
    }
}
