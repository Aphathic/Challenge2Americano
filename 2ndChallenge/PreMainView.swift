//
//  PreMainView.swift
//  2ndChallenge
//
//  Created by Crescenzo Di Franco on 10/11/25.
//

import SwiftUI

struct PreMainView: View {
    var body: some View {
        NavigationStack {
            NavigationLink("Work Folder") {
                MainPageView()
            }
        }
    }
}

#Preview {
    PreMainView()
}
