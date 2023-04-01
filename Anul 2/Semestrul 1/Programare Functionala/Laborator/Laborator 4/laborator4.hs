import Distribution.SPDX (LicenseId(AFL_1_2, APL_1_0))
import System.Win32 (COORD(xPos))
-- -- -- Laboratorul 4 PF -- -- --


-- {-
-- [ x2 |x <- [1..10], x `rem` 3 == 2]
-- [(x,y)| x<- [1..5], y <- [x..(x+2)]]
-- [(x,y)| x<-[1..3], let k = x2, y <- [1..k]]
-- [ x | x<- "Facultatea de Matematica si Informatica", elem x ['A'..'Z']]
-- [[x..y]| x <- [1..5], y <- [1..5], x < y]
-- -}

-- ex. 1
factori::Int->[Int]
factori y = [x | x<-[1..y], x `rem` y == 0]

-- ex. 2
prim::Int->Bool
prim x = factori x == [1,x]

-- ex. 3
numerePrime::Int->[Int]
numerePrime n = [x | x<-[2..n], prim x]

-- ex. 4
myzip3::[a]->[b]->[c]->[(a,b,c)]
myzip3 [] x y = []
myzip3 x [] y = []
myzip3 x y [] = []
myzip3 (x:xs) (y:ys) (z:zs) = (x,y,z) : myzip3 xs ys zs

    -- sau, cu comprehensiune:
myzip31 :: [a]->[b]->[c]->[(a,b,c)]
myzip31 l1 l2 l3 = [(a,b,c)| ((a,b),c) <- zip ( zip l1 l2) l3]

-- ex. 5
firstEl :: [(a,b)] -> [a]
firstEl = map fst
    -- fst returneaza o primul element dintr un tuplu ()
    -- head returneaza primul element dintr o lista []

-- ex. 6
sumList::[[Int]]->[Int]
sumList = map sum
    -- functia de suma pe liste

-- ex. 7
pre12::[Int]->[Int]
pre12 = map (\x -> if odd x then 2*x else div x 2)

-- ex. 8
cont::Char->[String]->[String]
cont a = filter (a `elem`) 
        -- cont a (l:ls) = map(\x -> if a `elem` x then x) : cont ls
        -- nu merge pentru ca if trebuie sa aiba si else

-- ex. 9
functie9::[Int]->[Int]
functie9 ls = map(^2) (filter odd ls)

-- ex. 10 
functie10::[Int]->[Int]
functie10 l= map( (^2).snd) (filter (odd.fst) (zip [0..] l))
    -- functie10 = (map(^2).snd).filter(odd.fst).zip[0..]

-- ex. 11 
elim::String->String
elim [] =[]
elim (x:xs)
    | x `elem` "aeiouAEIOU"  =[x]++elim xs 
    | otherwise = elim xs

functie11::[String]->[String]
functie11 = map elim

numaiVocale::[String]->[String]
numaiVocale =  map(filter(`elem` "AEIOUaeiou"))


-- ex. 12
mymap :: (a->b) -> [a] -> [b]
mymap f [] = []
mymap f (x:xs) = f x : mymap f xs

myfilter :: (a->Bool) -> [a] -> [a]
myfilter p [] = []
myfilter p (x:xs) 
    | p x  = x:myfilter p xs
    | otherwise = myfilter p xs


