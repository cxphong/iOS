//
//  File-Utils.swift
//  iOS-BLE-Library
//
//  Created by Cao Xuan Phong on 9/18/17.
//  Copyright © 2017 FioT. All rights reserved.
//

import UIKit

class FileUtils: NSObject {

    class func listDocumentsFiles() -> NSMutableArray {
        var files = NSMutableArray()
        
        // Get the document directory url
        let documentsUrl =  FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        
        do {
            // Get the directory contents urls (including subfolders urls)
            files = try FileManager.default.contentsOfDirectory(at: documentsUrl, includingPropertiesForKeys: nil, options: []) as! NSMutableArray
           // print(directoryContents)
            
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        
        return files
    }
    
    class func getFileSize(_ url : URL) -> Int {
        var size = 0
        
        do {
            let resources = try url.resourceValues(forKeys:[.fileSizeKey])
            size = resources.fileSize!
            print ("size \(size)")
        } catch {
            print("Error: \(error)")
        }
        
        return size
    }
    
    class func sizeToHuman(size : UInt64) -> String {
        print ("sizeToHuman \(size)")
        
        let gigabyte : UInt64 = 1024 * 1024 * 1024 * 1024
        
        if (size < 1024) {
            return String(format: "%d bytes", size)
        } else if (size < 1024*1024) {
            return String(format: "%.2f KB", Double(size)/1024)
        } else if (size < 1024*1024*1024) {
            return String(format: "%.2f MB", Double(size)/(1024*1024))
        } else if (size < gigabyte) {
            return String(format: "%.2f GB", Double(size)/(1024*1024*1024))
        } else {
            return ""
        }
    }
}
