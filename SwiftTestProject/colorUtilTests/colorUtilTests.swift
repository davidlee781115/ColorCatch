//
//  colorUtilTests.swift
//  colorUtilTests
//
//  Created by 李秉達 on 2019/12/30.
//  Copyright © 2019 李秉達. All rights reserved.
//

import XCTest
@testable import SwiftTestProject
var vc:MainVC!
class colorUtilTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        vc = MainVC(nibName: "MainVC", bundle: nil)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
//    func testIsUnlockSuccess()  {
//        measure {
//            for n1 in 0..<10 {
//                for n2 in 0..<10 {
//                    let isUnlockEnable = vc!.isUnlockSuccess(n1: n1, n2: n2)
//                    if(n1 == 3 && n2 == 7){
//                        XCTAssert(isUnlockEnable == true)
//                    }else{
//                        XCTAssert(isUnlockEnable == false, "\(n1) - \(n2) 解鎖了")
//                    }
//                }
//            }
//        }
//
//    }
    



}
