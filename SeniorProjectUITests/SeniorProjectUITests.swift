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
    
    func testFolderIsCreatedOnClick(){
        //setup
        let window = XCUIApplication().windows["Window"]
        let fileManager = FileManager.default
        let downloadsDirectory = FileManager.default.urls(for: .downloadsDirectory, in: .userDomainMask).first!
        let downloadsDirectoryString = downloadsDirectory.path
        //create folder
        window.buttons["Create Folder"].click()
        //Assert that folder  was added on button click
        XCTAssertTrue(fileManager.fileExists(atPath: downloadsDirectoryString))
    }
    
    func testFolderHasOnePhotoOnClick(){
//        let window = XCUIApplication().windows["Window"]
//        let fileManager = FileManager.default
//        let downloadsDirectory = FileManager.default.urls(for: .downloadsDirectory, in: .userDomainMask).first!
//        let downloadsDirectoryString = downloadsDirectory.path
//        //create folder
//        window.buttons["Create Folder"].click()
//        //Assert that photo was in folder added on button click
//        XCTAssertEqual(downloadsDirectoryString, "UnsplashImages")
    }
    
    func testPhotoIsSetAsBackgroundOnClick(){
        //create folder
        //add photo
        //Assert that photo was added as background on button click
    }
    
   
        
    func testPhotoIsDeletedFromFolder(){
            //create folder
            //add photo
            //Photo was added as background o button click
            //Assert that photo was deleted from folder
    }
    
    func testTextfieldIsCorrect(){
    }
    
    func testDimensionsAreCorrect(){
        
    }
    
    
}
