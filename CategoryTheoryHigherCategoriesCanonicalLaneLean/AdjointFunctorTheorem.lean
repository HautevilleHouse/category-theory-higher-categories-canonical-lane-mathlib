import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryHigherCategoriesCanonicalLaneLean

structure AdjointFunctorPackage where
  leftAdjointExists : Prop
  rightAdjointExists : Prop
  unitNaturalTransformation : Prop
  counitNaturalTransformation : Prop
  triangleIdentities : Prop
  adjointEquivalence : Prop

structure AdjointFunctorEvidence (A : AdjointFunctorPackage) where
  leftAdjointExistsClosed : A.leftAdjointExists
  rightAdjointExistsClosed : A.rightAdjointExists
  unitNaturalTransformationClosed : A.unitNaturalTransformation
  counitNaturalTransformationClosed : A.counitNaturalTransformation
  triangleIdentitiesClosed : A.triangleIdentities
  adjointEquivalenceClosed : A.adjointEquivalence

def AdjointFunctorClosed (A : AdjointFunctorPackage) : Prop :=
  A.leftAdjointExists ∧ A.rightAdjointExists ∧ A.unitNaturalTransformation ∧
  A.counitNaturalTransformation ∧ A.triangleIdentities ∧ A.adjointEquivalence

theorem adjoint_functor_closed_from_evidence
    (A : AdjointFunctorPackage) (E : AdjointFunctorEvidence A) : AdjointFunctorClosed A := by
  exact And.intro E.leftAdjointExistsClosed
    (And.intro E.rightAdjointExistsClosed
      (And.intro E.unitNaturalTransformationClosed
        (And.intro E.counitNaturalTransformationClosed
          (And.intro E.triangleIdentitiesClosed E.adjointEquivalenceClosed))))

end CategoryTheoryHigherCategoriesCanonicalLaneLean
end HautevilleHouse