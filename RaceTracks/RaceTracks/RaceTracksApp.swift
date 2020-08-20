//
//  RaceTracksApp.swift
//  RaceTracks
//
//  Created by Mike Gopsill on 23/07/2020.
//

import SwiftUI

@main
struct RaceTracksApp: App {
    var body: some Scene {
        WindowGroup {
            CategoryHome()
                .environmentObject(UserData())
        }
    }
}


/*
 TODO:
 - Use the badge
 - Fix braking map
 - Animate map pin
 - Use and redo hike graph exampel
 - Fix builder errors
 - Tidy up details screen
 */
