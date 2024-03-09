with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Text_IO;         use Ada.Text_IO;
with voiture; use voiture;

package body parking is
   
   -- QUESTION 3
   
   procedure remplir_parking (p:out Type_parking) is
      nbElements : Integer; -- nb d'elements dans le tableau
      valeurFin : Character;
   begin
      nbElements := 1;
      p.nb_voitures:=0;
      valeurFin := 'O';
      while nbElements <= NB_MAX and (valeurFin = 'o' or valeurFin = 'O')  loop
         Put_Line("Saisir une voiture ");
         lire_voiture(p.voiture(nbElements));
         Put_Line("Entrez O pour en ajouter une autre ");
         get(valeurFin);
         nbElements := nbElements +1;
      end loop;
      p.nb_voitures := nbElements-1;
   end remplir_parking;
   
   
   -- QUESTION 4
   
   procedure afficher_parking (p:in Type_parking) is
      i : Integer; -- indice
      begin
         i := 1;
         while i <= p.nb_voitures loop
            afficher_voiture(p.voiture(i));
            New_Line;
            i := i + 1;
         end loop;
   end afficher_parking;
   
   -- QUESTION 6
   
   function trouver_voiture (p : in Type_parking; v : in type_voiture) return Boolean is
      i : Integer;
   begin
      i := 1;
      while i<= p.nb_voitures and then not egalite(v,p.voiture(i)) loop
         i := i+1;
      end loop;
      if i > p.nb_voitures then
         return false;
      end if;
      return True;
   end trouver_voiture;
   
   -- QUESTION 7
   
   procedure ajouter_voiture (p: in out Type_parking; v: in Type_Voiture) is

   begin
      p.nb_voitures := p.nb_voitures +1;
      p.voiture(p.nb_voitures).num:=obtenir_matricule(v);
      p.voiture(p.nb_voitures).place:=obtenir_num_place(v);
      p.voiture(p.nb_voitures).heureEntree:=v.heureEntree;

   end ajouter_voiture;
   
   -- QUESTION 8
   
   procedure ajouter_voiture_pos (p: in out Type_parking; v : in type_voiture; pos : in Integer) is
       l : Integer;
   begin
      p.nb_voitures := p.nb_voitures +1;
      l := p.nb_voitures-1;
      while l > pos loop
         p.voiture(l).num:= obtenir_matricule(p.voiture(l-1));
         p.voiture(l).place:= obtenir_num_place(p.voiture(l-1));
         p.voiture(l).heureEntree:=p.voiture(l-1).heureEntree;
         l := l -1;
      end loop;
      p.voiture(pos).num :=obtenir_matricule(v);
      p.voiture(pos).place:= obtenir_num_place(v);
      p.voiture(l).heureEntree:=p.voiture(l-1).heureEntree;
   end ajouter_voiture_pos;
   
   -- QUESTION 9
   
   procedure supprimer_voiture ( p : in out Type_parking) is
   begin
      p.nb_voitures:= p.nb_voitures-1;
   end supprimer_voiture;
   
   -- QUESTION 10
   
   procedure supprimer_voiture_pos (p:in out Type_parking;
                                    pos : in Integer) is
    l : Integer;
   begin
      
      l := pos;
      while l < p.nb_voitures loop
         p.voiture(l).num:= obtenir_matricule(p.voiture(l+1));
         p.voiture(l).place:= obtenir_num_place(p.voiture(l+1));
         p.voiture(l).heureEntree:=p.voiture(l+1).heureEntree;
         l := l +1;
      end loop;
      p.nb_voitures := p.nb_voitures -1;
   end supprimer_voiture_pos;
   
     
   
   

end parking;
