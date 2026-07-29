import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryHigherCategoriesCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  AdmissibleObjectClosure A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end CategoryTheoryHigherCategoriesCanonicalLaneLean
end HautevilleHouse