import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryHigherCategoriesCanonicalLaneLean

structure HigherCategoryPackage (n : ℕ) where
  objectSet : Type u
  morphismSets : ℕ → Type u
  compositions : ∀ k, morphismSets k → morphismSets k → morphismSets k
  identityMorphisms : ∀ k, objectSet → morphismSets k
  associativity : Prop
  identityLaw : Prop

structure HigherCategoryEvidence (H : HigherCategoryPackage n) where
  associativityClosed : H.associativity
  identityLawClosed : H.identityLaw

def HigherCategoryClosed (H : HigherCategoryPackage n) : Prop :=
  H.associativity ∧ H.identityLaw

theorem higher_category_closed_from_evidence (H : HigherCategoryPackage n) (E : HigherCategoryEvidence H) :
    HigherCategoryClosed H := by
  exact And.intro E.associativityClosed E.identityLawClosed

end CategoryTheoryHigherCategoriesCanonicalLaneLean
end HautevilleHouse