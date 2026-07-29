import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryHigherCategoriesCanonicalLaneLean

structure KanExtensionPackage (A : Type u) [Category A] (B : Type v) [Category B] (C : Type w) [Category C] where
  functor : A ⥤ C
  extension : (A ⥤ B) → (B ⥤ C)
  unitNatural : ∀ (F : A ⥤ B), F ≅ (extension F) ⋙ functor
  universalProperty : Prop

structure KanExtensionEvidence {A : Type u} [Category A] {B : Type v} [Category B] {C : Type w} [Category C] (K : KanExtensionPackage A B C) where
  unitNaturalClosed : ∀ (F : A ⥤ B), K.unitNatural F
  universalPropertyClosed : K.universalProperty

def KanExtensionClosed {A : Type u} [Category A] {B : Type v} [Category B] {C : Type w} [Category C] (K : KanExtensionPackage A B C) : Prop :=
  (∀ F, K.unitNatural F) ∧ K.universalProperty

theorem kan_extension_closed_from_evidence {A : Type u} [Category A] {B : Type v} [Category B] {C : Type w} [Category C] (K : KanExtensionPackage A B C) (E : KanExtensionEvidence K) :
    KanExtensionClosed K := by
  exact And.intro E.unitNaturalClosed E.universalPropertyClosed

end CategoryTheoryHigherCategoriesCanonicalLaneLean
end HautevilleHouse