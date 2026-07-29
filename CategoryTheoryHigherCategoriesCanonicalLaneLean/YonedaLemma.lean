import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryHigherCategoriesCanonicalLaneLean

structure YonedaLemmaPackage where
  yonedaEmbedding : Prop
  yonedaLemma : Prop
  representableFunctors : Prop
  naturalIsomorphism : Prop
  fullyFaithfulness : Prop

structure YonedaLemmaEvidence (Y : YonedaLemmaPackage) where
  yonedaEmbeddingClosed : Y.yonedaEmbedding
  yonedaLemmaClosed : Y.yonedaLemma
  representableFunctorsClosed : Y.representableFunctors
  naturalIsomorphismClosed : Y.naturalIsomorphism
  fullyFaithfulnessClosed : Y.fullyFaithfulness

def YonedaLemmaClosed (Y : YonedaLemmaPackage) : Prop :=
  Y.yonedaEmbedding ∧ Y.yonedaLemma ∧ Y.representableFunctors ∧ Y.naturalIsomorphism ∧ Y.fullyFaithfulness

theorem yoneda_lemma_closed_from_evidence
    (Y : YonedaLemmaPackage) (E : YonedaLemmaEvidence Y) : YonedaLemmaClosed Y := by
  exact And.intro E.yonedaEmbeddingClosed
    (And.intro E.yonedaLemmaClosed
      (And.intro E.representableFunctorsClosed
        (And.intro E.naturalIsomorphismClosed E.fullyFaithfulnessClosed)))

end CategoryTheoryHigherCategoriesCanonicalLaneLean
end HautevilleHouse