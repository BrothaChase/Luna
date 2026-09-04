//
//  LunaApp.swift
//  Luna
//
//  Created by Chase brown on 8/31/26.
//

import SwiftUI
import Foundation // allows for use of URL & the Process() class to be used to run system level commands

func toggleDarkMode() {
    let process = Process()
    
    // points to the tool that handles and runs scripts
    process.executableURL = URL(fileURLWithPath: "/usr/bin/osascript")
    
    // tells macOS to invert the current DarkMode state
    process.arguments = [
        "-e",
        "tell application \"System Events\"\n tell appearance preferences\n if dark mode is true then\n set dark mode to false\n else\n set dark mode to true\n end if\n end tell\nend tell"
    ]
    
    do {
        try process.run()
    } catch {
        print("Failed to toggle Dark Mode: \(error)")
    }
}

@main
struct LunaApp: App {
    @State private var darkIsEnabled: Bool = false
    
    var body: some Scene {
        MenuBarExtra("Luna", systemImage: "moon.stars") {
            // VStack arranges child elements in a vertical line
            VStack {
                Text("Luna is running")
                Button("Toggle Dark Mode") {
                    darkIsEnabled.toggle()
                    toggleDarkMode()
                }
                
                if darkIsEnabled {
                    Text("Dark mode is turned on")
                } else {
                    Text("Dark mode is turned off")
                }
            }
        }
    }
}
