import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryHigherCategoriesCanonicalLaneLean

structure HigherCategoryStructure where
  objectsExist : Prop
  morphismsExist : Prop
  2MorphismsExist : Prop
  compositionLaws : Prop
  associativityConstraints : Prop
  unitConstraints : Prop
  coherenceConditions : Prop

def HigherCategoryClosed (H : HigherCategoryStructure) : Prop :=
  H.objectsExist ∧ H.morphismsExist ∧ H.2MorphismsExist ∧ H.compositionLaws ∧
  H.associativityConstraints ∧ H.unitConstraints ∧ H.coherenceConditions

theorem higher_category_closed (H : HigherCategoryStructure) (hObj : H.objectsExist) (hMor : H.morphismsExist) (h2Mor : H.2MorphismsExist) (hComp : H.compositionLaws) (hAssoc : H.associativityConstraints) (hUnit : H.unitConstraints) (hCoh : H.coherenceConditions) : HigherCategoryClosed H := by
  exact And.intro hObj (And.intro hMor (And.intro h2Mor (And.intro hComp (And.intro hAssoc (And.intro hUnit hCoh)))))

end CategoryTheoryHigherCategoriesCanonicalLaneLean
end HautevilleHouse