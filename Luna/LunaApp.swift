//
//  LunaApp.swift
//  Luna
//
//  Created by Chase brown on 7/12/26.
//

import Foundation  // allows for use of URL & the Process() class to be used to run system level commands
import SwiftUI

func setDarkMode(enabled: Bool) {
    let process = Process()

    // points to the tool that handles and runs AppleScript
    process.executableURL = URL(fileURLWithPath: "/usr/bin/osascript")

    let appearanceValue = enabled ? "true" : "false"

    // Sets macOS Dark Mode to the provided appearance value: true enables Dark Mode, false enables Light Mode
    process.arguments = [
        "-e",
        "tell application \"System Events\" to tell appearance preferences to set dark mode to \(appearanceValue)",
    ]
    do {
        try process.run()
    } catch {
        print("Failed to toggle Dark Mode: \(error)")
    }
}

func shouldUseDarkMode(at date: Date) -> Bool {

    let calendar = Calendar.current  // get current mac's calendar system, time zone & locale settings
    let hour = calendar.component(.hour, from: date)
    return hour >= 22 || hour < 7
}

@main
struct LunaApp: App {
    @State private var darkIsEnabled: Bool = true
    @State private var darkModeSchedule: Bool = true

    var body: some Scene {

        MenuBarExtra("Luna", systemImage: "moon.stars") {
            VStack(spacing: 0) {
                ContentView(
                    isDarkSelected: darkIsEnabled,
                    onSelectAppearance: { useDarkMode in  // call "useDarMode" value, then execute the following code
                        darkModeSchedule = false  // disable scheduling when manually choosing mode
                        setDarkMode(enabled: useDarkMode)  // requests choses macOS appearance
                        darkIsEnabled = useDarkMode  // updates button highlight
                    }
                )
            }
            // Keep the custom UI at the same width as its preview.
            .frame(width: 320)

            // VStack arranges child elements in a vertical line
            VStack(alignment: .center, spacing: 12) {
                Text("Luna is running")
                
                Button(darkModeSchedule ? "Schedule On" : "Schedule Off") {
                    darkModeSchedule.toggle()  //toggles schedule on and off

                    if darkModeSchedule {

                        let currentDate = Date()
                        let shouldBeDark = shouldUseDarkMode(at: currentDate)
                        setDarkMode(enabled: shouldBeDark)
                        darkIsEnabled = shouldBeDark

                    }

                }

            }

            .padding(16)
            .frame(width: 320)

        }
        .menuBarExtraStyle(.window)
    }

}
