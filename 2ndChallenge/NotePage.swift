//
//  ContentView.swift
//  2ndChallenge
//
//  Created by Crescenzo Di Franco on 05/11/25.
//

import SwiftUI
import SwiftData

struct NotePage: View {
    var title1 = "Note \(Date.now.formatted(date: .abbreviated, time: .shortened))"
    @State var text = ""
    @FocusState var focus
    @Environment(\.modelContext) private var context

    var body: some View {
        NavigationStack {
            ZStack {
                Color.BCK
                
                
                HStack {
                    
                    TextEditor(text: $text)
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
                        addItem(a: text)
                    }
                    .tint(.yellow)
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
    
    func addItem(a: String) {
        let NewNote = DataItem(Title: title1, Text: a)
        context.insert(NewNote)
        try? context.save()
    }
    
}

#Preview {
    NotePage()
}
