//
//  File-Utils.swift
//  iOS-BLE-Library
//
//  Created by Cao Xuan Phong on 9/18/17.
//  Copyright © 2017 FioT. All rights reserved.
//

import UIKit

class FileUtils: NSObject {

    class func listDocumentsFiles() -> [URL]? {
        var urls : [URL]?
        
        // Get the document directory url
        let documentsUrl =  getDocumentRootPath()
        
        do {
            // Get the directory contents urls (including subfolders urls)
            urls = try FileManager.default.contentsOfDirectory(at: documentsUrl, includingPropertiesForKeys: nil, options: [])
            
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        
        return urls
    }
    
    class func getDocumentRootPath() -> URL {
        return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
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
    
    class func saveTextFile(text: String, path: String) -> Bool {
        let url = getDocumentRootPath().appendingPathComponent(path)
        let r = FileManager.default.createFile(atPath: url.path,
                                               contents: Data.stringToData(text),
                                               attributes: nil)
        return r
    }
    
    class func readTextFile(path: String) -> String? {
        let url = getDocumentRootPath().appendingPathComponent(path)
        return FileManager.default.contents(atPath: url.path)?.toString()
    }
    
    class func appendTextFile(text: String, path: String) -> Bool {
        let url = getDocumentRootPath().appendingPathComponent(path)
        let fileHandler = FileHandle(forUpdatingAtPath: url.path)
        
        if (fileHandler == nil) {
            return false
        }
        
        fileHandler?.seekToEndOfFile()
        fileHandler?.write(Data.stringToData(text))
        fileHandler?.closeFile()
        
        return true
    }
    
    class func deleteFile(path: String) {
        let url = getDocumentRootPath().appendingPathComponent(path)
        
        do {
            try FileManager.default.removeItem(at: url)
        } catch {
            
        }
    }
    
}
