import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryHigherCategoriesCanonicalLaneLean

structure HigherCategoryPackage where
  nCategoryDefinition : Prop
  weakHigherCategory : Prop
  strictHigherCategory : Prop
  infinityCategory : Prop
  compositionLaws : Prop
  coherenceConditions : Prop
  higherMorphisms : Prop

structure HigherCategoryEvidence (H : HigherCategoryPackage) where
  nCategoryDefinitionClosed : H.nCategoryDefinition
  weakHigherCategoryClosed : H.weakHigherCategory
  strictHigherCategoryClosed : H.strictHigherCategory
  infinityCategoryClosed : H.infinityCategory
  compositionLawsClosed : H.compositionLaws
  coherenceConditionsClosed : H.coherenceConditions
  higherMorphismsClosed : H.higherMorphisms

def HigherCategoryClosed (H : HigherCategoryPackage) : Prop :=
  H.nCategoryDefinition ∧ H.weakHigherCategory ∧ H.strictHigherCategory ∧
  H.infinityCategory ∧ H.compositionLaws ∧ H.coherenceConditions ∧ H.higherMorphisms

theorem higher_category_closed_from_evidence
    (H : HigherCategoryPackage) (E : HigherCategoryEvidence H) : HigherCategoryClosed H := by
  exact And.intro E.nCategoryDefinitionClosed
    (And.intro E.weakHigherCategoryClosed
      (And.intro E.strictHigherCategoryClosed
        (And.intro E.infinityCategoryClosed
          (And.intro E.compositionLawsClosed
            (And.intro E.coherenceConditionsClosed E.higherMorphismsClosed)))))

end CategoryTheoryHigherCategoriesCanonicalLaneLean
end HautevilleHouse