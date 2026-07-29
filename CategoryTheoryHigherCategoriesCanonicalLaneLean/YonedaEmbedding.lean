import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryHigherCategoriesCanonicalLaneLean

structure YonedaEmbeddingPackage where
  sourceCategory : Type u
  targetCategory : Type v
  homFunctor : sourceCategory → (sourceCategory ⥤ Type v)
  embeddingFullyFaithful : Prop
  naturalityCondition : Prop
  yonedaLemma : Prop

structure YonedaEmbeddingEvidence (Y : YonedaEmbeddingPackage) where
  embeddingFullyFaithfulClosed : Y.embeddingFullyFaithful
  naturalityConditionClosed : Y.naturalityCondition
  yonedaLemmaClosed : Y.yonedaLemma

def YonedaEmbeddingClosed (Y : YonedaEmbeddingPackage) : Prop :=
  Y.embeddingFullyFaithful ∧ Y.naturalityCondition ∧ Y.yonedaLemma

theorem yoneda_embedding_closed_from_evidence (Y : YonedaEmbeddingPackage) (E : YonedaEmbeddingEvidence Y) :
    YonedaEmbeddingClosed Y := by
  exact And.intro E.embeddingFullyFaithfulClosed
    (And.intro E.naturalityConditionClosed E.yonedaLemmaClosed)

end CategoryTheoryHigherCategoriesCanonicalLaneLean
end HautevilleHouse