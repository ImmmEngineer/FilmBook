//
//  ContentView.swift
//  SearchFilm
//
//  Created by Muhammet Emin Ayhan on 7.12.2023.
//

import SwiftUI

struct FilmListeView: View {
    
    @ObservedObject var filmListeViewModel : FilmListeViewModel
    @State var aranacakFilm = ""
    init(){
        self.filmListeViewModel = FilmListeViewModel()
        
    }
    var body: some View{
        NavigationView{
            
            VStack{
                TextField("Aranacak Film", text: $aranacakFilm, onEditingChanged: { _ in}) {
                    self.filmListeViewModel.filmAramasiYap(filmIsmi: aranacakFilm.trimmingCharacters(in: .whitespacesAndNewlines).addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? aranacakFilm)
                    
                }.padding().textFieldStyle(RoundedBorderTextFieldStyle())
                List(filmListeViewModel.filmler, id: \.imdbId) {
                    film in
                    NavigationLink(
                        destination: DetayView(imdbId: film.imdbId),
                        label: {
                            HStack{
                                OzelImage(url: film.poster)
                                    .frame(width: 90,height: 130)
                                VStack(alignment: .leading){
                                    Text(film.title)
                                        .font(.title3)
                                        .foregroundColor(.blue)
                                    
                                    Text(film.year)
                                        .foregroundColor(.orange)
                                    
                                }
                            }
                    })
                    
                }.navigationTitle(Text("Film Kitabı"))
            }
        }}
}

#Preview {
    FilmListeView()
}
