//
//  ViewController.swift
//  SeniorProject
//
//  Created by Hananiah Davis on 10/21/19.
//  Copyright © 2019 HananiahDavis. All rights reserved.
//

import Cocoa
import AppKit

class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //print("Save button function goes here")

        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
    struct myVariables {
        //global variables
    }
    

    @IBAction func createFolder(_ sender: Any) {
        let downloadsDirectory = FileManager.default.urls(for: .downloadsDirectory, in: .userDomainMask).first!
        let downloadsDirectoryWithFolder = downloadsDirectory.appendingPathComponent("UnsplashImages")
        
        do {
            try FileManager.default.createDirectory(at: downloadsDirectoryWithFolder, withIntermediateDirectories: true, attributes: nil)
        } catch let error as NSError {
            print(error.localizedDescription)
        }
    }
    
    
    @IBAction func saveImage(_ sender: Any) {
        let downloadsUrl:URL =  FileManager.default.homeDirectoryForCurrentUser
        //urls(for: .downloadsDirectory, in: .userDomainMask).first!
        let imagePath = "Downloads/UnsplashImages"
        let destinationFileUrl = downloadsUrl.appendingPathComponent(imagePath).appendingPathComponent("newImage.jpg")
        
        //Create URL to the source file you want to download
        let fileURL = URL(string: "https://source.unsplash.com/featured/?,city")
        
        let sessionConfig = URLSessionConfiguration.default
        let session = URLSession(configuration: sessionConfig)
        
        let request = URLRequest(url:fileURL!)
        
        let task = session.downloadTask(with: request) { (tempLocalUrl, response, error) in
            if let tempLocalUrl = tempLocalUrl, error == nil {
                // Success
                if let statusCode = (response as? HTTPURLResponse)?.statusCode {
                    print("Successfully downloaded. Status code: \(statusCode)")
                }
                
                do {
                    try FileManager.default.copyItem(at: tempLocalUrl, to: destinationFileUrl)
                } catch (let writeError) {
                    print("Error creating a file \(destinationFileUrl) : \(writeError)")
                }
                
            } else {
                print("Error took place while downloading a file. Error description: %@", error!.localizedDescription);
            }
            
        }
        task.resume()
        
    }
}


    


