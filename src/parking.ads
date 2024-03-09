with voiture; use voiture;
package parking is
   
   --
   NB_MAX : constant Integer := 200;
   type voitures is array (1 .. NB_MAX) of type_voiture;
   
   type Type_parking is record 
      voiture : voitures;
      nb_voitures : Integer;
   end record;
   --sous programme remplir un parking
   procedure remplir_parking (p:out Type_parking);
   
   --sous programme affiche un parking
   procedure afficher_parking (p:in Type_parking);
   
   --sous programme trouve un voiture dans un parking
   function trouver_voiture (p : in Type_parking; v : in type_voiture) return Boolean;
   
   --sous programme ajoute un voiture dans un position 
   procedure ajouter_voiture_pos (p: in out Type_parking; v : in type_voiture; pos : in Integer);
   
   --sous programme ajoute un voiture dans le dernier position 
   procedure ajouter_voiture (p: in out Type_parking; v: in Type_Voiture);
   
   --sous programme supprime le dernier voiture dans un parking
   procedure supprimer_voiture ( p : in out Type_parking);
   
    --sous programme supprime un voiture dans un position 
   procedure supprimer_voiture_pos (p:in out Type_parking;
                                    pos : in Integer);
 
end parking;
