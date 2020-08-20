//
//  UserData.swift
//  RaceTracks
//
//  Created by Mike Gopsill on 23/07/2020.
//

import SwiftUI
import Combine

final class UserData: ObservableObject  {
    @Published var showFavoritesOnly = false
    @Published var raceTracks = racetrackData
}
