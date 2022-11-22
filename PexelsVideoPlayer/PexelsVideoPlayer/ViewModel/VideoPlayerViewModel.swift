//
//  VideoPlayerViewModel.swift
//  PexelsVideoPlayer
//
//  Created by Ahmed Amin on 22/11/2022.
//

import Foundation


final class VideoPlayerViewModel: ObservableObject {
    
    @Published private(set) var videos: [Video] = []
    @Published var selectedQuery: Query = .natural {
        didSet {
            Task.init {
                await findVideos(from: selectedQuery)
            }
        }
    }
    
    init() {
        Task.init {
            await findVideos(from: selectedQuery)
        }
    }
    
    func findVideos(from query: Query) async {
        do {
            guard let url = URL(string: "https://api.pexels.com/videos/search?query=\(query.rawValue)&per_page=1&orientation=portrait") else { fatalError("Missing URL") }
            
            var request = URLRequest(url: url)
            request.setValue("563492ad6f91700001000001df8ffd693f0e4f66ae23207284dfa266", forHTTPHeaderField: "Authorization")
            
           let (data, response) = try await URLSession.shared.data(for: request)
                    
            guard (response as? HTTPURLResponse)?.statusCode == 200 else { return print("Status code not valid")}
            
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let decodedData = try decoder.decode(SearchForVideosModel.self, from: data)
            
            self.videos.removeAll()
            self.videos = decodedData.videos ?? []
            
        } catch {
            print("Error while fetching the pexels data ", error.localizedDescription)
        }
    }
}
