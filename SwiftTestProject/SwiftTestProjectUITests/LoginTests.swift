//
//  LoginTests.swift
//  SwiftTestProjectUITests
//
//  Created by 李秉達 on 2019/12/30.
//  Copyright © 2019 李秉達. All rights reserved.
//

import Foundation

import KIF
 
class LoginTests : KIFTestCase {
 

    func testEmptyUsernameAndPassword() {
//      clearOutUsernameAndPasswordFields()
        tapButton(buttonName: "Ramdom")
//        expectToSeeAlert(text: "Username cannot be empty")
//        tapButton(buttonName: "OK")
    }

 func clearOutUsernameAndPasswordFields() {
    tester().clearTextFromView(withAccessibilityLabel: "Login - Username")
    tester().clearTextFromView(withAccessibilityLabel: "Login - Password")
 }

    func tapButton(buttonName: String) {
        tester().tapView(withAccessibilityLabel: buttonName)
    }

    func expectToSeeAlert(text: String) {
        tester().waitForView(withAccessibilityLabel: text)
    }
}
