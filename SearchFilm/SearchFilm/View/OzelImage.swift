//
//  OzelImage.swift
//  SearchFilm
//
//  Created by Muhammet Emin Ayhan on 27.01.2024.
//

import SwiftUI

struct OzelImage: View {
    
    let url : String
    @ObservedObject var imageDowloaderClient = ImageDownloaderClient()
    init(url: String) {
        self.url = url
        self.imageDowloaderClient.gorselIndir(url: self.url)
    }
    var body: some View {
        if let data = self.imageDowloaderClient.indirilenGorsel{
            return Image(uiImage: UIImage(data: data)!)
                .resizable()
        }  else {
            return Image("placeholder")
                .resizable()
        }
    }
}

#Preview {
    OzelImage(url: "https://m.media-amazon.com/images/M/MV5BMDdmZGU3NDQtY2E5My00ZTliLWIzOTUtMTY4ZGI1YjdiNjk3XkEyXkFqcGdeQXVyNTA4NzY1MzY@._V1_SX300.jpg")
}
