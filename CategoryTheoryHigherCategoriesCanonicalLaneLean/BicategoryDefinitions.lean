import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryHigherCategoriesCanonicalLaneLean

structure Bicategory where
  objects : Type u
  morphisms : objects → objects → Type v
  twoMorphisms : ∀ {x y : objects}, (f g : morphisms x y) → Type w
  verticalComposition : ∀ {x y : objects} {f g h : morphisms x y}, twoMorphisms f g → twoMorphisms g h → twoMorphisms f h
  horizontalComposition : ∀ {x y z : objects} (f : morphisms x y) (g : morphisms y z) (f' : morphisms x y) (g' : morphisms y z), twoMorphisms f f' → twoMorphisms g g' → twoMorphisms (horizontalComposition f g) (horizontalComposition f' g')
  associativity2 : ∀ {w x y z : objects} (f : morphisms w x) (g : morphisms x y) (h : morphisms y z), twoMorphisms (horizontalComposition (horizontalComposition f g) h) (horizontalComposition f (horizontalComposition g h))
  unit2 : ∀ {x y : objects} (f : morphisms x y), twoMorphisms (horizontalComposition (identity x) f) f
  pentagonEquation2 : Prop

def bicategoryClosure (B : Bicategory) : Prop :=
  B.pentagonEquation2

theorem bicategory_closure_closed (B : Bicategory) : bicategoryClosure B := by
  exact B.pentagonEquation2

end CategoryTheoryHigherCategoriesCanonicalLaneLean
end HautevilleHouse