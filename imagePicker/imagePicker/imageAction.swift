//
//  imageAction.swift
//  imagePicker
//
//  Created by Imcrinox Mac on 26/12/1444 AH.
//

import Foundation

public enum ImageActionStyle {
    case Default
    case cancel
}

public typealias Title = (Int) -> String
 
public class ImageAction {
    
    public typealias Handler = (ImageAction) -> ()
    public typealias SecondaryHandler = (ImageAction, Int) -> ()
    
    let title: String
    let secondaryTitle: Title
    
    let style: ImageActionStyle
    
    let handler: Handler?
    let secondaryHandler: SecondaryHandler?
    public convenience init(title: String, secondaryTitle: String? = nil, style: ImageActionStyle = .Default, handler: Handler? = nil, secondaryHandler: SecondaryHandler? = nil) {
        self.init(title: title, secondaryTitle: secondaryTitle.map { string in { _ in string }}, style: style, handler: handler, secondaryHandler: secondaryHandler)
    }
    public init (title: String,secondaryTitle: Title?, style: ImageActionStyle = .Default, handler: Handler? = nil, secondaryHandler: SecondaryHandler? = nil) {
        var secondaryHandlerTemp = secondaryHandler
        if let handler = handler, secondaryTitle == nil && secondaryHandlerTemp == nil {
            secondaryHandlerTemp = { action, _ in
                handler(action)
            }
        }
    
        self.title = title
        self.secondaryTitle = secondaryTitle ?? { _ in title}
        self.style = style
        self.handler = handler
        self.secondaryHandler = secondaryHandlerTemp
    }
    
    func handle(_ numberOfPhotos: Int = 0) {
        if numberOfPhotos > 0 {
            secondaryHandler?(self, numberOfPhotos)
        }
        else {
            handler?(self)
        }
    }
}

func ?? (left: Title?, right: @escaping Title) -> Title {
    if let left = left {
        return left
    }
    return right
}
