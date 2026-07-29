import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryHigherCategoriesCanonicalLaneLean

structure LimitsColimitsPackage where
  productExists : Prop
  coproductExists : Prop
  equalizerExists : Prop
  coequalizerExists : Prop
  pullbackExists : Prop
  pushoutExists : Prop
  limitExistence : Prop
  colimitExistence : Prop

def LimitsColimitsClosed (L : LimitsColimitsPackage) : Prop :=
  L.productExists ∧ L.coproductExists ∧ L.equalizerExists ∧ L.coequalizerExists ∧
  L.pullbackExists ∧ L.pushoutExists ∧ L.limitExistence ∧ L.colimitExistence

theorem limits_colimits_closed (L : LimitsColimitsPackage) (hProd : L.productExists) (hCoprod : L.coproductExists) (hEq : L.equalizerExists) (hCoeq : L.coequalizerExists) (hPull : L.pullbackExists) (hPush : L.pushoutExists) (hLim : L.limitExistence) (hColim : L.colimitExistence) : LimitsColimitsClosed L := by
  exact And.intro hProd (And.intro hCoprod (And.intro hEq (And.intro hCoeq (And.intro hPull (And.intro hPush (And.intro hLim hColim))))))

end CategoryTheoryHigherCategoriesCanonicalLaneLean
end HautevilleHouse