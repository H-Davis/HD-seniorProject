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
    
    @IBOutlet weak var getParameters: NSTextField!
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
    
    
    @IBAction func textFieldAction(_ sender: NSTextField) {
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
        let imagePath = "Downloads/UnsplashImages"
        let destinationFileUrl = downloadsUrl.appendingPathComponent(imagePath).appendingPathComponent("newImage.jpg")
        
        //Create URL to the source file you want to download
        let textFieldString = getParameters.stringValue
        let resolution = "/3840x2160"
        let origFileUrl = "https://source.unsplash.com/featured/?"
        let fileURL = URL(string: origFileUrl + textFieldString + resolution)
        
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
    
    @objc func deleteImageFromFolder(){
        let imagePathForDeletion = "UnsplashImages/newImage.jpg"
        let downloads : [String] = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.downloadsDirectory, FileManager.SearchPathDomainMask.allDomainsMask, true)
        var filePath = ""
        if downloads.count > 0 {
            let downloads = downloads[0] //downloads directory
            filePath = downloads.appendingFormat("/" + imagePathForDeletion)
            print("Local path = \(filePath)")
            
        } else {
            print("Could not find local directory to store file")
            return
        }
        
        
        do {
            let fileManager = FileManager.default
            
            // Check if file exists
            if fileManager.fileExists(atPath: filePath) {
                // Delete file
                try fileManager.removeItem(atPath: filePath)
            } else {
                print("File does not exist")
            }
            
        }
        catch let error as NSError {
            print("An error took place: \(error)")
        }
        
    }
    
//    let date = Date().addingTimeInterval(5)
//    let timer = Timer(fireAt: date, interval: 0, target: self, selector: #selector(setAsBackground(), userInfo: nil, repeats: false)
//    RunLoop.main.add(timer, forMode: .common)
    
    
    @IBAction func setAsBackground(_ sender: Any) {
        let downloadsUrl:URL =  FileManager.default.homeDirectoryForCurrentUser
        let imagePath = "Downloads/UnsplashImages/newImage.jpg"
        let photoLocation = downloadsUrl.appendingPathComponent(imagePath)
        let screens = NSScreen.screens
        let workspace = NSWorkspace.shared
        for i in screens {
            try! workspace.setDesktopImageURL(photoLocation, for: i, options: [:])
        }
        perform(#selector(deleteImageFromFolder), with: nil, afterDelay: 2.0)
    }
}


    


