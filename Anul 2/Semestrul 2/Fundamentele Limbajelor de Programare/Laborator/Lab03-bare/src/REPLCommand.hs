
module REPLCommand where

import Lab2
import Control.Applicative (many, (<|>))

data REPLCommand
  = Quit
  | Load String
  | Eval String

replCommand :: Parser REPLCommand
replCommand = undefined

