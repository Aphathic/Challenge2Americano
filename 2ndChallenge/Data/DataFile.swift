//
//  DataFk.swift
//  2ndChallenge
//
//  Created by Crescenzo Di Franco on 10/11/25.
//

import Foundation
import SwiftData

@Model
class DataItem: Identifiable {
    
    var id: UUID = UUID()
    var Title: String
    var Text: String
    
    init(Title: String, Text: String) {
        self.Title = Title
        self.Text = Text
    }
}
