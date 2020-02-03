//
//  SeniorProjectUITests.swift
//  SeniorProjectUITests
//
//  Created by Hananiah Davis on 10/21/19.
//  Copyright © 2019 HananiahDavis. All rights reserved.
//

import XCTest
@testable import SeniorProject



class SeniorProjectUITests: XCTestCase {
    
    

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()
        

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        
        super.tearDown()
    }
    
    /// UI Elements and Actions

//    let window = XCUIApplication().windows["Window"]
//    let separateListByCommaEGCityBostonTextField = window.textFields["Separate list by comma(e.g. city,boston)"]
//    separateListByCommaEGCityBostonTextField.click()
//    separateListByCommaEGCityBostonTextField.typeText("tree")
//
//    let enterScreenSSizeEG1440x900TextField = window.textFields["Enter screen's size (e.g. 1440x900)"]
//    enterScreenSSizeEG1440x900TextField.click()
//    enterScreenSSizeEG1440x900TextField.typeText("1440x900")
//    window.buttons["Save Image"].click()
//    window.buttons["Apply"].click()
//    window.buttons[XCUIIdentifierCloseWindow].click()
///
    //        let keyword = window.textFields["Separate list by comma(e.g. city,boston)"]
    //        keyword.click()
    //        keyword.typeText("tree")
    //        let screenSize = window.textFields["Enter screen's size (e.g. 1440x900)"]
    //        screenSize.click()
    //        screenSize.typeText("1440x900")
    
    func testFolderExists(){
        let downloadsDirectory = FileManager.default.urls(for: .downloadsDirectory, in: .userDomainMask).first!
        let downloadsDirectoryWithFolder = downloadsDirectory.appendingPathComponent("UglyWallpapers")
        XCTAssertTrue(fileExists(atPath: downloadsDirectoryWithFolder))
    }
    
    func testPhotoIsSaved(){
        
    }
    
    func testPhotoIsSetAsBackground(){
  
    }
    
    
    func testTextfieldIsCorrect(){
    }
    
    func testDimensionsAreCorrect(){
        
    }
    
    
}
