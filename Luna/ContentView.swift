//
//  ContentView.swift
//  Luna
//
//  Created by Chase brown on 7/12/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack (spacing: 12) {
            Image(systemName: "moon.stars.fill")
                .font(.system(size: 32))
                .imageScale(.large)
                //.foregroundStyle(.tint)
            
            VStack(alignment: .leading, spacing: 4) {
                Text("Luna")
                    .font(.title2)
                    .fontWeight(.semibold)
               
                Text("Appearance, on your schedule")
                    .font(.subheadline)
                     .foregroundStyle(.secondary) // mutes sub text
            }
          
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(16)
    }
}

#Preview {
    ContentView()
        .frame(width: 320)
}
