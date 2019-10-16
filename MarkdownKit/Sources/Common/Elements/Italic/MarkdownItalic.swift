//
//  MarkdownItalic.swift
//  Pods
//
//  Created by Ivan Bruel on 18/07/16.
//
//
import Foundation

open class MarkdownItalic: MarkdownCommonElement {
  
  fileprivate static let regex = "(\\s+|^)(\\*|_)(.+?)(\\2)"
  
  open var font: MarkdownFont?
  open var color: MarkdownColor?
  open var customAttributes: [NSAttributedString.Key : AnyObject]?
  
  open var regex: String {
    return MarkdownItalic.regex
  }
  
  public init(font: MarkdownFont?, color: MarkdownColor? = nil, customAttributes: [NSAttributedString.Key: AnyObject]? = nil) {
    self.font = font?.italic()
    self.color = color
    self.customAttributes = customAttributes
  }
}
