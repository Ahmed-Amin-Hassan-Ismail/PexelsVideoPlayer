//
//  ContentView.swift
//  PexelsVideoPlayer
//
//  Created by Ahmed Amin on 21/11/2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject var videoPlayerMV = VideoPlayerViewModel()
    private let gridItem: [GridItem] = [GridItem(.adaptive(minimum: 160), spacing: 20)]
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    ForEach(Query.allCases, id: \.self) { querySearch in
                        QueryTagView(query: querySearch,
                                     isSelected: videoPlayerMV.selectedQuery == querySearch)
                        .onTapGesture {
                            videoPlayerMV.selectedQuery = querySearch
                        }
                    }
                }
                
                ScrollView {
                    if videoPlayerMV.videos.isEmpty {
                        Spacer(minLength: 300)
                        ProgressView()
                        
                    } else {
                        LazyVGrid(columns: gridItem, spacing: 20) {
                            ForEach(videoPlayerMV.videos) { video in
                                NavigationLink {
                                    VideoView(video: video)
                                } label: {
                                    VideoCardView(video: video)
                                }
                                
                            }
                        }
                        .padding()
                    }
                }
                .frame(maxWidth: .infinity)
                
            }
            .background(Color("AccentColor"))
            .toolbar(.hidden)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
