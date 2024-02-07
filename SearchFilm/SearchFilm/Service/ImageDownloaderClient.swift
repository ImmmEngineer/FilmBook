//
//  ImageDownloaderClient.swift
//  SearchFilm
//
//  Created by Muhammet Emin Ayhan on 27.01.2024.
//

import Foundation

class ImageDownloaderClient : ObservableObject{
    
    @Published var indirilenGorsel : Data?
    
    func gorselIndir(url : String) {
        
        guard let imageUrl = URL(string: url) else {
            return
        }
        URLSession.shared.dataTask(with : imageUrl) { data, response, error in
            guard let data = data , error == nil else {
                return
            }
            DispatchQueue.main.async {
                self.indirilenGorsel = data
            }
        }.resume()
        
    }
}
