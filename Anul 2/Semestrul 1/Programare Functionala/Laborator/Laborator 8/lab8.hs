--1
data Punct = Pt [Int]

data Arb = Vid | F Int | N Arb Arb
          deriving Show

class ToFromArb a where
    toArb :: a -> Arb
    fromArb :: Arb -> a
--a
instance Show Punct where
    show (Pt l) = "("++ parse l ++ ")"
        where 
            parse []=" "
            parse [x]=show x
            parse(x:xs)=show x ++ "," ++ parse xs 

-- Pt [1,2,3]
-- (1, 2, 3)

-- Pt []
-- ()


--b
instance ToFromArb Punct where
    toArb :: Punct -> Arb
    fromArb :: Arb -> Punct
    toArb (Pt []) = Vid
    toArb (Pt (x:xs)) = N (F x) (toArb  (Pt xs))
    fromArb Vid = Pt []
    fromArb (F x) = Pt [x]
    fromArb (N a b) = let 
                        Pt l1=fromArb a
                        Pt l2=fromArb b
                        in Pt(l1++l2)


-- toArb (Pt [1,2,3])
-- N (F 1) (N (F 2) (N (F 3) Vid))
-- fromArb $ N (F 1) (N (F 2) (N (F 3) Vid)) :: Punct
--  (1,2,3)

--2
data Geo a = Square a | Rectangle a a | Circle a
    deriving Show

class GeoOps g where
  perimeter :: (Floating a) => g a -> a
  area :: (Floating a) =>  g a -> a

--a
instance GeoOps Geo where
    perimeter (Square a) = 4*a
    perimeter (Rectangle a b)=2*(a+b)
    perimeter (Circle a) = 2*(pi)*a
    area (Square a)=a**2
    area (Rectangle a b) = a*b
    area (Circle a) = (pi)*(a**2)

--b
instance (Eq x,Floating x) => Eq (Geo x) where
    a == b = perimeter a == perimeter b


-- ghci> pi
-- 3.141592653589793