//
//  MarkdownStyle.swift
//  Pods
//
//  Created by Ivan Bruel on 18/07/16.
//
//
import Foundation

/// Styling protocol for all MarkdownElements
public protocol MarkdownStyle {
  var font: MarkdownFont? { get }
  var color: MarkdownColor? { get }
  var attributes: [NSAttributedString.Key: AnyObject] { get }
  var customAttributes: [NSAttributedString.Key: AnyObject]? { get set }
}

public extension MarkdownStyle {
  
  var attributes: [NSAttributedString.Key: AnyObject] {
    var attributes = [NSAttributedString.Key: AnyObject]()
    if let font = font {
        attributes[NSAttributedString.Key.font] = font
    }
    if let color = color {
        attributes[NSAttributedString.Key.foregroundColor] = color
    }
    for (key, value) in customAttributes ?? [:] {
      attributes[key] = value
    }
    return attributes
  }
  
}
