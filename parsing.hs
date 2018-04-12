import Text.ParserCombinators.Parsec

data Tag = MkTag String deriving Show

parseDiv :: Parser Tag
parseDiv = do
  string "<div>"
  return (MkTag "div")

letter_digit :: Parser Char
letter_digit =
  do x <- letter <|> digit
     return x

bag_bog_try :: Parser String
bag_bog_try =
  do xs <- try (string "bag") <|> string "bog"
     return xs

varname :: Parser String
varname =
  do x <- letter
     xs <- many (letter <|> digit)
     return (x:xs)
