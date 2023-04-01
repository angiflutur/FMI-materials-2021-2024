{- 
class Functor f where 
     fmap :: (a -> b) -> f a -> f b 
class Functor f => Applicative f where
    pure :: a -> f a
    (<*>) :: f (a -> b) -> f a -> f b

Just length <*> Just "world"

Just (++" world") <*> Just "hello,"
pure (+) <*> Just 3 <*> Just 5
pure (+) <*> Just 3 <*> Nothing
(++) <$> ["ha","heh"] <*> ["?","!"]
-}

--1
data List a = Nil
            | Cons a (List a)
        deriving (Eq, Show)

instance Functor List where
    fmap f (Cons a l) = Cons (f a) (fmap f l)
    fmap f Nil = Nil 

app :: List a -> List a -> List a 
app Nil l2 = l2
app (Cons h t) l2 = Cons h (app t l2)

instance Applicative List where
    pure x = Cons x Nil
    Nil <*> l2 = Nil
    (Cons h t) <*> l2 = fmap h l2 `app` (t <*> l2)
    

f = Cons (+1) (Cons (*2) Nil)
v = Cons 1 (Cons 2 Nil)
test1 = (f <*> v) == Cons 2 (Cons 3 (Cons 2 (Cons 4 Nil)))


--2
data Cow = Cow {
        name :: String
        , age :: Int
        , weight :: Int
        } deriving (Eq, Show)


--a
noEmpty :: String -> Maybe String
noEmpty "" = Nothing
noEmpty a = Just a 

--b
noNegative :: Int -> Maybe Int
noNegative a = if a<0 then Nothing else Just a

test21 = noEmpty "abc" == Just "abc"
test22 = noNegative (-5) == Nothing 
test23 = noNegative 5 == Just 5 

--c
cowFromString :: String -> Int -> Int -> Maybe Cow
cowFromString a b c =  fmap Cow(noEmpty a) <*> noNegative b <*> noNegative c

test24 = cowFromString "Milka" 5 100 == Just (Cow {name = "Milka", age = 5, weight = 100})



--3
newtype Name = Name String deriving (Eq, Show)
newtype Address = Address String deriving (Eq, Show)

data Person = Person Name Address
    deriving (Eq, Show)

--a
validateLength :: Int -> String -> Maybe String
validateLength a b = if  (length b) < a then Just b else Nothing

test31 = validateLength 5 "abc" == Just "abc"


--b
mkName :: String -> Maybe Name
mkName "" = Nothing
mkName nume = fmap Name (validateLength 26 nume )

mkAddress :: String -> Maybe Address
mkAddress "" = Nothing
mkAddress adresa = fmap Address (validateLength 101 adresa )

test32 = mkName "Gigel" ==  Just (Name "Gigel")
test33 = mkAddress "Str Academiei" ==  Just (Address "Str Academiei")

--c
mkPerson :: String -> String -> Maybe Person
mkPerson a b = fmap Person (mkName a) <*> (mkAddress b)

test34 = mkPerson "Gigel" "Str Academiei" == Just (Person (Name "Gigel") (Address "Str Academiei"))