//
//  ContentView.swift
//  WarCardGame
//
//  Created by Konstantinos Rizos on 6/12/19.
//  Copyright © 2019 Konstantinos Rizos. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var randNum1 = 2
    @State private var randNum2 = 5
    
    @State private var score1 = 0
    @State private var score2 = 0
    
    var body: some View {
        ZStack {
            Image("background").resizable().edgesIgnoringSafeArea(.all)
            VStack {
                
                Spacer()
                
                Image("logo")
                
                Spacer()
                
                HStack {
                    Image("card" + String(randNum1))
                    Image("card" + String(randNum2))
                }
                
                Spacer()
                
                Button(action: {
                    // Randomize the state properties
                    self.randNum1 = Int.random(in: 2...14)
                    self.randNum2 = Int.random(in: 2...14)
                    
                    // Update scores
                    if self.randNum1 > self.randNum2 {
                        self.score1 += 1
                    }else if self.randNum2 > self.randNum1 {
                        self.score2 += 1
                    }
                }) {
                    Image("dealbutton")
                        .renderingMode(.original)
                }
                
                Spacer()
                
                HStack {
                    VStack {
                        Text("Player")
                            .bold()
                            .padding(.bottom, 20)
                        Text(String(score1))
                    }
                    .padding(.leading, 20)
                    .foregroundColor(.white)
                    
                    Spacer()
                    
                    VStack {
                        Text("CPU")
                        .bold()
                        .padding(.bottom, 20)
                        Text(String(score2))
                    }
                    .padding(.trailing, 20)
                    .foregroundColor(.white)
                }
                
                Spacer()
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
