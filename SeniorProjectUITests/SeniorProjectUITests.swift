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
    
    func testFolderExists(){
        let fileManager = FileManager.default
        let downloadsDirectory = FileManager.default.urls(for: .downloadsDirectory, in: .userDomainMask).first!
        let downloadsDirectoryWithFolder = downloadsDirectory.appendingPathComponent("UglyWallpapers")
        
        do {
            try FileManager.default.createDirectory(at: downloadsDirectoryWithFolder, withIntermediateDirectories: true, attributes: nil)
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        let path:String = downloadsDirectoryWithFolder.path
        
        XCTAssertTrue(fileManager.fileExists(atPath: path))
    }
    
    func testPhotoIsSaved(){
        let downloadsDirectory = FileManager.default.urls(for: .downloadsDirectory, in: .userDomainMask).first!
        let downloadsDirectoryWithFolder = downloadsDirectory.appendingPathComponent("UglyWallpapers")
        
        do {
            try FileManager.default.createDirectory(at: downloadsDirectoryWithFolder, withIntermediateDirectories: true, attributes: nil)
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        let path:String = downloadsDirectoryWithFolder.path
        
        let window = XCUIApplication().windows["Window"]
        window.textFields["Separate list by comma(e.g. city,boston)"].typeText("fire")
        window.buttons["Apply"].click()
        window.buttons[XCUIIdentifierCloseWindow].click()
        XCTAssertNotNil(try FileManager.default.contentsOfDirectory(atPath: path))
    }
    
    func testPhotoIsSetAsBackground(){
    }
    
    
    func testTextfieldIsCorrect(){
    
    }
    
    func testTimeIntervals(){
        
    }
    
    
}
