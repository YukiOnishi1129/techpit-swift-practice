//
//  ImageData.swift
//  TechImage
//
//  Created by YUKI on 2021/10/06.
//

import Foundation

// Identifiableで定義することで、ListやforEachなので構造体をそのまま使用できる
// 画像情報の構造体
struct ImageInfo: Identifiable {
    let id: Int // Identifiableに必要
    let name: String // ファイル名称
    let path: String // ファイルパス
    let isFavorite: Bool // お気に入り
}

// 画像情報を配列で保持
// MVVMにおけるModelを担当するデータ
let imageInfos: [ImageInfo] = loadImageInfos()
// ~Documentフォルダ内の画像ファイルを全て取得する
func loadImageInfos() -> Array<ImageInfo> {
    
    // NSSearchPathForDirectoriesInDomains: 画像ファイルが保存されているDocumentsフォルダパスを取得する
    let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory,
                                                            .userDomainMask,
    true)[0]
    
    // guard: falseの場合、{}が実行される
    // FileManager.default.contentsOfDirectory()：~/Documentsフォルダ内のファイル名称を全て取得する
    guard var fileNames = try? FileManager.default.contentsOfDirectory(atPath: documentsPath) else {
        return []
    }
    
    // ファイル名称を照準で並べ替え
    // $0: 第一引数
    // $1: 第二引数
    fileNames.sort { $0 < $1 }
    
    // お気に入り情報を取得する
    let favoriteArray: Array<String> = [] // あとで変更します(一旦空配列)
    
    // 画像情報の構造体に設定する
    var imageInfos: Array<ImageInfo> = []
    
    // 全てのファイル情報を配列に設定する
    var idNum = 0
    for name: String in fileNames {
        
        // お気に入りか判定
        var isFavorite = false
        if favoriteArray.contains(name) == true {
            isFavorite = true
        }
        
        // Documentsフォルダパスにファイル名称を追加してファイルパスを作成
        let path = documentsPath + "/" + name
        
        // 構造体を作成
        let imageInfo = ImageInfo(
            id: idNum,
            name: name,
            path: path,
            isFavorite: isFavorite
        )
        
        // 配列に追加
        imageInfos.append(imageInfo)
        
        // ファイル毎に異なるid番号を割り振る為に1つずつ増やす
        idNum += 1
    }
    
    return imageInfos
}
