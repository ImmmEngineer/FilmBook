//
//  DetayView.swift
//  SearchFilm
//
//  Created by Muhammet Emin Ayhan on 28.01.2024.
//

import SwiftUI

struct DetayView: View {
    
    let imdbId : String
    
    @ObservedObject var filmDetayViewModel = FilmDetayViewModel()
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            HStack{
                Spacer()
                OzelImage(url: filmDetayViewModel.FilmDetayi?.poster ?? "")
                    .frame(width: UIScreen.main.bounds.width * 0.6 , height: UIScreen.main.bounds.height * 0.3, alignment: .center)
                Spacer()
            }
            
            Text(filmDetayViewModel.FilmDetayi?.title ?? "Film İsmi Gosterilecek").foregroundStyle(.blue).padding()
            Text(filmDetayViewModel.FilmDetayi?.plot ?? "Film Plotu Gösterilecek").padding()
            Text("Yönetmen : \(filmDetayViewModel.FilmDetayi?.director ?? "Yönetmen Gösterilecek")").padding()
            Text("Yazar : \(filmDetayViewModel.FilmDetayi?.writer ?? "Yazar Gösterilecek")").padding()
            Text("Ödüller : \(filmDetayViewModel.FilmDetayi?.awards ?? "Ödüller Gösterilecek")").padding()
            Text("Yıl : \(filmDetayViewModel.FilmDetayi?.writer ?? "Yıl Gösterilecek")").padding()
            Spacer()
        }.onAppear(perform: {
            self.filmDetayViewModel.filmDetayiAl(imdbId: imdbId)
        })
    }
}

#Preview {
    DetayView(imdbId: "test")
}
