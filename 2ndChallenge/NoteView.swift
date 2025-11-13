
//
//  ContentView.swift
//  2ndChallenge
//
//  Created by Crescenzo Di Franco on 05/11/25.
//

import SwiftUI
import SwiftData

struct NoteView: View {
    
    @State private var goToNewNote = false
    
    
    var ttitle1 = "\(Date.now.formatted(date: .abbreviated, time: .shortened))"

    @FocusState var focus

    @Environment(\.modelContext) private var context
    @State var note: DataItem
    @State private var texxt: String
    
    
    init(note: DataItem) {
            self.note = note
            texxt = note.Text
        }
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.BCK
                
                
                HStack {
                    
                    TextEditor(text: $texxt)
                        .tint(.yellow)
                        .focused($focus)
                        .font(.title)
                        .foregroundColor(Color.NBCK)
                        .fontWeight(.bold)
                    
                } //Hstack
                .padding(.top, 110)
                .padding(.leading, 20)
                .onAppear {
                    focus = true
                }//OnAppear
            }//ZStack
            .ignoresSafeArea()
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("", systemImage: "checkmark") {
                        goToNewNote = true
                        EditNote()
                    }
                    .tint(.yellow)
                    .navigationDestination(isPresented: $goToNewNote) {
                        MainPageView()
                        
                    }
                    
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button("", systemImage: "arrow.uturn.backward") {
                        //
                    }
                    .foregroundStyle(Color.NBCK)
                }
                
                ToolbarSpacer(.fixed, placement: .topBarTrailing)
                ToolbarItem(placement: .topBarTrailing) {
                    HStack {
                        Image(systemName: "square.and.arrow.up").padding(.trailing, 20)
                            .padding(.leading, 10)
                        
                        Image(systemName:
                                "ellipsis")
                        .padding(.trailing, 10)
                    }
                    .foregroundStyle(Color.NBCK)
                }
                
                
            }
            
        }//NS
    }//View
    
    private func EditNote(){
        note.Text = texxt
        note.Title = ttitle1
        do {
            try context.save()
        } catch  {
            print("Error during edit")
        }
        
    }
    
}	

#Preview {
    NoteView(note: DataItem(Title: "", Text: ""))
}
