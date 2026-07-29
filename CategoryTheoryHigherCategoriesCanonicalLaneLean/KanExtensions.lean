import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryHigherCategoriesCanonicalLaneLean

structure KanExtensionPackage where
  leftKan : Type u → Type v
  rightKan : Type u → Type v
  universalPropertyLeft : Prop
  universalPropertyRight : Prop
  existenceLeft : Prop
  existenceRight : Prop

structure KanExtensionEvidence (K : KanExtensionPackage) where
  universalPropertyLeftClosed : K.universalPropertyLeft
  universalPropertyRightClosed : K.universalPropertyRight
  existenceLeftClosed : K.existenceLeft
  existenceRightClosed : K.existenceRight

def KanExtensionClosed (K : KanExtensionPackage) : Prop :=
  K.universalPropertyLeft ∧ K.universalPropertyRight ∧
  K.existenceLeft ∧ K.existenceRight

theorem kan_extension_closed_from_evidence (K : KanExtensionPackage) (E : KanExtensionEvidence K) :
    KanExtensionClosed K := by
  exact And.intro E.universalPropertyLeftClosed
    (And.intro E.universalPropertyRightClosed
      (And.intro E.existenceLeftClosed E.existenceRightClosed))

end CategoryTheoryHigherCategoriesCanonicalLaneLean
end HautevilleHouse