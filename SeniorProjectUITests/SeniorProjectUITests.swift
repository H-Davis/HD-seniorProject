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
        let app = XCUIApplication.self
        let app = XCUIApplication.self
        //create location for the folder
        let downloadsUrl =  FileManager.default.homeDirectoryForCurrentUser
        let imagePath = "Downloads"
        let photoLocation = downloadsUrl.appendingPathComponent(imagePath)

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

    func testExample() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testFolderIsCreatedOnClick(){
        testFolderIsCreated(){
            //create the folder
            untitledWindow.["create"].click()
            //Assert that folder does exist
            XCTAssertNil(contentsOfDirectory(photoLocation))
    }
    
    func testFolderHasOnePhotoOnClcik(){
        //create folder
        //Assert that photo was in folder added on button click
    }
    
    func testPhotoIsSetAsBackgroundOnClick(){
        //create folder
        //add photo
        //Assert that photo was added as background on button click
    }
    
    func testPhotoIsDeletedFromFolder(){
        
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
