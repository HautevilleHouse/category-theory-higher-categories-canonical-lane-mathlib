import HautevilleHouse.CategoryTheoryHigherCategoriesCanonicalLaneLean.HigherCategoryAdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryHigherCategoriesCanonicalLaneLean

structure LimitsPackage (A : AdmissibleClass) where
  completeness : Prop
  cocompleteness : Prop
  limitConstruction : Prop

structure LimitsEvidence (A : AdmissibleClass) (L : LimitsPackage A) where
  completenessClosed : L.completeness
  cocompletenessClosed : L.cocompleteness
  limitConstructionClosed : L.limitConstruction

def LimitsClosed (A : AdmissibleClass) (L : LimitsPackage A) : Prop :=
  L.completeness ∧ L.cocompleteness ∧ L.limitConstruction

theorem limits_closed_from_evidence (A : AdmissibleClass) (L : LimitsPackage A)
    (E : LimitsEvidence A L) : LimitsClosed A L := by
  exact And.intro E.completenessClosed
    (And.intro E.cocompletenessClosed E.limitConstructionClosed)

end CategoryTheoryHigherCategoriesCanonicalLaneLean
end HautevilleHouse