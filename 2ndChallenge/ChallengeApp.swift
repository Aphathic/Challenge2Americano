//
//  _ndChallengeApp.swift
//  2ndChallenge
//
//  Created by Crescenzo Di Franco on 05/11/25.
//

import SwiftUI
import SwiftData

@main
struct ChallengeApp: App {
    var body: some Scene {
        WindowGroup {
            PreMainView()
        }
        .modelContainer(for: DataItem.self)
    }
}
