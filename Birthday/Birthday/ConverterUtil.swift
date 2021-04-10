//
//  ConverterUtil.swift
//  Birthday
//
//  Created by 古堅ニノスカ on 2020/09/22.
//
import UIKit

// 日付操作を管理するクラス
final class ConverterUtil {
    
    // コンストラクタ
    private init() {
        
    }
    
    // 生年月日から年齢を算出して取得する
    static func getAge(year: Int, month: Int, dayOfMonth: Int) -> Int {
        var age = 0
        let today = Date()
        let birthday = Calendar(identifier: .gregorian).date(from: DateComponents(year: year, month: month, day: dayOfMonth))!
        age = Calendar(identifier: .gregorian).dateComponents([.year, .month, .day], from: birthday, to: today).year!
        return age
    }
}
