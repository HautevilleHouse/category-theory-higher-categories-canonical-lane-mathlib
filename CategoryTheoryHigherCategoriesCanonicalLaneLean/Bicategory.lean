import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryHigherCategoriesCanonicalLaneLean

structure BicategoryPackage where
  0cells : Type u
  1cells : 0cells -> 0cells -> Type v
  2cells : ∀ (a b : 0cells) (f g : 1cells a b), Type w
  composition1 : ∀ (a b c : 0cells), 1cells b c -> 1cells a b -> 1cells a c
  composition2 : ∀ (a b : 0cells) (f g h : 1cells a b), 2cells a b g h -> 2cells a b f g -> 2cells a b f h
  associator : ∀ (a b c d : 0cells) (f : 1cells a b) (g : 1cells b c) (h : 1cells c d), 2cells a d (composition1 a c d h (composition1 a b c g f)) (composition1 a b d (composition1 b c d h g) f)
  leftUnitor : ∀ (a b : 0cells) (f : 1cells a b), 2cells a b (composition1 a b b (identity1 b) f) f
  rightUnitor : ∀ (a b : 0cells) (f : 1cells a b), 2cells a b (composition1 a a b f (identity1 a)) f
  pentagonIdentity : Prop
  triangleIdentity : Prop
  coherenceConditions : Prop
  pentagonIdentityTerm : pentagonIdentity
  triangleIdentityTerm : triangleIdentity
  coherenceConditionsTerm : coherenceConditions

structure BicategoryEvidence (B : BicategoryPackage) where
  pentagonIdentityClosed : B.pentagonIdentity
  triangleIdentityClosed : B.triangleIdentity
  coherenceConditionsClosed : B.coherenceConditions

def BicategoryClosed (B : BicategoryPackage) : Prop :=
  B.pentagonIdentity ∧ B.triangleIdentity ∧ B.coherenceConditions

theorem bicategory_closed_from_evidence (B : BicategoryPackage) (E : BicategoryEvidence B) :
    BicategoryClosed B := by
  exact And.intro E.pentagonIdentityClosed (And.intro E.triangleIdentityClosed E.coherenceConditionsClosed)

end CategoryTheoryHigherCategoriesCanonicalLaneLean
end HautevilleHouse