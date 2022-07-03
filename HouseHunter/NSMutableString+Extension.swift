//
//  NSMutableString+Extension.swift
//  HouseHunter
//
//  Created by Thet Htun on 12/19/21.
//

import UIKit

extension NSMutableAttributedString {
    
    func withKerning(_ kerning: CGFloat) -> NSAttributedString {
        let attributedString = NSMutableAttributedString(attributedString: self)
        attributedString.addAttributes([.kern: kerning],
                                       range: NSRange(location: 0, length: string.count))
        return NSAttributedString(attributedString: attributedString)
    }
    
}
