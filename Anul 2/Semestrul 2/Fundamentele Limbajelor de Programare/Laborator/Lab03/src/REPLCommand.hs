
module REPLCommand where

import Text.Parsec.String (Parser)
import Text.Parsec.Language (emptyDef, LanguageDef)
import qualified Text.Parsec.Token as Token
import Text.Parsec (anyChar)
import Control.Applicative (many)

data REPLCommand
  = Quit
  | Load String
  | Eval String

replCommand :: Parser REPLCommand
replCommand = undefined

