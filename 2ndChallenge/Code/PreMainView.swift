//
//  PreMainView.swift
//  2ndChallenge
//
//  Created by Crescenzo Di Franco on 06/11/25.
//

import SwiftData
import SwiftUI

struct PreMainView: View {
    @State private var isICloudExpanded: Bool = true
    @State private var isAcademyMailExpanded: Bool = true
    @State private var goToNewNote: Bool = false
    @State private var searchText: String = ""

    @Environment(\.modelContext) private var context
    @Query(sort: \DataItem.Title) var notes: [DataItem]

    struct NotesListView: View { var body: some View { Text("Notes List") } }
    struct DeletedListView: View {
        var body: some View { Text("Recently Deleted") }
    }

    var body: some View {
        NavigationStack {
            List {
                Section(isExpanded: $isICloudExpanded) {
                    NavigationLink(destination: MainPageView()) {
                        ListRowView(
                            title: "Notes",
                            icon: "folder",
                            color: .yellow,
                            count: notes.count
                        )
                    }

                    NavigationLink(destination: MainPageView()) {
                        ListRowView(
                            title: "Recently Deleted",
                            icon: "trash",
                            color: .yellow,
                            count: 0
                        )
                    }
                } header: {
                    // Custom Header for iCloud
                    HStack {
                        Text("iCloud")
                            .font(.title2).bold()
                            .foregroundStyle(Color.NBCK)
                    }
                }
                Section(isExpanded: $isAcademyMailExpanded) {
                    NavigationLink(destination: UovoView()) {
                        ListRowView(
                            title: "Notes",
                            icon: "folder",
                            color: .yellow,
                            count: 999
                        )
                    }
                } header: {
                    Text("Santo's Mɑil").bold()
                        .font(.title2)
                        .foregroundStyle(Color.NBCK)
                }
            }
            .listStyle(.sidebar)
            .navigationTitle("Folders")
            .searchable(text: $searchText, placement: .toolbar)
            .toolbar {

                ToolbarItemGroup(placement: .topBarTrailing) {
                    Button {

                    } label: {
                        Image(systemName: "folder.badge.plus")
                            .foregroundStyle(Color.NBCK)
                    }
                }

                ToolbarSpacer(.fixed, placement: .topBarTrailing)

                ToolbarItemGroup(placement: .topBarTrailing) {
                    Button {

                    } label: {
                        Text("Edit")
                            .foregroundStyle(Color.NBCK)
                    }

                }

                DefaultToolbarItem(kind: .search, placement: .bottomBar)
                //spacer
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
        }
    }
}

// --- Reusable Row View ---
struct ListRowView: View {
    let title: String
    let icon: String
    let color: Color
    let count: Int

    var body: some View {
        HStack {
            Label {
                Text(title)
            } icon: {
                Image(systemName: icon)
                    .foregroundStyle(color)
            }

            Spacer()

            Text("\(count)")
                .foregroundStyle(.secondary)
        }
    }
}

#Preview {
    PreMainView()
}
