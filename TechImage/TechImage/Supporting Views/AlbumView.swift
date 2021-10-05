//
//  AlbumView.swift
//  TechImage
//
//  Created by YUKI on 2021/10/05.
//

import SwiftUI

struct AlbumView: View {
    
    /*
     * 状態部分
     **/
    // プロパティ (body内でself.nameとかで呼び出せる)
    let name: String
    let path: String
    let isFavorite: Bool
    
    // イニシャライザ
    // 実行時に自動的に定義される (今回は内容を把握するため、あえて定義します。)
    init(name: String, path: String, isFavorite: Bool) {
        self.name = name
        self.path = path
        self.isFavorite = isFavorite
    }
    
    /*
     * 画面部分
     **/
    
    var body: some View {
         // Viewを重ねて表示
        ZStack {
            // Viewをグループ化
            Group {
                // 画像のファイルパスが設定されている場合
                if self.path.count > 0 {
                    
                    // プロパティ値であるself.pathで画像のファイルパスを設定
                    Image(uiImage: UIImage.init(contentsOfFile: self.path)!)
                        // オリジナル画像を表示
                        .renderingMode(.original)
                        // 横幅、高さ、表示位置
                        .frame(width: 100, height: 100, alignment: .center)
                    
                } else {
                    // ファイルパスが設定されていない場合
                    // iOSで使用できるシステムアイコン(四角)を表示
                    Image(systemName: "square.on.square")
                        .renderingMode(.original)
                        .frame(width: 100, height: 100, alignment: .center)
                }
                
                // お気に入りの場合
                if self.isFavorite == true {
                    // ハートを表示
                    Image(systemName: "heart.fill")
                        // 左下に表示
                        .frame(width: 100, height: 100, alignment: .bottomLeading)
                        // ピンク
                        .foregroundColor(.pink)
                }
            }
            // グループ内の要素(ビュー)に余白を追加
            .padding()
            .border(Color.gray, width: 1) // 枠線をグレーに設定
        }
        // ZStack内のビューを角丸
        .cornerRadius(10)
    }
}

struct AlbumView_Previews: PreviewProvider {
    static var previews: some View {
        AlbumView(
            name: "お気に入り",
            path: "",
            isFavorite: true
        )
    }
}
