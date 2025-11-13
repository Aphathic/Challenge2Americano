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
    @State private var Nnotes : String = "No Notes"
    
    @Environment(\.modelContext) private var context
    @Query(sort: \DataItem.Title) var notes: [DataItem]
    
    var body: some View {
            NavigationStack {
                ZStack {
                    Color.BCK.ignoresSafeArea()
                    
                    List {
                        ForEach(notes) { note in
                            NavigationLink {
                                NoteView(note: note)
                            }
                            label: {
                                VStack(alignment: .leading){
                                    Text(note.Text).lineLimit(1)
                                        .padding(.leading, 10)

                                        
                                    Text(note.Title)
                                        .padding(.leading, 10)
                                        .foregroundStyle(Color.gray)

                                }
                            }
                        }
                        .onDelete { indexSet in
                            deleteNotes(at: indexSet)
                            
                            NumberNotes() //sottotitolo quando elimino
                        }
                    }
                    .onAppear {
                        NumberNotes()  //per il sottotitolo quando apro
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
                    .navigationSubtitle(Nnotes)
                    .navigationBarTitleDisplayMode(.large)
                
            }//Navigation Stack
        }//Body
    }
        
    public func NumberNotes() {
        if notes.count == 0 {
            Nnotes = "No Notes"
        } else {
            Nnotes = "\(notes.count) Notes"
        }
    }
    
    
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
