with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Text_IO;         use Ada.Text_IO;
with parking; use parking;
with voiture; use voiture;

package body actions_parking is

   function nb_places_disponibles ( p : in Type_parking ) return Integer is
   begin
      return NB_MAX-p.nb_voitures;
   end nb_places_disponibles;
   
   procedure obtenir_tarif(d : in Integer) is
   begin
      put("Vous devez payer : ");
      if d > 0 and d <= 3600 then
         put("0.16 euros");
      elsif d > 3600 and d <= 7200 then
         put("0.20 euros");
      elsif d > 7200 and d <= 10800 then
         put("0.32 euros");
      elsif d > 10800 then
         put("0.60 euros");
      end if;
      new_line;
   end obtenir_tarif;
   
 
   procedure obtenir_voiture_plus_longue_duree(p:in Type_Parking) is

      i: Integer; --Indice de parcours des voitures du parking
      vmax: Type_Voiture; --Voiture duree max
      dmax: Integer; --Duree max
      d: Integer; --duree voiture actuelle
      S_h: Integer; -- heure de sortie
      S_m: Integer; -- minutes de sortie

   begin 

      dmax:=-1;

      i:= 1;
      while i <= p.nb_voitures loop
         put("Entrez l'heure de sortie de la voiture ");
         put(i);
         New_Line;
         get(S_h);

         while S_h > 23 or S_h < 0 loop
            put("Entrez l'heure de sortie de la voiture ");
            get(S_h);
         end loop;

         put("Entrez les minutes de sortie de la meme voiture ");
         New_Line;
         get(S_m);

         while S_m > 59 or S_m < 0 loop
            put("Entrez les minutes de sortie de la meme voiture ");
            get(S_m);
         end loop;

         d:= calculer_duree_stationnement(p.voiture(i), S_h, S_m);
         if d > dmax then
            dmax:= d;
            vmax:= p.voiture(i);
         end if;
         i:= i+1;
      end loop;
      put("La voiture avec la plus longue duree est: ");
      new_line;
      afficher_voiture(vmax);
   end obtenir_voiture_plus_longue_duree;
   
   function obtenir_plus_grand_num_place (p : in Type_parking) return type_voiture is
       i: Integer; --indice de parcours du tableau
      max : type_voiture; --la plus grade place
      maxplace : Integer;
   begin
      i := 2;
      maxplace :=p.voiture(1).place;
      while i <= p.nb_voitures loop
         if p.voiture(i).place > maxplace then
            max := p.voiture(i);
            maxplace := p.voiture(i).place;
         end if;
         i := i + 1;
      end loop;
      
      return max;

   end obtenir_plus_grand_num_place;
   
   procedure lire_parking_from_file(nom_fic : in String; p : out Type_Parking) is
      S : String(1..9);
      fichier : File_Type;
      plaque : Character;
      i : Integer;
      n : Natural;
      j : Integer;
   begin
      -- on ouvre le fichier
      open (fichier, In_File, nom_fic);
   
      i:=1;
      while not End_Of_File(fichier) loop
         j:=1;
         while not End_Of_Line(fichier) loop   
            -- plaque d'immatriculation
            Get(fichier, plaque);
            p.voiture(i).num(j) := plaque;
            j:=j+1;
         end loop;
         Skip_Line(fichier);
         -- place
         Get_Line(fichier, S,n );
         p.voiture(i).place := Integer'Value (S(1..n));

         Get_Line(fichier, S, n);
         p.voiture(i).heureEntree := Integer'Value (S(1..n));
         
         i:=i+1;
      end loop;
      -- fermeture du fichier et mise en place du nb de voitures
      close (fichier);
      p.nb_voitures := i-1;
   end lire_parking_from_file;
      

   
end actions_parking;
