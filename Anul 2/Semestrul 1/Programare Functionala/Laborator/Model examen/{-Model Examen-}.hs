{-Model Examen-}

{-Subiectul I-}
data Point = Pt [Int]
  deriving (Show)

data Arb = Empty | Node Int Arb Arb
  deriving (Show)

class ToFromArb a where
  toArb :: a -> Arb
  fromArb :: Arb -> a

instance ToFromArb Point where
  toArb :: Point -> Arb
  toArb (Pt []) = Empty
  toArb (Pt (x : xs)) = insert x $ toArb (Pt xs)
    where
      insert val Empty = Node val Empty Empty
      insert val (Node root left right)
        | val <= root = Node root (insert val left) right
        | otherwise = Node root left (insert val right)
  fromArb :: Arb -> Point
  fromArb Empty = Pt []
  fromArb (Node val left right) = Pt (val : toList left ++ toList right)
    where
      toList Empty = []
      toList (Node val left right) = val : toList left ++ toList right

{-Subiectul II-}
{-Liste-}
-- getFromInterval :: Int -> Int -> [Int] -> [Int]
-- getFromInterval x y ls = [i | i <- ls, i >= x, i <= y]

{-Monade-}
getFromInterval :: Ord b => b -> b -> [b] -> [b]
getFromInterval x y ls = do
  a <- ls
  if a >= x && a <= y
    then [a]
    else []

{-Subiectul III-}
newtype ReaderWriter env a = RW {getRW :: env -> (a, String)}

instance Applicative (ReaderWriter env) where
  pure = return
  mf <*> ma = do
    f <- mf
    a <- ma
    return (f a)

instance Functor (ReaderWriter env) where
  fmap f ma = pure f <*> ma

{-ask este pentru reader-}
ask :: ReaderWriter env env
ask = RW $ \env -> (env, "") -- RW este constructor

{-ask este pentru writer-}
tell :: String -> ReaderWriter env ()
tell log = RW $ \env -> ((), log)

{-Doar atât trebuie la examen-}
--------------------------------------------
instance Monad (ReaderWriter env) where
  return :: a -> ReaderWriter env a
  return a = RW (\env -> (a, " "))
  (>>=) :: ReaderWriter env a -> (a -> ReaderWriter env b) -> ReaderWriter env b
  (RW envToA) >>= f = RW $ \env ->
    let (a, log1) = envToA env
        RW envToB = f a
        (b, log2) = envToB env
     in (b, log1 ++ log2)

--------------------------------------------

{-Test 1-}
myRW :: ReaderWriter Int Bool
myRW = do
  env <- ask
  tell ("Started with env=" ++ show env ++ "\n")
  let r = even env
  tell ("Got the result " ++ show r ++ "\n")
  return r

-- apelare: getRW myRW 3
-- rezultat: (False, "Started with env = 3\n Got the result False")