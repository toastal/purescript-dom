module DOM.DOMParser 
  ( newDOMParser
  , parseFromString
  , parseHTMLFromString
  , parseSVGFromString
  , parseXMLFromString
  ) where

import Prelude

import DOM.DOMParser.Types (DOMParser, DOMParserType(..), documentTypeToString)
import DOM.Node.Types (Document)

--| Create a new `DOMParser`
foreign import newDOMParser :: Unit -> DOMParser

foreign import parseFromString_ :: String -> String -> DOMParser -> Document

parseFromString :: DOMParserType -> String -> DOMParser -> Document
parseFromString docType =
  parseFromString_ (documentTypeToString docType)

parseHTMLFromString :: String -> DOMParser -> Document
parseHTMLFromString =
  parseFromString HTML

parseSVGFromString :: String -> DOMParser -> Document
parseSVGFromString =
  parseFromString SVG
  
parseXMLFromString :: String -> DOMParser -> Document
parseXMLFromString =
  parseFromString XML
