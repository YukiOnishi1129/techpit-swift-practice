//
//  UserData.swift
//  TechImage
//
//  Created by YUKI on 2021/10/06.
//

import Foundation

// MVVMのViewModelに該当
final class UserData: ObservableObject {
    // imageが変更されると、imageを使用しているView(画面)に通知され、画面内容が変更される仕組み
    @Published var images = imageInfos
}
