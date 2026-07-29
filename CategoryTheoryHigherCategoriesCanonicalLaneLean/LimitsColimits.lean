import CategoryTheoryHigherCategoriesCanonicalLaneLean.AdmissibleClass
import Mathlib.CategoryTheory.Limits.Types

namespace HautevilleHouse
namespace CategoryTheoryHigherCategoriesCanonicalLaneLean

open Mathlib.CategoryTheory.Limits

structure LimitsPackage (A : AdmissibleClass) where
  hasLimits : Prop
  hasColimits : Prop
  limitFormula : Prop
  colimitFormula : Prop
  hasLimitsClosed : hasLimits
  hasColimitsClosed : hasColimits
  limitFormulaClosed : limitFormula
  colimitFormulaClosed : colimitFormula

def LimitsClosed (A : AdmissibleClass) (L : LimitsPackage A) : Prop :=
  L.hasLimits ∧ L.hasColimits ∧ L.limitFormula ∧ L.colimitFormula

theorem limits_closed_from_evidence (A : AdmissibleClass) (L : LimitsPackage A) : LimitsClosed A L :=
  And.intro L.hasLimitsClosed (And.intro L.hasColimitsClosed (And.intro L.limitFormulaClosed L.colimitFormulaClosed))

structure LimitsBridge (A : AdmissibleClass) where
  package : LimitsPackage A
  bridgesToClosure : bridgeClosed A

theorem limits_bridge_from_package (A : AdmissibleClass) (B : LimitsBridge A) : bridgeClosed A :=
  B.bridgesToClosure

end CategoryTheoryHigherCategoriesCanonicalLaneLean
end HautevilleHouse
