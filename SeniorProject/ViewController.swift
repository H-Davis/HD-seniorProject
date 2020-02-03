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
    //The outlets, the names for the different input I take in from the user
    @IBOutlet weak var txt_keywords: NSTextField!
    @IBOutlet weak var chk_saveWallpapers: NSButton!
    @IBOutlet weak var scheduleOptions: NSPopUpButton!
    @IBOutlet weak var thirtySec: NSMenuItem!
    @IBOutlet weak var oneMin: NSMenuItem!
    @IBOutlet weak var fiveMin: NSMenuItem!
    var wallpaperTimer = Timer()
    
    func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear()
        wallpaperTimer.invalidate()
    }
    
    @IBAction @objc func apply(_ sender: Any) {
        //Decides where to put the wallpaper, base on the save wallpapers check box
        let rootPath = (chk_saveWallpapers.state == .on) ? self.getSaveLocation() : self.getTempLocation()
        //calls the retrieve messade using the correct root path, sets its ass the background
        self.retrieveImage(imagePath: rootPath) { result in
            self.setAsBackground(imagePath: result)
        }
        //Starts a new timer after the apply button is pushed
        self.initializeTimer()
    }
    
    func getTempLocation() -> URL? {
        //The location for the photos if the saveWallpapers is not checked
        //self.createTempFolder()
        do  {
            let url = try FileManager.default.url(for: .itemReplacementDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
            return url.appendingPathComponent("UglyWallpapers")
        }
        catch {
            print("Temporary Location does not exist!")
        }
        
        return nil;
    }
    
    func getSaveLocation() -> URL? {
        //The location for the photos if the saveWallpapers is checked
        self.createFolder()
        do  {
            let url = try FileManager.default.url(for: .downloadsDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
            return url.appendingPathComponent("UglyWallpapers")
        }
        catch {
            print("Unable to access save location!")
        }
        
        return nil;
    }
    
    func retrieveImage(imagePath : URL?, completion: ((URL) -> (Void))?) {
        //gives unique names to the image
        let imageName = UUID().uuidString
        //adds .jpg to the end of the imageName
        let destinationURL = imagePath!.appendingPathComponent(imageName + ".jpg")
        
        //Create URL to the source file you want to download
        //retrieves the typed word from the user
        let keywords = txt_keywords.stringValue
        //takes in the scrren size
        let screenSize = String(format: "%dx%d", Int(NSScreen.main!.frame.width), Int(NSScreen.main!.frame.height))
        //Unsplash URL to actually retrieve the image
        let unsplashURL = "https://source.unsplash.com/"
        let slashQuestion = "/?"
        //adds all the components to complete the request to the online unsplah API, inorder to retrieve the //correct image
        let fileURL = URL(string: unsplashURL + screenSize + slashQuestion + keywords)
        
        let sessionConfig = URLSessionConfiguration.default
        let session = URLSession(configuration: sessionConfig)
        let request = URLRequest(url: fileURL!)
       
        // Code below is basically letting me know the status of the download of the image
        let task = session.downloadTask(with: request) { (tempLocalUrl, response, error) in
            if let tempLocalUrl = tempLocalUrl, error == nil {
                // Success
                if let statusCode = (response as? HTTPURLResponse)?.statusCode {
                    print("Successfully downloaded. Status code: \(statusCode)")
                }
                
                do {
                    try FileManager.default.copyItem(at: tempLocalUrl, to: destinationURL)
                    
                    completion?(destinationURL)
                    
                } catch (let writeError) {
                    print("Error creating a file \(destinationURL) : \(writeError)")
                }
                
            } else {
                print("Error took place while downloading a file. Error description: %@", error!.localizedDescription);
            }
            
        }
        
        task.resume()
    }
    
    func setAsBackground(imagePath : URL) {
        //sets the given image as the background, if unable it sends an error message to the console
        do
        {
            try NSWorkspace.shared.setDesktopImageURL(imagePath, for: NSScreen.main!, options: [:])
        }
        catch
        {
            print("Unable to set background!")
        }
    }
    
    func initializeTimer() {
        //if timer is currrently on, it turns it off
        if (wallpaperTimer.isValid) {
            wallpaperTimer.invalidate()
        }
        //logic for the timer, executes the apply function every amount of seconds, the time interval is retrieved //from the getSwitchInterval function
        wallpaperTimer = Timer.scheduledTimer(timeInterval: TimeInterval(self.getSwitchInterval(scheduleOptions: self.scheduleOptions)), target: self, selector: #selector(apply(_:)), userInfo: nil, repeats: false)
    }
    
    func getSwitchInterval(scheduleOptions: NSPopUpButton) -> Int {
        //gets the interval that the user selects from the drop down menu
        let minAmount = scheduleOptions.indexOfSelectedItem
        switch minAmount {
            case 0:
                //return 30
                return 5 //Should be returning 30 for 30 secs, but For Demo Day these are set to shorter time intervals
            case 1:
                //return 60
                return 10 ////Should be returning 60 for 1 minute, but For Demo Day these are set to shorter time intervals
            case 2:
                //return 300 
                return 15 //Should be returning 300 for 5 minutes, but For Demo Day these are set to shorter time intervals
            default:
                return 1800 //Default time interval is 30 minutes
        }
    }
    
    func createFolder() {
        //Creates the "UglyWallpaers" folder
        let downloadsDirectory = FileManager.default.urls(for: .downloadsDirectory, in: .userDomainMask).first!
        let downloadsDirectoryWithFolder = downloadsDirectory.appendingPathComponent("UglyWallpapers")

        do {
            try FileManager.default.createDirectory(at: downloadsDirectoryWithFolder, withIntermediateDirectories: true, attributes: nil)
        } catch let error as NSError {
            print(error.localizedDescription)
        }
    }
//    func createTempFolder() {
//        //Creates the "UglyWallpaers" folder
//        //let tempDirectory = FileManager.default.urls(for: .itemReplacementDirectory, in: .userDomainMask).first!
//        //let tempDirectoryWithFolder = tempDirectory.appendingPathComponent("UglyWallpapers")
//        let temporaryDirectoryURL = URL(fileURLWithPath: NSTemporaryDirectory(),
//            isDirectory: true)
//
//        do {
//            try FileManager.default.createDirectory(at: temporaryDirectoryURL, withIntermediateDirectories: true, attributes: nil)
//        } catch let error as NSError {
//            print(error.localizedDescription)
//        }
//    }

}


