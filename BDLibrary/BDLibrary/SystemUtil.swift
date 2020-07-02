//
//  SystemUtil.swift
//  BDLibrary
//
//  Created by 李秉達 on 2020/7/2.
//  Copyright © 2020 李秉達. All rights reserved.
//

import Foundation
import UIKit

public final class SystemUtil {
    public static let SCREEN_SIZE = UIScreen.main.bounds.size
    public static let SCREEN_WIDTH = UIScreen.main.bounds.size.width
    public static let SCREEN_HEIGHT = UIScreen.main.bounds.size.height
}

public extension UIWindow {
    // xocde 11以後無法作用
    //static let keyWindow = UIApplication.shared.windows.filter {$0.isKeyWindow}
    static var currentWindow: UIWindow? {
        let arrWindow = UIApplication.shared.windows
        for win in arrWindow {
            if win.gestureRecognizers != nil, win.isHidden == false {
                return win
            }
        }
        
        return UIApplication.shared.windows.first
    }
    
    static var topWindow: UIWindow? {
        return UIApplication.shared.windows.last
    }
}

public extension UIScreen {
    static let SIZE: CGSize = UIScreen.main.bounds.size
    static let WIDTH: CGFloat = UIScreen.main.bounds.size.width
    static let HEIGHT: CGFloat = UIScreen.main.bounds.size.height
    
    @available(iOS 11.0, *) static let SAFE_AREA_TOP: CGFloat = UIWindow.currentWindow?.safeAreaInsets.top ?? 0
    @available(iOS 11.0, *) static let SAFE_AREA_BOTTOM: CGFloat = UIWindow.currentWindow?.safeAreaInsets.bottom ?? 0
    
    // 暫存
    @available(iOS 11.0, *) static let WIN0_SAFE_AREA_TOP: CGFloat = UIApplication.shared.windows[0].safeAreaInsets.top
    @available(iOS 11.0, *) static let WIN0_SAFE_AREA_BOTTOM: CGFloat = UIApplication.shared.windows[0].safeAreaInsets.bottom
}

public extension Bundle {
    //Bundle.main.infoDictionary  //取得第三方app bundle
    //Bundle(for: type(of: self)).infoDictionary //取得framework bundle
    //Bundle(identifier: "com.nhi.MHBSdk") //取得framework bundle
    
    var bID: String {
        return object(forInfoDictionaryKey: "CFBundleIdentifier") as! String
    }
    
    var bName: String {
        return object(forInfoDictionaryKey: "CFBundleName") as! String
    }
    
    var bDisplayName: String {
        return object(forInfoDictionaryKey: "CFBundleDisplayName") as! String
    }

    var bVersion: String {
        return object(forInfoDictionaryKey: "CFBundleShortVersionString") as! String
    }
    
    var bBuildVersion: String {
        return object(forInfoDictionaryKey: "CFBundleVersion") as! String
    }
}

public func makeAPhoneCall(strPhoneNumber: String) -> Bool {
    var strPhone = strPhoneNumber.replacingOccurrences(of: "#", with: ",")
    strPhone = strPhone.replacingOccurrences(of: "@", with: ",")
    strPhone = strPhone.replacingOccurrences(of: "轉", with: ",")
    strPhone = strPhone.replacingOccurrences(of: "-", with: "")

//    let charSet = NSMutableCharacterSet()
//    charSet.formUnion(with: .whitespaces)
//    charSet.formUnion(with: .punctuationCharacters)
//    charSet.formUnion(with: .symbols)
    
//    let arrayWithNumbers = strPhone.components(separatedBy: charSet as CharacterSet)
//    strPhone = arrayWithNumbers.joined(separator: "")
//    if strPhone == "" {
//        return false
//    }
    
    if let url = URL(string: "telprompt://\(strPhone)"), UIApplication.shared.canOpenURL(url) {
        if #available(iOS 10, *) {
            UIApplication.shared.open(url)
        } else {
            UIApplication.shared.openURL(url)
        }
        return true
    } else {
        return false
    }
}
