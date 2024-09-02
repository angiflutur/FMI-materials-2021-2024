
/-
  Timp de lucru: 1 ora.
  La final, incarcati un fisier lean denumit `Nume_Prenume_Grupa.lean` la adresa https://www.dropbox.com/request/pwPjc4Z7OS5uxbA5c63W
-/

section

  /-
    **Exercitiul 1: Definiti, prin recursie structurala,
    functia `nthSquareSum` astfel incat
    `nthSquareSum n` calculeaza sum patratelor numerelor naturale de la `0` la `n`.
  -/

  def nthSquareSum (n : Nat) : Nat := sorry
end

/-
  Demonstrati urmatoarea teorema.
-/
section
variable (p q r : Prop)
theorem ex2 : p ∧ (q ∧ r) → (p ∧ r) ∧ q := sorry
end

/-
  Demonstrati urmatoarea teorema.
-/
section
variable {α : Type} (p : α → Prop)

theorem ex3 : (∀ x, p x) → (∀ x, (¬¬p x)) := sorry

end

