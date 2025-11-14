//
//  PreMainView.swift
//  2ndChallenge
//
//  Created by Crescenzo Di Franco on 10/11/25.
//

import SwiftUI

struct PreMainView: View {
    @State private var isExpanded: Bool = false
    @State private var isExpanded2: Bool = false
    
    var body: some View {
        NavigationStack {
            DisclosureGroup("iCloud", isExpanded: $isExpanded){
                NavigationStack{
                        
                        NavigationLink{
                            MainPageView()
                        }
                    label:
                        {
                            HStack{
                                Image(systemName: "folder").foregroundStyle(Color.yellow)
                                Text("Notes").foregroundStyle(Color.NBCK)
                            }
                        }
                    NavigationLink{
                        MainPageView()
                    }
                label:
                    {
                        HStack{
                            Image(systemName: "trash").foregroundStyle(Color.yellow)
                            Text("Recently Deleted").foregroundStyle(Color.NBCK)
                        }
                    }
                    
                        
                    
                }
            }
            .foregroundStyle(Color.NBCK)
            .font(Font.title2.bold())
            .navigationTitle("Folders").fontWeight(.bold)
            .padding(.bottom, 575)
            .padding(.leading, 15)
            .padding(.trailing, 15)

        }

    }
}

#Preview {
    PreMainView()
}
