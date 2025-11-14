//
//  UovoView.swift
//  2ndChallenge
//
//  Created by Crescenzo Di Franco on 14/11/25.
//

import SwiftUI

struct UovoView: View {
    var body: some View {
        ZStack {
            Color.BCK.ignoresSafeArea()
        
        Image("Uovo")
            .resizable()
            .scaledToFit()  // keeps proportions
            .frame(maxWidth: .infinity, maxHeight: .infinity)    }
    }
}

#Preview {
    UovoView()
}
