import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryHigherCategoriesCanonicalLaneLean

structure HigherCategoryType where
  objects : Type u
  morphisms : Nat → Type v
  compositions : ∀ n, morphisms (n+1) → morphisms (n+1)
  identities : ∀ x : objects, morphisms 1
  associativity : ∀ n, ∀ f g h : morphisms (n+2), compositions _ (compositions _ f g) h = compositions _ f (compositions _ g h)
  unitLaws : ∀ (x y : objects) (f : morphisms 1), compositions _ (identities x) f = f
  unitRaws : ∀ (x y : objects) (f : morphisms 1), compositions _ f (identities y) = f

def higherCategoryTypeClosed (C : HigherCategoryType) : Prop :=
  True

structure EnrichedCategoryType (V : Type u) [MonoidalCategory V] where
  objects : Type v
  hom : objects → objects → V
  identity : ∀ x : objects, hom x x
  composition : ∀ x y z : objects, hom y z ⊗ hom x y → hom x z
  associativityLaw : ∀ w x y z : objects, (composition w x z) ∘ (composition x y z ⊗₁ 𝟙) ∘ α_Inv _ _ _ = (composition w y z) ∘ (𝟙 ⊗₁ composition w x y) ∘ α _ _ _
  unityLawLeft : ∀ x y : objects, (composition x x y) ∘ (identity x ⊗₁ 𝟙) = λ x y => _
  unityLawRight : ∀ x y : objects, (composition x y y) ∘ (𝟙 ⊗₁ identity y) = λ x y => _

end CategoryTheoryHigherCategoriesCanonicalLaneLean
end HautevilleHouse