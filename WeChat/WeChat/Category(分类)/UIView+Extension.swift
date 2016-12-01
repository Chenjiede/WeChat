//
//  UIView+Extension.swift
//  WetChat
//
//  Created by BaoLuniOS-3 on 2016/11/3.
//  Copyright © 2016年 BaoLuniOS-3. All rights reserved.
//

import UIKit

extension UIView {
    
    /// x
    var x : CGFloat {
        get {
          
            return frame.origin.x
        }
        
        set {
            var rect = frame
            rect.origin.x = x
            frame = rect
        }
    }
    
    /// y
    var y : CGFloat {
        get {
            return frame.origin.y
        }
        
        set {
            var rect = frame
            rect.origin.y = y
            frame = rect
        }
    }
    
    /// size
    var size : CGSize {
        get {
            return frame.size
        }
        
        set {
            var rect = frame
            rect.size = size
            frame = rect
        }
    }
    
    /// width
    var width : CGFloat {
        get {
            return frame.size.width
        }
        
        set {
            var rect = frame
            rect.size.width = width
            frame = rect
        }
    }
    
    /// height 
    var height : CGFloat {
        get {
            return frame.size.height
        }
        
        set {
            var rect = frame
            rect.size.height = height
            frame = rect
        }
    }
    
}
