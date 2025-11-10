//
//  MainPageView.swift
//  2ndChallenge
//
//  Created by Crescenzo Di Franco on 10/11/25.
//

import SwiftUI
import SwiftData
struct MainPageView: View {
    
    @State private var goToNewNote = false
    @State private var searchText: String = ""
    @Environment(\.modelContext) private var context
    @Query(sort: \DataItem.Title) var notes: [DataItem]

    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.BCK.ignoresSafeArea()
                Text(searchText)
                
                List(notes) { notes in
                    Text(notes.Title)
                    
                }
            }//ZS
            .searchable(text: $searchText, placement: .toolbar)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("", systemImage: "ellipsis") {
                        //
                    }
                }
                
                DefaultToolbarItem(kind: .search, placement: .bottomBar)
                
                ToolbarSpacer(placement: .bottomBar)
                
                ToolbarItem(placement: .bottomBar) {
                    Button("", systemImage: "square.and.pencil") {
                        goToNewNote = true
                    }
                    .navigationDestination(isPresented: $goToNewNote) {
                                    NotePage()
                                }
                }
            }
            .foregroundStyle(Color.NBCK)
            .navigationTitle("Notes")
            
            
        }//NS
    }//Body
}//View

#Preview {
    MainPageView()
}
