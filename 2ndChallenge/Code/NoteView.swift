//
//  ContentView.swift
//  2ndChallenge
//
//  Created by Crescenzo Di Franco on 05/11/25.
//

import SwiftData
import SwiftUI

struct NoteView: View {

    @State private var goToNewNote = false
    @State private var texxt: String
    var ttitle1 = "\(Date.now.formatted(date: .abbreviated, time: .shortened))"

    @FocusState var focus

    @Environment(\.modelContext) private var context
    @State var note: DataItem

    init(note: DataItem) {
        self.note = note
        texxt = note.Text
    }

    var body: some View {
        NavigationStack {
            ZStack {
                Color.BCK

                HStack {
                    //Text field
                    TextEditor(text: $texxt)
                        .tint(.yellow)
                        .focused($focus)
                        .font(.title)
                        .foregroundColor(Color.NBCK)
                        .fontWeight(.bold)

                }  //Hstack
                .padding(.top, 110)
                .padding(.leading, 20)
                .onAppear {
                    focus = true
                }
            }  //ZStack
            .ignoresSafeArea()
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    if texxt == "" || texxt == note.Text{
                        //
                    } else {
                        Button("", systemImage: "checkmark") {
                            goToNewNote = true
                            EditNote()
                        }
                        .tint(.yellow)
                        .navigationDestination(isPresented: $goToNewNote) {
                            MainPageView()
                        }
                    }
                }
                //item
                ToolbarItem(placement: .topBarTrailing) {
                    Button("", systemImage: "arrow.uturn.backward") {
                        //
                    }
                    .foregroundStyle(Color.NBCK)
                }
                //spacer
                ToolbarSpacer(.fixed, placement: .topBarTrailing)
                //item
                ToolbarItem(placement: .topBarTrailing) {
                    HStack {
                        Image(systemName: "square.and.arrow.up").padding(
                            .trailing,
                            20
                        )
                        .padding(.leading, 10)
                        Image(
                            systemName:
                                "ellipsis"
                        )
                        .padding(.trailing, 10)
                    }
                    .foregroundStyle(Color.NBCK)
                }
            }
        }  //NS
    }  //View

    private func EditNote() {
        note.Text = texxt
        note.Title = ttitle1
        try? context.save()  //already tested
    }
}

#Preview {
    NoteView(note: DataItem(Title: "", Text: ""))
}
