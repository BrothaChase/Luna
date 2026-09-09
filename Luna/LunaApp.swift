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
    
    // points to the tool that handles and runs AppleScript
    process.executableURL = URL(fileURLWithPath: "/usr/bin/osascript")
   
    // tells macOS to invert the current DarkMode state & sends script to system events to change appearance
    process.arguments = ["-e", "tell application \"System Events\" to tell appearance preferences to set dark mode to not dark mode"]
    do {
        try process.run()
    } catch {
        print("Failed to toggle Dark Mode: /(error)")
    }
}

func shouldUseDarkMode(at date : Date) -> Bool {
    
    let calendar = Calendar.current  // get current mac's calendar system, time zone & locale settings
    let hour = calendar.component(.hour, from: date)
    return hour >= 19 || hour < 7
}

@main
struct LunaApp: App {
    @State private var darkIsEnabled: Bool = true
    @State private var darkModeSchedule: Bool = true

    
    var body: some Scene {
       
        MenuBarExtra ("Luna", systemImage: "moon.stars") {

            // VStack arranges chile elements in a vertical line
            VStack {
                Text("Luna is running")
                Button( darkIsEnabled ? "Dark" : "Light") {
                  
                    /*  let shouldBeDark = shouldUseDarkMode(at: Date())
                    print("Should use Dark Mode: \(shouldBeDark)")  // test code for time */
                    
                    darkModeSchedule = false  // turns dark mode schedule off when using manual mode
                    toggleDarkMode()     // toggle dark mode
                    darkIsEnabled.toggle()
                }
               
                /* Button( darkModeSchedule ? "Schedule On" : "Schedule Off") {
                    darkModeSchedule = true
                    
                    let currentDate = Foundation.Date()
                    let shouldBeDark = shouldUseDarkMode(at: currentDate)
                    
                    if darkIsEnabled != shouldBeDark {
                        toggleDarkMode()
                        darkIsEnabled = shouldBeDark
                    }
                } */
                
                Text(darkIsEnabled ? "Dark mode is turned on" : "Dark mode is off")
                Text (darkModeSchedule ? "Schedule on" : "Schedule off")
                

            }
            
        }
        
    }
 
}
