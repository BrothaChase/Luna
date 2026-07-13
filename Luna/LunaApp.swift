//
//  LunaApp.swift
//  Luna
//
//  Created by Chase brown on 7/12/26.
//

import SwiftUI

@main
struct LunaApp: App {
    @State private var darkIsEnabled: Bool = false
    
    var body: some Scene {
       
        MenuBarExtra ("Luna", systemImage: "moon.stars") {

            // VStack arranges chile elements in a vertical line
            VStack {
                Text("Luna is running")
                Button("Toggle On/Off") {
                    darkIsEnabled.toggle()
                }
                
                if darkIsEnabled {
                              Text("Dark mode is turned on")
                        } else  {
                            Text("Dark mode is turned off")
                    }

            }
            
        }
        
    }
 
}
