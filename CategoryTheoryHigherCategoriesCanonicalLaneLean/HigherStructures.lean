import CategoryTheoryHigherCategoriesCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryHigherCategoriesCanonicalLaneLean

structure HigherStructuresPackage (A : AdmissibleClass) where
  bicategoryStructure : Prop
  pseudofunctor : Prop
  coherenceData : Prop
  bicategoryStructureClosed : bicategoryStructure
  pseudofunctorClosed : pseudofunctor
  coherenceDataClosed : coherenceData

def HigherStructuresClosed (A : AdmissibleClass) (H : HigherStructuresPackage A) : Prop :=
  H.bicategoryStructure ∧ H.pseudofunctor ∧ H.coherenceData

theorem higher_structures_closed_from_evidence (A : AdmissibleClass) (H : HigherStructuresPackage A) : HigherStructuresClosed A H :=
  And.intro H.bicategoryStructureClosed (And.intro H.pseudofunctorClosed H.coherenceDataClosed)

structure HigherStructuresBridge (A : AdmissibleClass) where
  package : HigherStructuresPackage A
  bridgesToClosure : bridgeClosed A

theorem higher_structures_bridge_from_package (A : AdmissibleClass) (B : HigherStructuresBridge A) : bridgeClosed A :=
  B.bridgesToClosure

end CategoryTheoryHigherCategoriesCanonicalLaneLean
end HautevilleHouse
