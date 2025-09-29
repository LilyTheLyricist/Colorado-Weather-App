//
//  ContentView.swift
//  codealong
//
//  Created by Jimenez, Carlos - Student on 9/26/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var buttonPressed = false
    @State private var temp: Int = Int.random(in: -20...103)
    @State private var message: String = ""
    @State private var icon: String = ""
    @State private var color1: Color = .white
    @State private var color2: Color = .blue
    
    var body: some View {
        VStack {
            Image(systemName: "cloud.rain")
                .font(.system(size: 100))
                .foregroundStyle(.white)
            Text("Colorado Weather")
                .font(.largeTitle)
                .foregroundStyle(.white)
            Button("Get Weather") {
                temp = Int.random(in: -20...103)
                makeMessage()
                print("\(temp)")
                print(message)
                buttonPressed.toggle()
                
            }
            .padding()
            .background(.orange)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .foregroundStyle(.white)
            .fontWeight(.heavy)
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(LinearGradient(colors: [.white, .blue], startPoint: .topLeading, endPoint: .bottomTrailing))
        .sheet(isPresented: $buttonPressed) { [temp, message]
            in
            NavigationStack{
                VStack{
                    Text("\(temp)")
                        .font(.system(size:200, design: .rounded))
                    Image(systemName: icon)
                        .font(.system(size: 100))
                    Text(message)
                    
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(LinearGradient(colors: [color1, color2], startPoint: .top, endPoint: .bottom))
                .navigationTitle("Today's Weather")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button("Close") {
                            buttonPressed.toggle()
                        }
                    }
                }
            }
        }
    }
    func makeMessage() {
        if temp > 90 {
            message = "It is hot!"
            icon = "sun.max.trianglebadge.exclamationmark.fill"
            color1 = .orange
            color2 = .red
        } else if temp > 60 {
            message = "It is pleasant!"
            icon = "sun.min.fill"
            color1 = .yellow
            color2 = .orange
        } else if temp > 32 {
            message = "It is brisk"
            icon = "cloud.rain.fill"
            color1 = .blue
            color2 = .indigo
        } else if temp > 0 {
            message = "brr Bundle Up!"
            icon = "cloud.snow.fill"
            color1 = .cyan
            color2 = .blue
        } else {
            message = "You should consider moving!"
            icon = "snowflake"
            color1 = .white
            color2 = .cyan
        }
    }
}

#Preview {
    ContentView()
}
