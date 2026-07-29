import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryHigherCategoriesCanonicalLaneLean

structure UniversalConstructionPackage where
  initialObject : Prop
  terminalObject : Prop
  productExistence : Prop
  coproductExistence : Prop
  limitExistence : Prop
  colimitExistence : Prop
  equalizerExistence : Prop
  coequalizerExistence : Prop
  pullbackExistence : Prop
  pushoutExistence : Prop

structure UniversalConstructionEvidence (U : UniversalConstructionPackage) where
  initialObjectClosed : U.initialObject
  terminalObjectClosed : U.terminalObject
  productExistenceClosed : U.productExistence
  coproductExistenceClosed : U.coproductExistence
  limitExistenceClosed : U.limitExistence
  colimitExistenceClosed : U.colimitExistence
  equalizerExistenceClosed : U.equalizerExistence
  coequalizerExistenceClosed : U.coequalizerExistence
  pullbackExistenceClosed : U.pullbackExistence
  pushoutExistenceClosed : U.pushoutExistence

def UniversalConstructionClosed (U : UniversalConstructionPackage) : Prop :=
  U.initialObject ∧ U.terminalObject ∧ U.productExistence ∧ U.coproductExistence ∧
  U.limitExistence ∧ U.colimitExistence ∧ U.equalizerExistence ∧ U.coequalizerExistence ∧
  U.pullbackExistence ∧ U.pushoutExistence

theorem universal_construction_closed_from_evidence
    (U : UniversalConstructionPackage) (E : UniversalConstructionEvidence U) :
    UniversalConstructionClosed U := by
  exact And.intro E.initialObjectClosed
    (And.intro E.terminalObjectClosed
      (And.intro E.productExistenceClosed
        (And.intro E.coproductExistenceClosed
          (And.intro E.limitExistenceClosed
            (And.intro E.colimitExistenceClosed
              (And.intro E.equalizerExistenceClosed
                (And.intro E.coequalizerExistenceClosed
                  (And.intro E.pullbackExistenceClosed E.pushoutExistenceClosed))))))))

end CategoryTheoryHigherCategoriesCanonicalLaneLean
end HautevilleHouse