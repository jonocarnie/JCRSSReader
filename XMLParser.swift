//
//  XMLParser.swift
//  JCRSSReader
//
//  Created by Jonathan Carnie on 23/11/2014.
//  Copyright (c) 2014 Jonathan Carnie. All rights reserved.
//

import UIKit

@objc protocol XMLParserDelegate{
    func parsingWasFinished()
}

class XMLParser: NSObject, NSXMLParserDelegate {
    
    var arrParsedData = [Dictionary<String, String>]()
    var currDataDictionary = Dictionary<String, String>()
    var currentElement = ""
    var foundCharacters = ""
    
    var delegate:XMLParserDelegate?
    
    
    
    func startParsingWithContentsOfURL(rssURL:NSURL) {
        let parser = NSXMLParser(contentsOfURL: rssURL)
        parser?.delegate = self
        parser?.parse()
    }
   
    
    
    func parser(parser: NSXMLParser!, didStartElement elementName: String!, namespaceURI: String!, qualifiedName qName: String!, attributes attributeDict: [NSObject : AnyObject]!) {
        
        currentElement = elementName
    }
    func parser(parser: NSXMLParser!, foundCharacters string: String!) {
        if (currentElement == "title" && currentElement != "Appcoda") || currentElement == "link" || currentElement == "pubDate" {
            foundCharacters += string
        }
    }
    
    func parser(parser: NSXMLParser!, didEndElement elementName: String!, namespaceURI: String!, qualifiedName qName: String!) {
        if !foundCharacters.isEmpty {
            
            if elementName == "link"{
                foundCharacters = (foundCharacters as NSString).substringFromIndex(3)
            }
            
            
            currDataDictionary[currentElement] = foundCharacters
            foundCharacters = ""
            
            if currentElement == "pubDate" {
                arrParsedData.append(currDataDictionary)
            }
        }
    }
    
    func parserDidEndDocument(parser: NSXMLParser!) {
        delegate?.parsingWasFinished()
    }
    
    func parser(parser: NSXMLParser!, parseErrorOccurred parseError: NSError!) {
        println(parseError.description)
    }
    
    
    func parser(parser: NSXMLParser!, validationErrorOccurred validationError: NSError!) {
        println(validationError.description)
    }
}
