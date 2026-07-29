import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryHigherCategoriesCanonicalLaneLean

structure AdjointFunctorPackage (F : Type u → Type v) (G : Type v → Type u) where
  leftAdjoint : F
  rightAdjoint : G
  unitNaturalTransformation : ∀ (X : Type u), X → G (F X)
  counitNaturalTransformation : ∀ (Y : Type v), F (G Y) → Y
  triangleIdentities : Prop

structure AdjointFunctorEvidence {F G : Type u → Type v} (A : AdjointFunctorPackage F G) where
  unitNaturalClosed : ∀ (X : Type u), A.unitNaturalTransformation X ∈ Set.mem
  counitNaturalClosed : ∀ (Y : Type v), A.counitNaturalTransformation Y ∈ Set.mem
  triangleIdentitiesClosed : A.triangleIdentities

def AdjointFunctorClosed {F G : Type u → Type v} (A : AdjointFunctorPackage F G) : Prop :=
  (∀ X, A.unitNaturalTransformation X ∈ Set.mem) ∧ (∀ Y, A.counitNaturalTransformation Y ∈ Set.mem) ∧ A.triangleIdentities

theorem adjoint_functor_closed_from_evidence {F G : Type u → Type v} (A : AdjointFunctorPackage F G) (E : AdjointFunctorEvidence A) :
    AdjointFunctorClosed A := by
  exact And.intro E.unitNaturalClosed (And.intro E.counitNaturalClosed E.triangleIdentitiesClosed)

end CategoryTheoryHigherCategoriesCanonicalLaneLean
end HautevilleHouse