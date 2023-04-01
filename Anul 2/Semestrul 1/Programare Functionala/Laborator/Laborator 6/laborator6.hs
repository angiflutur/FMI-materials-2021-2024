-- -- -- Laborator 6 PF -- -- --
data Shape = Circle Float Float Float 
            | Rectangle Float Float Float Float
            deriving Show

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- ex.1
data Fruct
    = Mar String Bool
    | Portocala String Int

ionatanFaraVierme = Mar "Ionatan" False

goldenCuVierme = Mar "Golden Delicious" True

portocalaSicilia10 = Portocala "Sanguinello" 10

listaFructe = [Mar "Ionatan" False,
                Portocala "Sanguinello" 10,
                Portocala "Valencia" 22,
                Mar "Golden Delicious" True,
                Portocala "Sanguinello" 15,
                Portocala "Moro" 12,
                Portocala "Tarocco" 3,
                Portocala "Moro" 12,
                Portocala "Valencia" 2,
                Mar "Golden Delicious" False,
                Mar "Golden" False,
                Mar "Golden" True]

-- lista noua:
sicilia = ["Moro", "Sanguinello", "Tarocco"]

    -- a)
ePortocalaDeSicilia :: Fruct -> Bool

ePortocalaDeSicilia (Portocala nume _) = elem nume sicilia
ePortocalaDeSicilia _ = False

            -- teste:
test_ePortocalaDeSicilia1 =
    ePortocalaDeSicilia (Portocala "Moro" 12) == True

test_ePortocalaDeSicilia2 =
    ePortocalaDeSicilia (Mar "Ionatan" True) == False

    --b)
nrFeliiSicilia :: [Fruct] -> Int
nrFeliiSicilia [] = 0
nrFeliiSicilia ((Mar nume bool):r) =nrFeliiSicilia r
nrFeliiSicilia ((Portocala nume nr) : r) 
    | ePortocalaDeSicilia (Portocala nume nr)==True  = nr + nrFeliiSicilia r
    | otherwise = nrFeliiSicilia r

            -- test:
test_nrFeliiSicilia = nrFeliiSicilia listaFructe == 52
            -- varianta2:
nrFeliiSicilia2::[Fruct]->Int
nrFeliiSicilia2 lista = sum [nrfelii | (Portocala tip nrfelii)<-lista, ePortocalaDeSicilia(Portocala tip nrfelii)]

    -- c)
nrMereViermi::[Fruct]->Int
nrMereViermi [] = 0
nrMereViermi ((Portocala nume nr ):r) = nrMereViermi r
nrMereViermi ((Mar nume False):r) = nrMereViermi r
nrMereViermi ((Mar nume True):xs) 
    | ePortocalaDeSicilia (Mar nume True) == False  = 1 + nrMereViermi(xs)
    | otherwise = nrMereViermi xs    

            -- test:
test_nrMereViermi = nrMereViermi listaFructe == 2

-- varianta 2
nrMereViermi2 :: [Fruct] -> Int
nrMereViermi2 l = sum[1 | Mar soi viermi <- l, viermi == True]
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

-- ex.2
type NumeA = String
type Rasa = String
data Animal = Pisica NumeA | Caine NumeA Rasa
    deriving Show

--a)
vorbeste :: Animal -> String
vorbeste (Pisica _) = "Meow!"
vorbeste (Caine _ rasa) = "Woof!"

--b)

-- data Maybe a = Nothing | Just a
rasa :: Animal -> Maybe String 
rasa (Caine _ rasa) = Just rasa
rasa (Pisica _) = Nothing


-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

-- ex. 3
data Linie = L [Int]
    deriving Show
data Matrice = M [Linie]
    deriving Show
    
    --a)
verifica :: Matrice -> Int -> Bool
verifica (M matrice) n = foldr (&&) True [sum linie==n | L linie <- matrice]
            --teste:
test_verif1 = verifica (M[L[1,2,3], L[4,5], L[2,3,6,8], L[8,5,3]]) 10 == False
test_verif2 = verifica (M[L[2,20,3], L[4,21], L[2,3,6,8,6], L[8,5,3,9]]) 25 == True

    --b)
doarPozN :: Matrice -> Int -> Bool
doarPozN (M matrice) n = foldr (&&) True 
    (map (foldr (\x rezultat -> (x>0) && rezultat) True) 
    [linie | (L linie) <-matrice, n==length linie] )

        --varianta 2:
doarPozN2 :: Matrice -> Int -> Bool
doarPozN2 (M matrice) n = foldr (&&) True 
    [all (>0) linie | L linie <- matrice, length linie == n]
--                         ^--  and   --^        
            
            --teste:
testPoz1 = doarPozN (M [L[1,2,3], L[4,5], L[2,3,6,8], L[8,5,3]]) 3 == True
testPoz2 = doarPozN (M [L[1,2,-3], L[4,5], L[2,3,6,8], L[8,5,3]]) 3 == False

    --c)
corect :: Matrice -> Bool
corect (M matrice) =foldr (&&) True 
    [length linie1 == length linie2 | L linie1 <- matrice, 
    L linie2 <- matrice]

corect2 :: Matrice -> Bool
corect2 (M (L m1: []))=True
corect2 (M [])=True
corect2 (M (L m1: L m2: ms))
    | length m1 == length m2  =True && (corect2 (M(L m2:ms)))
    | otherwise = False  

    
            --teste
testcorect1 = corect (M[L[1,2,3], L[4,5], L[2,3,6,8], L[8,5,3]]) == False
testcorect2 = corect (M[L[1,2,3], L[4,5,8], L[3,6,8], L[8,5,3]]) == True