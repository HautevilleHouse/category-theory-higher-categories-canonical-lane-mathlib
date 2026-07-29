import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryHigherCategoriesCanonicalLaneLean

structure MonoidalCategory where
  tensorProduct : HigherCategoryType → HigherCategoryType → HigherCategoryType
  unitObject : HigherCategoryType
  associator : ∀ A B C : HigherCategoryType, tensorProduct (tensorProduct A B) C ≅ tensorProduct A (tensorProduct B C)
  leftUnitor : ∀ A : HigherCategoryType, tensorProduct unitObject A ≅ A
  rightUnitor : ∀ A : HigherCategoryType, tensorProduct A unitObject ≅ A
  pentagonEquation : ∀ A B C D : HigherCategoryType, (associator A B C ⊗ Id_D) ∘ associator A (tensorProduct B C) D ∘ (Id_A ⊗ associator B C D) = associator (tensorProduct A B) C D ∘ associator A B (tensorProduct C D)

def monoidalCategoryClosed (M : MonoidalCategory) : Prop :=
  M.pentagonEquation

theorem monoidal_structure_closed (M : MonoidalCategory) : monoidalCategoryClosed M := by
  exact M.pentagonEquation

end CategoryTheoryHigherCategoriesCanonicalLaneLean
end HautevilleHouse