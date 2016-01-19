//
//  MMMaskedLabel.swift
//  MMMaskedLabel Demo
//
//  Created by Michael MacCallum on 1/19/16.
//  Copyright © 2016 Michael MacCallum. All rights reserved.
//

import UIKit

public class MMMaskedLabel: UILabel {
    private var maskedBackgroundColor: UIColor?
    override public var backgroundColor: UIColor? {
        get {
            return maskedBackgroundColor
        }

        set {
            maskedBackgroundColor = newValue
        }
    }
    
    override public var textColor: UIColor! {
        get {
            return super.textColor
        }
        
        set {
            // text color needs to be white for masking to work
        }
    }

    override public required init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        backgroundColor = super.backgroundColor
        opaque = false

        super.textColor = UIColor.whiteColor()
        super.backgroundColor = UIColor.clearColor()
    }
    
    override public func drawRect(rect: CGRect) {
        let context = UIGraphicsGetCurrentContext();
        
        // let the superclass draw the label normally
        super.drawRect(rect)
        
        CGContextConcatCTM(context, CGAffineTransformMake(1, 0, 0, -1, 0, CGRectGetHeight(rect)))
        
        // create a mask from the normally rendered text
        var image = CGBitmapContextCreateImage(context)
        var mask = CGImageMaskCreate(CGImageGetWidth(image), CGImageGetHeight(image), CGImageGetBitsPerComponent(image), CGImageGetBitsPerPixel(image), CGImageGetBytesPerRow(image), CGImageGetDataProvider(image), CGImageGetDecode(image), CGImageGetShouldInterpolate(image))
        
        image = nil
        
        // wipe the slate clean
        CGContextClearRect(context, rect)
        
        CGContextSaveGState(context)
        CGContextClipToMask(context, rect, mask)
        
        if (!layer.cornerRadius.isZero) {
            CGContextAddPath(context, CGPathCreateWithRoundedRect(rect, layer.cornerRadius, layer.cornerRadius, nil))
            CGContextClip(context)
        }
        
        mask = nil;
        
        drawBackgroundInRect(rect)
        CGContextRestoreGState(context)
    }
    
    private func drawBackgroundInRect(rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()
        maskedBackgroundColor?.set()
        CGContextFillRect(context, rect)
    }
}
