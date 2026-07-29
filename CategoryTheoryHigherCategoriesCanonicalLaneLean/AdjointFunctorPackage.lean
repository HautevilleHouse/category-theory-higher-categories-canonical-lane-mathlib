import HautevilleHouse.CategoryTheoryHigherCategoriesCanonicalLaneLean.YonedaLemmaPackage

namespace HautevilleHouse
namespace CategoryTheoryHigherCategoriesCanonicalLaneLean

structure AdjointFunctorPackage where
  leftAdjointExists : Prop
  rightAdjointExists : Prop
  unitCounitSatisfied : Prop
  universalPropertyHolds : Prop

structure AdjointFunctorEvidence (A : AdjointFunctorPackage) where
  leftAdjointExistsClosed : A.leftAdjointExists
  rightAdjointExistsClosed : A.rightAdjointExists
  unitCounitSatisfiedClosed : A.unitCounitSatisfied
  universalPropertyHoldsClosed : A.universalPropertyHolds

def AdjointFunctorClosed (A : AdjointFunctorPackage) : Prop :=
  A.leftAdjointExists ∧ A.rightAdjointExists ∧ A.unitCounitSatisfied ∧ A.universalPropertyHolds

theorem adjoint_functor_closed_from_evidence (A : AdjointFunctorPackage) (E : AdjointFunctorEvidence A) :
    AdjointFunctorClosed A := by
  exact And.intro E.leftAdjointExistsClosed
    (And.intro E.rightAdjointExistsClosed
      (And.intro E.unitCounitSatisfiedClosed E.universalPropertyHoldsClosed))

end CategoryTheoryHigherCategoriesCanonicalLaneLean
end HautevilleHouse