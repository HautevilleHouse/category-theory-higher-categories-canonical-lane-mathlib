import HautevilleHouse.CategoryTheoryHigherCategoriesCanonicalLaneLean.HigherCategoryAdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryHigherCategoriesCanonicalLaneLean

structure YonedaPackage (A : AdmissibleClass) where
  yonedaEmbedding : Prop
  fullFaithfulness : Prop
  representability : Prop

structure YonedaEvidence (A : AdmissibleClass) (Y : YonedaPackage A) where
  yonedaEmbeddingClosed : Y.yonedaEmbedding
  fullFaithfulnessClosed : Y.fullFaithfulness
  representabilityClosed : Y.representability

def YonedaClosed (A : AdmissibleClass) (Y : YonedaPackage A) : Prop :=
  Y.yonedaEmbedding ∧ Y.fullFaithfulness ∧ Y.representability

theorem yoneda_closed_from_evidence (A : AdmissibleClass) (Y : YonedaPackage A)
    (E : YonedaEvidence A Y) : YonedaClosed A Y := by
  exact And.intro E.yonedaEmbeddingClosed
    (And.intro E.fullFaithfulnessClosed E.representabilityClosed)

end CategoryTheoryHigherCategoriesCanonicalLaneLean
end HautevilleHouse