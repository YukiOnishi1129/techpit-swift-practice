//
//  Album.swift
//  TechImage
//
//  Created by YUKI on 2021/10/05.
//

import SwiftUI

struct Album: View {
    
    // @EnvironmentObject: userDataクラスを使用できる
    @EnvironmentObject private var userData: UserData
    
    var body: some View {
        
        NavigationView {
            VStack {
                AlbumView(
                    name: "全ての項目",
                    path: self.userData.images.count > 0 ? self.userData.images[0].path : "",
                    isFavorite: false
                )
                
                AlbumView(
                    name: "お気に入り",
                    path: self.userData.images.count > 1 ? self.userData.images[1].path : "",
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
