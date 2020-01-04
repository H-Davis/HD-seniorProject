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
        //setup
        let window = XCUIApplication().windows["Window"]
        let fileManager = FileManager.default
        let downloadsDirectory = FileManager.default.urls(for: .downloadsDirectory, in: .userDomainMask).first!
        let downloadsDirectoryFolder = downloadsDirectory.appendingPathComponent("UnsplashImages")
        let downloadsDirectoryString = downloadsDirectoryFolder.path
        //create folder
        window.buttons["Create Folder"].click()
        //Add photo to folder
        window.buttons["Save Image"].click()
        //Assert that folder  was added on button click
        XCTAssertTrue(fileManager.fileExists(atPath: downloadsDirectoryString))
    }
    
    func testPhotoIsSetAsBackgroundOnClick(){
        //setup
//        let window = XCUIApplication().windows["Window"]
//        let fileManager = FileManager.default
//        let downloadsDirectory = FileManager.default.urls(for: .downloadsDirectory, in: .userDomainMask).first!
//        let downloadsDirectoryFolder = downloadsDirectory.appendingPathComponent("UnsplashImages")
//        let downloadsDirectoryString = downloadsDirectoryFolder.path
//        let downloadsUrl:URL =  FileManager.default.homeDirectoryForCurrentUser
//        let imagePath = "Downloads/UnsplashImages/newImage.jpg"
//        let photoLocation = downloadsUrl.appendingPathComponent(imagePath)
//        let photoLocationPath = photoLocation.path
//        let screens = NSScreen.screens
//        let workspace = NSWorkspace.shared
//        //create folder
//        window.buttons["Create Folder"].click()
//        //Add photo to folder
//        window.buttons["Save Image"].click()
//        let photoPath = workspace.desktopImageURL(for: NSScreen?.main).path
//        // Set as desktop background
//        window.buttons["Apply"].click()
//        //Assert that folder  was added on button click
//        XCTAssertEqual(photoLocationPath, photoPath)
    }
    
   
        
    func testPhotoIsDeletedFromFolder(){
        //setup
        let window = XCUIApplication().windows["Window"]
        let fileManager = FileManager.default
        let downloadsDirectory = FileManager.default.urls(for: .downloadsDirectory, in: .userDomainMask).first!
        let downloadsDirectoryFolder = downloadsDirectory.appendingPathComponent("UnsplashImages")
        let downloadsDirectoryString = downloadsDirectoryFolder.path
        let didFinish = self.expectation(description: #function)
        //create folder
        window.buttons["Create Folder"].click()
        //Add photo to folder
        window.buttons["Save Image"].click()
        //Set as background
    
        window.buttons["Apply"].click()
        didFinish.fulfill()
        wait(for: [didFinish], timeout: 5)
        //Assert that file was deleted
        XCTAssertFalse(fileManager.fileExists(atPath: downloadsDirectoryString))
    }
    
    func testTextfieldIsCorrect(){
    }
    
    func testDimensionsAreCorrect(){
        
    }
    
    
}
