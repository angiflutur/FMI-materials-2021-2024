import Prelude (undefined)

data False                                        -- empty type

data True = True                                  -- unit type

data And a b = And { proj1 :: a, proj2 :: b }     -- product

data Or a b                                       -- sum
  = Left a
  | Right b

type Not a = a -> False
type Iff a b = And (a -> b) (b -> a)

-- Natural deduction introduction and elimination rules

trueIntro :: True                                   -- true introduction
trueIntro = True

falseElim :: False -> b                             -- false elimination
falseElim x = case x of

implIntro :: (a -> b) -> (a -> b)                   -- implication introduction
implIntro = undefined

implElim :: (a -> b) -> a -> b                      -- implication elimination
implElim = undefined

andIntro :: a -> b -> And a b                       -- and introduction
andIntro = undefined

andElimL :: And a b -> a                            -- and elimination 1
andElimL = undefined

andElimR :: And a b -> b                            -- and elimination 2
andElimR = undefined

orIntroL :: a -> Or a b                             -- or introduction 1
orIntroL = undefined

orIntroR :: b -> Or a b                             -- or introduction 2
orIntroR = undefined

orElim :: Or a b -> (a -> c) -> (b -> c) -> c       -- or elimination
orElim = undefined

notElim :: Not p -> p -> c                          -- not elimination 
notElim = undefined

notIntro :: (forall p. a -> p) -> Not a             -- not introduction
notIntro _ = undefined

iffIntro :: (a -> b) -> (b -> a) -> Iff a b         -- iff introduction
iffIntro = undefined

iffElimL :: Iff a b -> a -> b                       -- iff elimination 1
iffElimL = undefined

iffElimR :: Iff a b -> b -> a                       -- iff elimination 1
iffElimR = undefined

-- Hilbert-style axiomatization for intuitionistic propositional logic

ax1 :: a -> b -> a
ax1 = undefined

ax2 :: (a -> b) -> (a -> (b -> c)) -> a -> c
ax2 = undefined

ax3 :: a -> b -> And a b
ax3 = undefined

ax4 :: And a b -> a
ax4 = undefined

ax5 :: And a b -> b
ax5 = undefined

ax6 :: a -> Or a b
ax6 = undefined

ax7 :: b -> Or a b
ax7 = undefined

ax8 :: (a -> c) -> (b -> c) -> Or a b -> c
ax8 = undefined

ax9 :: (a -> b) -> (a -> Not b) -> Not a
ax9 = undefined

ax10 :: Not a -> a -> b
ax10 = undefined

modusPonens :: (a -> b) -> a -> b
modusPonens = undefined

-- Several tautologies

pNPFalse :: p -> Not p -> False
pNPFalse = undefined

deMorgan1 :: And (Not p) (Not q) -> Not (Or p q)
deMorgan1 = undefined

deMorgan2 :: Not (Or p q) -> And (Not p) (Not q)
deMorgan2 = undefined

deMorgan3 :: Or (Not p) (Not q) -> Not (And p q)
deMorgan3 = undefined

type DeMorgan4 = forall p q . Not (And p q) -> Or (Not p) (Not q)

-- Classical axioms

type ExcludedMiddle = forall a. Or a (Not a)
type DoubleNegation = forall a. Not (Not a) -> a
type PeirceLaw = forall p q. ((p -> q) -> p) -> p

excludedMiddleImplDoubleNeg :: ExcludedMiddle -> DoubleNegation
excludedMiddleImplDoubleNeg em = undefined

doubleNegImplExcludedMiddle :: DoubleNegation -> ExcludedMiddle -- hard
doubleNegImplExcludedMiddle dn = undefined

classicDeMorgan4 :: ExcludedMiddle -> DeMorgan4
classicDeMorgan4 em = undefined

