//
//  VideoView.swift
//  PexelsVideoPlayer
//
//  Created by Ahmed Amin on 22/11/2022.
//

import SwiftUI
import AVKit

struct VideoView: View {
    var video: Video
    @State private var player: AVPlayer = AVPlayer()
    
    var body: some View {
        VideoPlayer(player: player)
            .edgesIgnoringSafeArea(.all)
            .onAppear {
                guard let link = video.videoFiles?.first?.link,
                let url = URL(string: link) else { return }
                
                player = AVPlayer(url: url)
                player.play()
            }
            .onDisappear {
                player.pause()
            }
    }
}

struct VideoView_Previews: PreviewProvider {
    static var previews: some View {
        VideoView(video: previewVideo)
    }
}
