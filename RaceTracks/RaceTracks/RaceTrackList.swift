//
//  RaceTrackList.swift
//  RaceTracks
//
//  Created by Mike Gopsill on 23/07/2020.
//

import SwiftUI

struct RaceTrackList: View {
    @EnvironmentObject var userData: UserData
    
    var body: some View {
        List {
            Toggle(isOn: $userData.showFavoritesOnly) {
                Text("Favorites only")
            }
            
            ForEach(userData.raceTracks) { raceTrack in
                if !userData.showFavoritesOnly || raceTrack.isFavorite {
                    NavigationLink(destination: RaceTrackDetailView(raceTrack: raceTrack)) {
                        RaceTrackRow(raceTrack: raceTrack)
                    }
                }
            }
        }
        .navigationBarTitle(Text("Circuits"))
    }
}

struct RaceTrackList_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ForEach(["iPhone SE", "iPhone XS Max"], id: \.self) { deviceName in
                RaceTrackList()
                    .previewDevice(PreviewDevice(rawValue: deviceName))
                    .environmentObject(UserData())
            }
        }
    }
}
