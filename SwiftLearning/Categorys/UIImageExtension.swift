//
//  UIImageExtension.swift
//  SwiftLearning
//
//  Created by 邓光洋 on 2019/3/1.
//  Copyright © 2019 邓光洋. All rights reserved.
//
#if os(iOS) || os(tvOS) || os(macOS)

import UIKit

extension UIImage {
    
    public var base64: String {
        //UIImageJPEGRepresentation  image.jpegData(compressionQuality:)
        return self.jpegData(compressionQuality: 1.0)!.base64EncodedString()
    }
    
    public func compressImage(rate: CGFloat) -> Data? {
        return self.jpegData(compressionQuality: rate)
    }
    
    public func getSizeAsBytes() -> Int {
        return self.jpegData(compressionQuality: 1)?.count ?? 0
    }
    
    public func getSizdAsKilobytes() -> Int {
        let sizeAsBytes = getSizeAsBytes()
        return (sizeAsBytes != 0) ? sizeAsBytes / 1024 : 0
    }
    
    
    public class func scaleTo(image: UIImage, w: CGFloat, h: CGFloat) -> UIImage {
        let newSize = CGSize(width: w, height: h)
        UIGraphicsBeginImageContextWithOptions(newSize, false, 0.0)
        image.draw(in: CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height))
        let newImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return newImage
    }
    
    //传入宽，返回image
    public func resizeWithWidth(_ width: CGFloat) -> UIImage {
        let aspectSize = CGSize(width: width, height: aspectHeightForWidth(width))
        UIGraphicsBeginImageContext(aspectSize)
        self.draw(in: CGRect(origin: CGPoint.zero, size: aspectSize))
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
    
    //传入高，返回image
    public func resizeWithHeight(_ height: CGFloat) -> UIImage {
        let aspectSize = CGSize(width: aspectWidthForHeight(height), height: height)
        UIGraphicsBeginImageContext(aspectSize)
        self.draw(in: CGRect(origin: CGPoint.zero, size: aspectSize))
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
    
    public func aspectHeightForWidth(_ width: CGFloat) -> CGFloat {
        return (width * self.size.height) / self.size.width
    }
    
    public func aspectWidthForHeight(_ height: CGFloat) -> CGFloat {
        return (height * self.size.width) / self.size.height
    }
    
    public func croppendImage(_ bound: CGRect) -> UIImage? {
        guard self.size.width > bound.origin.x else {
            print(": Your cropping X coordinate is larger than the image width")
            return nil
        }
        guard self.size.height > bound.origin.y else {
            print(": Your cropping Y coordinate is larger than the image height")
            return nil
        }
        let scaledBounds: CGRect = CGRect(x: bound.origin.x * self.scale,
                                          y: bound.origin.y * self.scale,
                                          width: bound.width * self.scale,
                                          height: bound.height * self.scale)
        let imageRef = self.cgImage?.cropping(to: scaledBounds)
        //UIImageOrientation.up 已经废弃，需要替换成 Orientation.up 或 .up
        let croppedImage: UIImage = UIImage(cgImage: imageRef!,
                                            scale: self.scale,
                                            orientation: Orientation.up)
        return croppedImage
    }
    
    public func withColor(_ tintColor: UIColor) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(self.size, false, self.scale)
        
        let context = UIGraphicsGetCurrentContext()
        context?.translateBy(x: 0, y: self.size.height)
        context?.scaleBy(x: 1.0, y: -1.0)
        context?.setBlendMode(CGBlendMode.normal)
        
        let rect = CGRect(x: 0, y: 0, width: self.size.width, height: self.size.height) as CGRect
        context?.clip(to: rect, mask: self.cgImage!)
        tintColor.setFill()
        context?.fill(rect)
        
        let newImage = UIGraphicsGetImageFromCurrentImageContext()! as UIImage
        UIGraphicsEndImageContext()
        
        return newImage
    }
    
    //MARK: 根据url来创建image
    public convenience init?(urlString: String) {
        guard let url = URL(string: urlString) else {
            self.init(data: Data())
            return
        }
        
        guard let data = try? Data(contentsOf: url) else {
            print("No image in URL \(urlString)")
            self.init(data: Data())
            return
        }
        self.init(data: data)
    }
    
    public class func blankImage() -> UIImage {
        UIGraphicsBeginImageContextWithOptions(CGSize(width: 1, height: 1), false, 0.0)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
}

#endif
