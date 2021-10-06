//
//  Album.swift
//  TechImage
//
//  Created by YUKI on 2021/10/05.
//

import SwiftUI

struct Album: View {
    var body: some View {
        
        NavigationView {
            VStack {
                AlbumView(
                    name: "全ての項目",
                    path: "",
                    isFavorite: false
                )
                
                AlbumView(
                    name: "お気に入り",
                    path: "",
                    isFavorite: true
                )
            }
            .navigationBarTitle(Text("アルバム"))
        }
        
    }
}

struct Album_Previews: PreviewProvider {
    static var previews: some View {
        Album()
    }
}
