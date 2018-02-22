//
//  BitUtils.swift
//  Common
//
//  Created by CAO XUAN PHONG on 1/26/18.
//  Copyright © 2018 FioT. All rights reserved.
//

import UIKit

class BitUtils: NSObject {
    
    class func setBit(byte : UInt8, position: UInt8, val: UInt8) -> UInt8 {
        var number = byte
        
        number  = (number & (~(1 << position))) | (val << position)
        
        return number
    }
    
    class func getBit(byte: UInt8, position: UInt8) -> UInt8 {
        return ((byte >> position)  & 0x01)
    }
    
    class func toBinaryString(byte: UInt8) {
        let str = String(byte, radix: 2)
        print ("bits: \(str)")
    }

}
