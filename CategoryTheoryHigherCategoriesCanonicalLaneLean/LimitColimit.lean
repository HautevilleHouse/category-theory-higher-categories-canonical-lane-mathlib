import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryHigherCategoriesCanonicalLaneLean

structure LimitColimitPackage (J : Type u) [Category J] (C : Type v) [Category C] where
  diagram : J ⥤ C
  cone : Cone diagram
  cocone : Cocone diagram
  universalPropertyLimit : Prop
  universalPropertyColimit : Prop

structure LimitColimitEvidence {J : Type u} [Category J] {C : Type v} [Category C] (L : LimitColimitPackage J C) where
  coneClosed : L.cone.π.app = 0
  coconeClosed : L.cocone.ι.app = 0
  universalPropertyLimitClosed : L.universalPropertyLimit
  universalPropertyColimitClosed : L.universalPropertyColimit

def LimitColimitClosed {J : Type u} [Category J] {C : Type v} [Category C] (L : LimitColimitPackage J C) : Prop :=
  L.universalPropertyLimit ∧ L.universalPropertyColimit

theorem limit_colimit_closed_from_evidence {J : Type u} [Category J] {C : Type v} [Category C] (L : LimitColimitPackage J C) (E : LimitColimitEvidence L) :
    LimitColimitClosed L := by
  exact And.intro E.universalPropertyLimitClosed E.universalPropertyColimitClosed

end CategoryTheoryHigherCategoriesCanonicalLaneLean
end HautevilleHouse