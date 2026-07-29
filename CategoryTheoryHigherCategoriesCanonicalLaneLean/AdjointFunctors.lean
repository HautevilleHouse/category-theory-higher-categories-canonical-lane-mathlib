import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryHigherCategoriesCanonicalLaneLean

structure AdjointPair (C D : HigherCategoryType) where
  leftAdjoint : C → D
  rightAdjoint : D → C
  unit : Id_C → rightAdjoint ∘ leftAdjoint
  counit : leftAdjoint ∘ rightAdjoint → Id_D
  triangleIdentities : Prop

def adjunctionClosed (C D : HigherCategoryType) (F : AdjointPair C D) : Prop :=
  F.triangleIdentities

theorem adjoint_functors_closed (C D : HigherCategoryType) (F : AdjointPair C D) : adjunctionClosed C D F := by
  exact F.triangleIdentities

end CategoryTheoryHigherCategoriesCanonicalLaneLean
end HautevilleHouse