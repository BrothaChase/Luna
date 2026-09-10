//
//  ContentView.swift
//  Luna
//
//  Created by Chase brown on 7/12/26.
//

import SwiftUI

struct ContentView: View {
    // START: Hover state — each button tracks its own pointer hover.
    @State private var isLightHovered = false
    @State private var isDarkHovered = false
    @State private var isDarkSelected = true
    // END: Hover state
    var body: some View {
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
                isDarkSelected = false
                    print("Light mode is turned on")
                } label: {

                    VStack(spacing: 8) {
                        Image(systemName: "sun.max")
                            .font(.title)
                        Text("Light")
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 16)
                    //  Light button purple hover
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(
                                isLightHovered
                                    ? Color.purple.opacity(0.12)
                                    : Color.primary.opacity(0.04)
                            )
                    )
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(
                                isLightHovered
                                    ? Color.purple
                                    : Color.secondary.opacity(0.25),
                                lineWidth: 1
                            )
                    )
                    .contentShape(RoundedRectangle(cornerRadius: 12))

                }

                // Update Light hover state when the pointer enters or leaves.
                .onHover { hovering in
                    isLightHovered = hovering
                }

                Button {
                isDarkSelected = true
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
                                isDarkHovered
                                    ? Color.purple.opacity(0.12)
                                    : Color.primary.opacity(0.04)
                            )
                    )
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(
                                isDarkHovered
                                    ? Color.purple
                                    : Color.secondary.opacity(0.25),
                                lineWidth: 1
                            )
                    )
                    .contentShape(RoundedRectangle(cornerRadius: 12))

                }
                // Update Dark hover state when the pointer enters or leaves.
                .onHover { hovering in
                    isDarkHovered = hovering
                }

            }

        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .buttonStyle(.plain)
        .padding(16)
    }

}

#Preview {
    ContentView()
        .frame(width: 320)
}
