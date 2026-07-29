import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryHigherCategoriesCanonicalLaneLean

structure SimplicialSetPackage where
  simplicialSet : Type u → Type v
  hornFillerCondition : Prop
  modelStructure : Prop

structure SimplicialSetEvidence (S : SimplicialSetPackage) where
  hornFillerConditionClosed : S.hornFillerCondition
  modelStructureClosed : S.modelStructure

def SimplicialSetClosed (S : SimplicialSetPackage) : Prop :=
  S.hornFillerCondition ∧ S.modelStructure

theorem simplicial_set_closed_from_evidence (S : SimplicialSetPackage) (E : SimplicialSetEvidence S) :
    SimplicialSetClosed S := by
  exact And.intro E.hornFillerConditionClosed E.modelStructureClosed

structure WeakNCategoryPackage where
  nCells : ℕ → Type u
  composition : Prop
  coherenceConditions : Prop

structure WeakNCategoryEvidence (W : WeakNCategoryPackage) where
  compositionClosed : W.composition
  coherenceConditionsClosed : W.coherenceConditions

def WeakNCategoryClosed (W : WeakNCategoryPackage) : Prop :=
  W.composition ∧ W.coherenceConditions

theorem weak_n_category_closed_from_evidence (W : WeakNCategoryPackage) (E : WeakNCategoryEvidence W) :
    WeakNCategoryClosed W := by
  exact And.intro E.compositionClosed E.coherenceConditionsClosed

end CategoryTheoryHigherCategoriesCanonicalLaneLean
end HautevilleHouse