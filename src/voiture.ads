

package voiture is
   
   MAX_LENGTH : constant Integer := 9;
   type charArray is array (1 .. MAX_LENGTH) of Character;
   
   type type_voiture is record
      num : charArray;
      place : Integer;
      heureEntree : Integer; 
   end record;

   
   procedure lire_voiture (v : out type_voiture);
   procedure afficher_voiture ( v : in type_voiture);
   function egalite (v1 : in type_voiture;
                     v2 : in type_voiture) return Boolean;
   function obtenir_matricule (v : in type_voiture)  return charArray;
   function obtenir_num_place ( v : in type_voiture) return Integer;
   function calculer_duree_stationnement (v: in type_voiture;
                                         heureSortie_h : Integer;
                                         heureSortie_m : Integer) return Integer;
      
end voiture;
