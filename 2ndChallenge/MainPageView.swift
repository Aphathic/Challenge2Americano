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
                
                List {
                    ForEach(notes) { note in
                        NavigationLink(note.Title) {
                            NoteView(note: note)
                        }
                    }
                    .onDelete { indexSet in
                        deleteNotes(at: indexSet)
                    }
                }

                .searchable(text: $searchText, placement: .toolbar)
                .toolbar {
                    
                    ToolbarItem(placement: .topBarTrailing) {
                        Button("", systemImage: "ellipsis") {
                            //Func

                        }// Button Ellipsis
                    }//Toolbar top
                    
                    DefaultToolbarItem(kind: .search, placement: .bottomBar)
                    
                    ToolbarSpacer(placement: .bottomBar)
                    
                    ToolbarItem(placement: .bottomBar) {
                        Button("", systemImage: "square.and.pencil") {
                            goToNewNote = true
                        }// Button Add Note
                        .navigationDestination(isPresented: $goToNewNote) {
                            NotePage()
                        }
                    }//Toolbar bottom
                }//Toolbar
                .foregroundStyle(Color.NBCK)
                .navigationTitle("Notes")
            }//ZS
        }//Navigation Stack
    }//Body
    
    func deleteNotes(at offsets: IndexSet) {
        for index in offsets {
            let note = notes[index]
            context.delete(note)
        }
        
        try? context.save()
    }

}//View

#Preview {
    MainPageView()
}
