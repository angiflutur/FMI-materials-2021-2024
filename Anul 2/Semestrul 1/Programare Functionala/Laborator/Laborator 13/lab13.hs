
{- Monada Maybe este definita in GHC.Base 

instance Monad Maybe where
  return = Just
  Just va  >>= k   = k va
  Nothing >>= _   = Nothing


instance Applicative Maybe where
  pure = return
  mf <*> ma = do
    f <- mf
    va <- ma
    return (f va)       

instance Functor Maybe where              
  fmap f ma = pure f <*> ma   
-}

pos :: Int -> Bool
pos  x = if (x>=0) then True else False

fct :: Maybe Int ->  Maybe Bool
--fct  mx =  mx  >>= (\x -> Just (pos x))


--1.2.
fct mx = do
        x <- mx
        return (pos x)

--2
addM :: Maybe Int -> Maybe Int -> Maybe Int
--addM mx my = undefined

--2.1
-- addM (Just x) (Just y) = Just(x + y)
-- addM _ _ = Nothing

addM mx my = do
            x <- mx 
            y <- my
            return (x+y)


--3
--cartesian_product xs ys = xs >>= ( \x -> (ys >>= \y-> return (x,y)))
cartesian_product xs ys = do
                x <- xs
                y <- ys
                return (x,y)


--prod f xs ys = [f x y | x <- xs, y<-ys]
prod f xs ys = do
                x <- xs 
                y <- ys
                return (f x y)

myGetLine :: IO String
-- myGetLine = getChar >>= \x ->
--       if x == '\n' then
--           return []
--       else
--           myGetLine >>= \xs -> return (x:xs)
myGetLine = do
    x <- getChar
    if x == '\n' then
        return []
    else
        do 
            xs <- getLine
            return (x:xs)


--4
prelNo noin =  sqrt noin

-- ioNumber = do
--      noin  <- readLn :: IO Float
--      putStrLn $ "Intrare\n" ++ (show noin)
--      let  noout = prelNo noin
--      putStrLn $ "Iesire"
--      print noout

ioNumber = do 
    (readLn::IO Float) >>=
        \noin -> putStrLn ("Intrare\n" ++ (show noin)) >>=
        \u -> let  noout = prelNo noin in
        putStrLn ("Iesire") >>= \_ -> print noout


--6
data Person = Person { name :: String, age :: Int }

showPersonN :: Person -> String
showPersonN p = "Name: " ++ name p 
showPersonA :: Person -> String
showPersonA p = "Age: " ++ show (age p)

{-
showPersonN $ Person "ada" 20
"NAME: ada"
showPersonA $ Person "ada" 20
"AGE: 20"
-}

showPerson :: Person -> String
showPerson p = "(NAME: " ++ name p ++ ", AGE: " ++ show (age p) ++ ")" 

{-
showPerson $ Person "ada" 20
"(NAME: ada, AGE: 20)"
-}


newtype Reader env a = Reader { runReader :: env -> a }


instance Monad (Reader env) where
  return x = Reader (\_ -> x)
  ma >>= k = Reader f
    where f env = let a = runReader ma env
                  in  runReader (k a) env



instance Applicative (Reader env) where
  pure = return
  mf <*> ma = do
    f <- mf
    a <- ma
    return (f a)       

instance Functor (Reader env) where              
  fmap f ma = pure f <*> ma    

ask :: Reader env env
ask = Reader (\env->env)

mshowPersonN ::  Reader Person String
mshowPersonN = do
    pers <- ask
    return $ "NAME: " ++ name pers
    
mshowPersonA ::  Reader Person String
mshowPersonA = do
    pers <- ask
    return $ "AGE: " ++ show (age pers)
mshowPerson ::  Reader Person String
mshowPerson = do
    n <- mshowPersonN
    a <- mshowPersonA
    return $ "( "++n++";" ++ a ++ ")"

{-runReader mshowPersonN  $ Person "ada" 20
"NAME:ada"
runReader mshowPersonA  $ Person "ada" 20
"AGE:20"
runReader mshowPerson  $ Person "ada" 20
"(NAME:ada,AGE:20)"-}