import HautevilleHouse.CategoryTheoryHigherCategoriesCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryHigherCategoriesCanonicalLaneLean

structure YonedaLemmaPackage where
  yonedaEmbeddingFullyFaithful : Prop
  representableFunctorProperties : Prop
  naturalityCondition : Prop

structure YonedaLemmaEvidence (Y : YonedaLemmaPackage) where
  yonedaEmbeddingFullyFaithfulClosed : Y.yonedaEmbeddingFullyFaithful
  representableFunctorPropertiesClosed : Y.representableFunctorProperties
  naturalityConditionClosed : Y.naturalityCondition

def YonedaLemmaClosed (Y : YonedaLemmaPackage) : Prop :=
  Y.yonedaEmbeddingFullyFaithful ∧ Y.representableFunctorProperties ∧ Y.naturalityCondition

theorem yoneda_lemma_closed_from_evidence (Y : YonedaLemmaPackage) (E : YonedaLemmaEvidence Y) :
    YonedaLemmaClosed Y := by
  exact And.intro E.yonedaEmbeddingFullyFaithfulClosed
    (And.intro E.representableFunctorPropertiesClosed E.naturalityConditionClosed)

end CategoryTheoryHigherCategoriesCanonicalLaneLean
end HautevilleHouse