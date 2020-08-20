//
//  RaceTrackRow.swift
//  RaceTracks
//
//  Created by Mike Gopsill on 23/07/2020.
//

import SwiftUI

struct RaceTrackRow: View {
    var raceTrack: RaceTrack
    var body: some View {
        HStack {
            raceTrack.image
                .resizable()
                .frame(width: 50, height: 50)
            Text(raceTrack.name)
            Spacer()
            
            if raceTrack.isFavorite {
                Image(systemName: "star.fill")
                    .imageScale(.medium)
                    .foregroundColor(.yellow)
            }
        }
    }
}

struct RaceTrackRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            RaceTrackRow(raceTrack: racetrackData[0])
            RaceTrackRow(raceTrack: racetrackData[1])
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
