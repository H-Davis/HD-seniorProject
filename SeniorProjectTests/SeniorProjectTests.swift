//
//  SeniorProjectTests.swift
//  SeniorProjectTests
//
//  Created by Hananiah Davis on 10/21/19.
//  Copyright © 2019 HananiahDavis. All rights reserved.
//

import XCTest
@testable import SeniorProject

class SeniorProjectTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
        //create location for the folder
//        let downloadsUrl =  FileManager.default.homeDirectoryForCurrentUser
//        let imagePath = "Downloads"
//        let photoLocation = downloadsUrl.appendingPathComponent(imagePath)
        
        
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testNoFolderExists(){
        let fileManager = FileManager.default
        let downloadsDirectory = FileManager.default.urls(for: .downloadsDirectory, in: .userDomainMask).first!
        let downloadsDirectoryString = downloadsDirectory.path
        //Assert that folder  doesn't exist
        XCTAssertFalse(fileManager.fileExists(atPath: downloadsDirectoryString))
        
    }
    
    func testFolderIsCreated(){
        let downloadsDirectory = FileManager.default.urls(for: .downloadsDirectory, in: .userDomainMask).first!
        let fileManager = FileManager.default
        let downloadsDirectoryString = downloadsDirectory.path
        //create the folder
                //untitledWindow.["create"].click()
        //Assert that folder does exist
        //XCTAssertNil(contentsOfDirectory(photoLocation))
    }
    
    func testFolderHasOnePhoto(){
        //create folder
        //Assert that photo was in folder added on button click
    }
    
    func testPhotoIsSetAsBackground(){
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
    
    

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
