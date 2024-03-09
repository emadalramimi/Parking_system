with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Text_IO;         use Ada.Text_IO;
with parking; use parking;
with voiture; use voiture;

package actions_parking is

   function nb_places_disponibles ( p : in Type_parking ) return Integer;
   procedure obtenir_tarif(d : in Integer);
   procedure obtenir_voiture_plus_longue_duree(p:in Type_Parking);
   function obtenir_plus_grand_num_place (p : in Type_parking) return type_voiture;
   procedure lire_parking_from_file(nom_fic : in String; p : out Type_Parking);

end actions_parking;
