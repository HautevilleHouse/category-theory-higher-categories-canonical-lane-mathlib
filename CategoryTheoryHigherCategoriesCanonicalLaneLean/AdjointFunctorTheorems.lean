import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryHigherCategoriesCanonicalLaneLean

structure AdjointFunctorPackage where
  leftAdjointExists : Prop
  rightAdjointExists : Prop
  unitCounitGiven : Prop
  adjunctionSatisfied : Prop
  freydMitchellEmbedding : Prop

def AdjointFunctorClosed (A : AdjointFunctorPackage) : Prop :=
  A.leftAdjointExists ∧ A.rightAdjointExists ∧ A.unitCounitGiven ∧ A.adjunctionSatisfied ∧ A.freydMitchellEmbedding

theorem adjoint_functor_closed (A : AdjointFunctorPackage) (hL : A.leftAdjointExists) (hR : A.rightAdjointExists) (hUC : A.unitCounitGiven) (hAdj : A.adjunctionSatisfied) (hFME : A.freydMitchellEmbedding) : AdjointFunctorClosed A := by
  exact And.intro hL (And.intro hR (And.intro hUC (And.intro hAdj hFME)))

end CategoryTheoryHigherCategoriesCanonicalLaneLean
end HautevilleHouse