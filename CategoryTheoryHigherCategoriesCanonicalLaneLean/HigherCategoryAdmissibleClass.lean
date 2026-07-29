import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryHigherCategoriesCanonicalLaneLean

structure HigherCategoryObject where
  carrier : Type u
  higherCells : Nat → Type v
  compositionLaws : Prop
  coherenceConditions : Prop

structure HigherCategoryAdmittedObject where
  category : HigherCategoryObject
  isStrict : Prop
  isFibrant : Prop
  conclusion : isFibrant

def WitnessClosed (O : HigherCategoryAdmittedObject) : Prop :=
  O.conclusion

structure AdmissibleClass where
  object : HigherCategoryAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  WitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end CategoryTheoryHigherCategoriesCanonicalLaneLean
end HautevilleHouse