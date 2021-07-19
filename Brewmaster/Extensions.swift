//
//  Extensions.swift
//  Brewmaster
//
//  Created by Reza Daneshvar on 19/07/2021.
//

import UIKit

extension UIImage {
    static func placeholder(_ size: CGSize) -> UIImage {
        UIGraphicsImageRenderer(size: size).image { rendererContext in
            UIColor.clear.setFill()
            rendererContext.fill(CGRect(origin: .zero, size: size))
        }
    }

    func scale(width: CGFloat) -> UIImage {
        let factor = width / size.width
        let scaledImageSize = CGSize(width: size.width * factor, height: size.height * factor)
        let renderer = UIGraphicsImageRenderer(size: scaledImageSize)
        let scaledImage = renderer.image { _ in
            self.draw(in: CGRect(origin: .zero, size: scaledImageSize))
        }
        return scaledImage
    }
}
