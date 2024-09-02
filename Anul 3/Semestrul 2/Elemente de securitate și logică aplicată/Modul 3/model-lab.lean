
/-
**Exercitiul 1:**
  Implementati functia 
    ex1 : Nat → Nat → Nat
  care satisface urmatoarele ecuatii. 
    ex1(x, y) := 
    {
      y + 2,                    daca x = 0 
      ex1(x - 1, y) + y * y,    altfel
    }
  Implementarea trebuie facuta prin recursie structurala. 
  Evaluati functia pentru x = 3 si y = 4 
-/
def ex1 : Nat → Nat → Nat :=
  fun x y => match x with 
  | 0 => y + 2 
  | x' + 1 => (ex1 x' y) + y * y

/-
  **Exercitiul 2:** 
  Demonstrati urmatoarea teorema.
-/
section 
variable (p : Prop)
theorem ex2 : ¬(p ∧ ¬¬q) → (p → ¬q) := by 
  intros h hp hq 
  apply h 
  apply And.intro 
  . exact hp 
  . intros hnq 
    contradiction 
end 

/-
  ** Exercitiul 3:** 
  Demonstrati urmatoarea teorema.
-/
section 
variable {α : Type} (p : α → Prop) (q : Prop)

theorem ex3 : (∀ x, q → p x) → q → (∀ x, p x) := by 
  intros h h' x
  exact h x h'



end 

  