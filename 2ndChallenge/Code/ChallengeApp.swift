//
//  _ndChallengeApp.swift
//  2ndChallenge
//
//  Created by Crescenzo Di Franco on 05/11/25.
//

import SwiftData
import SwiftUI

@main
struct ChallengeApp: App {
    var body: some Scene {
        WindowGroup {
            PreMainView()
        }
        .modelContainer(for: DataItem.self)

    }
}
