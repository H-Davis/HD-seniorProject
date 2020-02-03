//
//  ViewController.swift
//  SeniorProject
//
//  Created by Hananiah Davis on 10/21/19.
//  Copyright © 2019 HananiahDavis. All rights reserved.
//la
import Cocoa
import AppKit

class ViewController: NSViewController {
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
        let rootPath = (chk_saveWallpapers.state == .on) ? self.getSaveLocation() : self.getTempLocation();
        self.retrieveImage(imagePath: rootPath) { result in
            self.setAsBackground(imagePath: result)
        }
        
        self.initializeTimer()
    }
    
    func getTempLocation() -> URL? {
        do  {
            let url = try FileManager.default.url(for: .itemReplacementDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
            return url.appendingPathComponent("UglyWallpapers");
        }
        catch {
            print("Temporary Location does not exist!")
        }
        
        return nil;
    }
    
    func getSaveLocation() -> URL? {
        self.createFolder()
        do  {
            let url = try FileManager.default.url(for: .downloadsDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
            return url.appendingPathComponent("UglyWallpapers");
        }
        catch {
            print("Unable to access save location!")
        }
        
        return nil;
    }
    
    func retrieveImage(imagePath : URL?, completion: ((URL) -> (Void))?) {
        let imageName = UUID().uuidString
        let destinationURL = imagePath!.appendingPathComponent(imageName + ".jpg")
        
        //Create URL to the source file you want to download
        let keywords = txt_keywords.stringValue
        let screenSize = String(format: "%dx%d", Int(NSScreen.main!.frame.width), Int(NSScreen.main!.frame.height))
        let unsplashURL = "https://source.unsplash.com/"
        let slashQuestion = "/?"
        let fileURL = URL(string: unsplashURL + screenSize + slashQuestion + keywords)
        
        let sessionConfig = URLSessionConfiguration.default
        let session = URLSession(configuration: sessionConfig)
        let request = URLRequest(url: fileURL!)
        
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
        if (wallpaperTimer.isValid) {
            wallpaperTimer.invalidate();
        }
        
        wallpaperTimer = Timer.scheduledTimer(timeInterval: TimeInterval(self.getSwitchInterval(scheduleOptions: self.scheduleOptions)), target: self, selector: #selector(apply(_:)), userInfo: nil, repeats: false)
    }
    
    func getSwitchInterval(scheduleOptions: NSPopUpButton) -> Int {
        let minAmount = scheduleOptions.indexOfSelectedItem
        switch minAmount {
            case 0:
                return 30
            case 1:
                return 60
            case 2:
                return 300
            default:
                return 20
        }
    }
    
    func createFolder() {
        let downloadsDirectory = FileManager.default.urls(for: .downloadsDirectory, in: .userDomainMask).first!
        let downloadsDirectoryWithFolder = downloadsDirectory.appendingPathComponent("UglyWallpapers")

        do {
            try FileManager.default.createDirectory(at: downloadsDirectoryWithFolder, withIntermediateDirectories: true, attributes: nil)
        } catch let error as NSError {
            print(error.localizedDescription)
        }
    }

}


