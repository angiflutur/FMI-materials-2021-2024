import Distribution.SPDX (LicenseId(AFL_1_2))
import Distribution.PackageDescription (emptyFlag)
data Expr = Const Int -- integer constant
          | Expr :+: Expr -- addition
          | Expr :*: Expr -- multiplication
           deriving Eq

data Operation = Add | Mult deriving (Eq, Show)

data Tree = Lf Int -- leaf
          | Node Operation Tree Tree -- branch
           deriving (Eq, Show)

--1.1
instance Show Expr where
    show::Expr->String
    show (Const i) = show i
    show (a :+: b) = "(" ++ show a ++ "+" ++ show b ++ ")"
    show (a :*: b) = "(" ++ show a ++ "*" ++ show b ++ ")"

--1.2
evalExp :: Expr -> Int
evalExp (Const x) = x
evalExp (a :+: b) = evalExp a + evalExp b
evalExp (a :*: b) = evalExp a * evalExp b

exp1 = ((Const 2 :*: Const 3) :+: (Const 0 :*: Const 5))
exp2 = (Const 2 :*: (Const 3 :+: Const 4))
exp3 = (Const 4 :+: (Const 3 :*: Const 3))
exp4 = (((Const 1 :*: Const 2) :*: (Const 3 :+: Const 1)) :*: Const 2)
test11 = evalExp exp1 == 6
test12 = evalExp exp2 == 14
test13 = evalExp exp3 == 13
test14 = evalExp exp4 == 16

--1.3
evalArb :: Tree -> Int
evalArb (Lf a)=a
evalArb (Node Add a b) = evalArb a + evalArb b
evalArb (Node Mult a b) = evalArb a * evalArb b



arb1 = Node Add (Node Mult (Lf 2) (Lf 3)) (Node Mult (Lf 0)(Lf 5))
arb2 = Node Mult (Lf 2) (Node Add (Lf 3)(Lf 4))
arb3 = Node Add (Lf 4) (Node Mult (Lf 3)(Lf 3))
arb4 = Node Mult (Node Mult (Node Mult (Lf 1) (Lf 2)) (Node Add (Lf 3)(Lf 1))) (Lf 2)

test21 = evalArb arb1 == 6
test22 = evalArb arb2 == 14
test23 = evalArb arb3 == 13
test24 = evalArb arb4 == 16


--1.4
expToArb :: Expr -> Tree
expToArb (Const a) = Lf a
expToArb (a :+: b) = Node Add (expToArb a) (expToArb b)
expToArb (a :*: b) = Node Mult (expToArb a) (expToArb b)


--2
class Collection c where
  empty :: c key value
  singleton :: key -> value -> c key value
  insert
      :: Ord key
      => key -> value -> c key value -> c key value
  clookup :: Ord key => key -> c key value -> Maybe value
  delete :: Ord key => key -> c key value -> c key value
  --2.1
  --a
  keys :: c key value -> [key]
  keys collection = [fst x | x<- toList collection]
  --b
  values :: c key value -> [value]
  values collection = [snd x | x<- toList collection]
  --c
  toList :: c key value -> [(key, value)]
  fromList :: Ord key => [(key,value)] -> c key value
  fromList = foldr (uncurry insert) empty
  --var 2 pt c
--   fromList []=empty
--   fromList ((k,v):t) = insert k v (fromList t)

--2.2
newtype PairList k v
  = PairList { getPairList :: [(k, v)] }

instance Collection PairList where
    empty = PairList[]
    singleton k v = PairList[(k,v)]
    delete k (PairList l) = PairList $ filter (\(k1,v1)-> k1/=k) l   
    insert k v (PairList l)= PairList $ (k,v) : filter (\(k1,v1)-> k1/=k) l  
    clookup k= lookup k .getPairList
    toList=getPairList


--2.3
data SearchTree key value
  = Empty
  | BNode
      (SearchTree key value) -- elemente cu cheia mai mica
      key                    -- cheia elementului
      (Maybe value)          -- valoarea elementului
      (SearchTree key value) -- elemente cu cheia mai mare

instance Collection SearchTree where
    empty = Empty
    singleton k v = BNode Empty k (Just v) Empty
    insert k v Empty = singleton k v
    insert k v (BNode t1 k1 v1 t2) 
        |k == k1 = BNode t1 k1 (Just v) t2
        |k<k1 = BNode (insert k v t1) k1 v1 t2
        |otherwise = BNode t1 k1 v1 (insert k v t2)
    toList Empty = []
    toList (BNode t1 k v t2) = toList t1 ++ embed k v++toList t2
        where 
            embed _ Nothing =[]
            embed k (Just  v) =[(k,v)]
    clookup :: Ord key => key -> SearchTree key value -> Maybe value
    clookup k (BNode t1 k1 v1 t2)
        | k==k1 = v1
        | k<k1 = clookup k t1
        | otherwise = clookup k t2

    delete :: Ord key => key -> SearchTree key value -> SearchTree key value
    delete k (BNode t1 k1 v1 t2)
        | k==k1 = BNode t1 k1 Nothing t2
        | k<k1 = BNode (delete k t1) k1 v1 t2
        | otherwise = BNode t1 k1 v1 (delete k t1)