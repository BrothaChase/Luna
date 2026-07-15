//
//  LunaApp.swift
//  Luna
//
//  Created by Chase brown on 7/12/26.
//

import SwiftUI
import Foundation   // allows for use of URL & the Process() class to be used to run system level commands

func toggleDarkMode() {
    let process = Process()
    
    // points to the tool that handles and runs scripts
    process.executableURL = URL(fileURLWithPath: "/usr/bin/osascript")
   
    // tells macOS to invert the current DarkMode state
    process.arguments = ["-e", "tell application \"System Events\" to tell appearance preferences to set dark mode to not dark mode"]
    do {
        try process.run()
    } catch {
        print("Failed to toggle Dark Mode: /(error)")
    }
}

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
