with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Text_IO;         use Ada.Text_IO;
with parking; use parking;
with voiture; use voiture;

procedure test_parking is
   parking : Type_parking;
   v: type_voiture;
begin
   v.num:="ffaaaaaaa";
   v.place:=5;
   v.heureEntree:=5765;
   
   -- Tester remplir et afficher parking
   remplir_parking(parking);   
   ajouter_voiture(parking,v);
   
   --Tester ajouter voiture dans un position
   ajouter_voiture_pos(parking,v,2);
   afficher_parking(parking);
   
   --Tester ajouter voiture dans le denier position
   ajouter_voiture(parking,v);
   afficher_parking(parking);
   
   --Tester supprimer le dernier voiture 
   supprimer_voiture(parking);
   afficher_parking(parking);
   
   --Tester supprimer voiture position
   supprimer_voiture_pos(parking,2);
   afficher_parking(parking);
   
end test_parking;
