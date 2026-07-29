import canonicalLaneMathlib.AdmissibleClass
import CategoryTheoryHigherCategoriesCanonicalLaneLean.YonedaLemma
import CategoryTheoryHigherCategoriesCanonicalLaneLean.AdjointFunctor
import CategoryTheoryHigherCategoriesCanonicalLaneLean.LimitColimit
import CategoryTheoryHigherCategoriesCanonicalLaneLean.MonoidalCategory
import CategoryTheoryHigherCategoriesCanonicalLaneLean.Bicategory

namespace HautevilleHouse
namespace CategoryTheoryHigherCategoriesCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem bridge_from_admissible_class (A : AdmissibleClass) : bridgeClosed A :=
  A.gateWitness

def gateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : AdmissibleClass) : gateClosed A :=
  A.gateWitness

def ConstrainedCategoryTheoryClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_category_theory_endgame (A : AdmissibleClass) :
    ConstrainedCategoryTheoryClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end CategoryTheoryHigherCategoriesCanonicalLaneLean
end HautevilleHouse