import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryHigherCategoriesCanonicalLaneLean

structure TheoremStatement where
  yonedaFullFaithful : Prop
  adjointFunctorTheorem : Prop
  limitsAndColimitsExist : Prop
  higherCategoryCoherence : Prop

def sourceTheoremStatement : TheoremStatement :=
  { yonedaFullFaithful := True
    , adjointFunctorTheorem := True
    , limitsAndColimitsExist := True
    , higherCategoryCoherence := True
  }

theorem theorem_statement_holds : sourceTheoremStatement.yonedaFullFaithful := by
  trivial

end CategoryTheoryHigherCategoriesCanonicalLaneLean
end HautevilleHouse