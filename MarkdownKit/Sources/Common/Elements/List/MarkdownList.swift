//
//  MarkdownList.swift
//  Pods
//
//  Created by Ivan Bruel on 18/07/16.
//
//
import Foundation

open class MarkdownList: MarkdownLevelElement {

  fileprivate static let regex = "^([\\*\\+\\-]{1,%@})\\s+(.+)$"
  open var maxLevel: Int
  open var font: MarkdownFont?
  open var color: MarkdownColor?
  open var indicatorColor: MarkdownColor?
  open var indicatorFont: MarkdownFont?
  open var separator: String
  open var indicator: String
  open var customAttributes: [NSAttributedString.Key : AnyObject]?
  
  open var regex: String {
    let level: String = maxLevel > 0 ? "\(maxLevel)" : ""
    return String(format: MarkdownList.regex, level)
  }
  
  public init(font: MarkdownFont? = nil, maxLevel: Int = 0, indicator: String = "•",
              separator: String = "  ", color: MarkdownColor? = nil,
              customAttributes: [NSAttributedString.Key: AnyObject]? = nil) {
    self.maxLevel = maxLevel
    self.indicator = indicator
    self.separator = separator
    self.font = font
    self.color = color
    self.customAttributes = customAttributes
    self.indicatorColor = color
    self.indicatorFont = font
  }

  open func formatText(_ attributedString: NSMutableAttributedString, range: NSRange, level: Int) {
    var string = (0..<level).reduce("") { (string, _) -> String in
      return "\(string)\(separator)"
    }
    string = "\(string)\(indicator) "
    attributedString.replaceCharacters(in: range, with: string)
  }

  open func addAttributes(_ attributedString: NSMutableAttributedString, range: NSRange, level: Int) {
    var attributes = attributesForLevel(level - 1)
    attributedString.addAttributes(attributes, range: range)
    indicatorColor.flatMap { attributes[.foregroundColor] = $0 }
    indicatorFont.flatMap { attributes[.font] = $0 }
    attributedString.addAttributes(attributes, range: NSRange(location: range.location - 2, length: indicator.count))
  }
}
