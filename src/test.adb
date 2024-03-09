with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Text_IO;         use Ada.Text_IO;
with voiture; use voiture;


procedure test is
   v1 : type_voiture; --voiture 1
   v2 : type_voiture; --voiture 2
   
   voiture : type_voiture;

   
begin
   voiture.num := "asdfghjkl";
     voiture.place := 34;
     afficher_voiture(voiture);
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
  v1.num:= "dd3dd3dd3";
  v2.num:= "dd3dd3dd3";
  
   --lire_voiture(v1);
   --put(calculer_duree_stationnement(v1,2,33));
   --lire_voiture(v2);
   --afficher_voiture(v1);
   --afficher_voiture(v2);
   New_Line;
   if egalite(v1,v2) then
      put("les voitures ont la meme numero d'immatriculation");
   else
      put("les voitures n'ont pas la meme numero d'immatriculation");
   end if;

      
end test;
