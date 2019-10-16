//
//  MarkdownBold.swift
//  Pods
//
//  Created by Ivan Bruel on 18/07/16.
//
//
import Foundation

open class MarkdownBold: MarkdownCommonElement {
  fileprivate static let regex = "(.?|^)(\\*\\*|__)(.+?)(\\2)"
  
  open var font: MarkdownFont?
  open var color: MarkdownColor?
  open var customAttributes: [NSAttributedString.Key : AnyObject]?
  
  open var regex: String {
    return MarkdownBold.regex
  }
  
  public init(font: MarkdownFont? = nil, color: MarkdownColor? = nil,
              customAttributes: [NSAttributedString.Key: AnyObject]? = nil) {
    self.font = font?.bold()
    self.color = color
    self.customAttributes = customAttributes
  }
}
