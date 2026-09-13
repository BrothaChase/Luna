//
//  ContentView.swift
//  Luna
//
//  Created by Chase brown on 7/12/26.
//

import SwiftUI

struct ContentView: View {
 
    @State private var isLightHovered = false
    @State private var isDarkHovered = false
    //@State private var selectedTime = Date()

    
    
    @State private var isScheduleEnabled = false
    @State private var lightBegins = Calendar.current.date(
        bySettingHour: 21, minute: 27, second: 0, of: Date()
    ) ?? Date()
    @State private var darkBegins = Calendar.current.date(
        bySettingHour: 21, minute: 28, second: 0, of: Date()
    ) ?? Date()
    
    
    let isDarkSelected: Bool
    let onSelectAppearance: (Bool) -> Void
   // let isScheduleEnabled: Bool
    var body: some View {
        // A shared vertical container for all panel sections.
        VStack(alignment: .leading, spacing: 0) {
        HStack(spacing: 12) {
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
                    .foregroundStyle(.secondary)  // mutes sub text
            }

        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(16)

        VStack(alignment: .leading, spacing: 15) {
            Text("APPEARANCE")
                .font(.subheadline)
                .foregroundStyle(.secondary)

            HStack(spacing: 10) {

                Button {
                onSelectAppearance(false)
                    print("Light mode is turned on")
                } label: {

                    VStack(spacing: 8) {
                        Image(systemName: "sun.max")
                            .font(.title)
                        Text("Light")
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 16)
                    //  Light button background color
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(
                                isLightHovered || !isDarkSelected
                                    ? Color.purple.opacity(0.12)
                                    : Color.primary.opacity(0.04)
                            )
                    )
                    
                    // button border
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(
                                isLightHovered || !isDarkSelected
                                    ? Color.purple
                                    : Color.secondary.opacity(0.25),
                                lineWidth: 1
                            )
                    )
                    .contentShape(RoundedRectangle(cornerRadius: 12))

                }

                Button {
                onSelectAppearance(true)
                    print("Dark mode is turned on")
                } label: {
                    VStack(spacing: 8) {
                        Image(systemName: "moon.fill")
                            .font(.title)
                        Text("Dark")
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 16)

                    // Dark button purple hover appearance
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(
                                isDarkHovered || isDarkSelected
                                    ? Color.purple.opacity(0.12)
                                    : Color.primary.opacity(0.04)
                            )
                    )
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(
                                isDarkHovered || isDarkSelected
                                    ? Color.purple
                                    : Color.secondary.opacity(0.25),
                                lineWidth: 1
                            )
                    )
                    .contentShape(RoundedRectangle(cornerRadius: 12))

                }

            }

        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .buttonStyle(.plain)
        .padding(16)

        //  Automatic schedule section
        VStack(alignment: .leading, spacing: 10) {
            VStack(spacing: 12) {
                Toggle("Automatic schedule", isOn: $isScheduleEnabled)
                    .toggleStyle(.switch)
                    .tint(.purple)
                    .font(.subheadline.weight(.medium))

                Divider()

                VStack(spacing: 12) {
                    DatePicker(
                        "Light begins",
                        selection: $lightBegins,
                        displayedComponents: .hourAndMinute
                    )
                   
                    Divider()

                    DatePicker(
                        "Dark begins",
                        selection: $darkBegins,
                        displayedComponents: .hourAndMinute
                    )
                }
                .datePickerStyle(.field)
                .font(.subheadline)
                .disabled(!isScheduleEnabled)
            }
            .padding(14)
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color.primary.opacity(0.04))
            )
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Color.secondary.opacity(0.20), lineWidth: 1)
            )

            Text("Choose when Light and Dark begin.")
                .font(.caption)
                .foregroundStyle(.secondary)
                .padding(.horizontal, 2)
        }
        .padding(.horizontal, 16)
        .padding(.bottom, 16)
        
        }
        
    }

}

#Preview {
    ContentView(
        isDarkSelected: true,
                onSelectAppearance: { useDarkMode in
                    print("Requested Dark Mode: \(useDarkMode)")
                }
            )
        .frame(width: 320)
}
