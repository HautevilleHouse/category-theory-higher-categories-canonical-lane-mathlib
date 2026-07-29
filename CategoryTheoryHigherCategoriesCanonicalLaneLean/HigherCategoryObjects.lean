import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryHigherCategoriesCanonicalLaneLean

structure BicategoryPackage where
  objects : Type u
  morphisms : objects → objects → Type v
  twoMorphisms : ∀ {a b : objects}, (morphisms a b) → (morphisms a b) → Type w
  verticalComposition : ∀ {a b : objects} {f g h : morphisms a b},
    twoMorphisms f g → twoMorphisms g h → twoMorphisms f h
  horizontalComposition : ∀ {a b c : objects} {f g : morphisms a b} {h k : morphisms b c},
    twoMorphisms f g → twoMorphisms h k → twoMorphisms (h ∘ f) (k ∘ g)
  associativity : ∀ {a b c d : objects} (f : morphisms a b) (g : morphisms b c) (h : morphisms c d),
    twoMorphisms ((h ∘ g) ∘ f) (h ∘ (g ∘ f))
  unitors : ∀ {a b : objects} (f : morphisms a b),
    twoMorphisms (f ∘ (identity a)) f ∧ twoMorphisms ((identity b) ∘ f) f

structure BicategoryObject (B : BicategoryPackage) where
  coherenceCondition : Prop
  strictnessProp : Prop
  conclusion : coherenceCondition ∧ strictnessProp

structure BicategoryEvidence (B : BicategoryPackage) (O : BicategoryObject B) where
  coherenceConditionClosed : O.coherenceCondition
  strictnessPropClosed : O.strictnessProp

def BicategoryClosed (B : BicategoryPackage) (O : BicategoryObject B) : Prop :=
  O.coherenceCondition ∧ O.strictnessProp

theorem bicategory_closed_from_evidence (B : BicategoryPackage) (O : BicategoryObject B)
    (E : BicategoryEvidence B O) : BicategoryClosed B O := by
  exact And.intro E.coherenceConditionClosed E.strictnessPropClosed

end CategoryTheoryHigherCategoriesCanonicalLaneLean
end HautevilleHouse