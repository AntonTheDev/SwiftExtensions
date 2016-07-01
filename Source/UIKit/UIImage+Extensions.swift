//
//  UIImage+Extensions.swift
//

import UIKit

extension UIImage {
    
    //MARK: Resizing
    
    /**
     Returns an new UIImage scaled by the specified transform scale.
     */
    func scaledImage(transformScale: CGFloat) -> UIImage {
        let newSize = CGSizeApplyAffineTransform(self.size, CGAffineTransformMakeScale(transformScale, transformScale))
        UIGraphicsBeginImageContextWithOptions(newSize, false, scale)
        drawInRect(CGRect(origin: CGPointZero, size: newSize))
        let scaledImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return scaledImage
    }
    
    /**
     Returns an new UIImage with the specified size.
     */
    func resizedTo(newSize: CGSize) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(newSize, false, scale)
        drawInRect(CGRect(origin: CGPointZero, size: newSize))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage
    }
    
    //MARK: Cropping
    
    /**
     Returns an new UIImage from the speficied rect.
     */
    func croppedToRect(rect: CGRect) -> UIImage {
        guard let croppedCGImage = CGImageCreateWithImageInRect(self.CGImage, rect) else {
            return self
        }
        return UIImage(CGImage: croppedCGImage)
    }
}