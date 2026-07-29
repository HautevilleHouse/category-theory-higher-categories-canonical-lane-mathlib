import CategoryTheoryHigherCategoriesCanonicalLaneLean.AdmissibleClass
import canonicalLaneMathlib.AdmissibleClass
import Mathlib.CategoryTheory.Category.Basic
import Mathlib.CategoryTheory.Functor.Basic

namespace HautevilleHouse
namespace CategoryTheoryHigherCategoriesCanonicalLaneLean

open Mathlib.CategoryTheory

structure HigherCategoryObject where
  carrier : Type 1
  obj : Type
  mor : obj → obj → Type
  comp : {a b c : obj} → mor a b → mor b c → mor a c
  assoc : Prop
  identities : Prop
  higherComp : Nat → Prop  -- coherence at higher levels

structure CatAdmittedObject where
  category : HigherCategoryObject
  admitsLimits : Prop
  admitsColimits : Prop
  yonedaEmbeddingFullFaithful : Prop
  conclusion : yonedaEmbeddingFullFaithful

structure CatEndgameState where
  object : CatAdmittedObject

def CatWitnessClosed (O : CatAdmittedObject) : Prop :=
  O.yonedaEmbeddingFullFaithful

end CategoryTheoryHigherCategoriesCanonicalLaneLean
end HautevilleHouse
