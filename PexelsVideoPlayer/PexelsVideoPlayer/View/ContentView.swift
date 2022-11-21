//
//  ContentView.swift
//  PexelsVideoPlayer
//
//  Created by Ahmed Amin on 21/11/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            HStack {
                ForEach(Query.allCases, id: \.self) { querySearch in
                    QueryTagView(query: querySearch, isSelected: false)
                }
            }
            
            ScrollView {
                VideoCardView(video: previewVideo)
            }
            .frame(maxWidth: .infinity)
            
        }
        .background(Color("AccentColor"))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
