with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Text_IO;         use Ada.Text_IO;
with parking; use parking;
with voiture; use voiture;
with actions_parking; use actions_parking;

procedure test_actions_parking is
   p : Type_parking;
   fic : File_Type;
begin
   -- tester nb place disponibles
  -- remplir_parking(p);
  -- put ("Il reste ");
 --  put(nb_places_disponibles(p));
  -- put(" parking");
     
   -- test obtenir tarif
   --obtenir_tarif(calculer_duree_stationnement(p.voiture(1),7,6));
   
   --tester obtenir voiture plus longue duree
   --obtenir_voiture_plus_longue_duree(p);
   
   -- tester obtenir plus grand num place
   --Put_Line("le plus grad place est : ");
   --afficher_voiture(obtenir_plus_grand_num_place(p));
   
   -- tester lecture fichier Parking.txt

   
   
   
end test_actions_parking;
