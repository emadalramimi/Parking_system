with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Text_IO;         use Ada.Text_IO;
with parking; use parking;
with voiture; use voiture;
with actions_parking; use actions_parking;

procedure menu is
   N : integer;
   p: Type_Parking;
   v: Type_Voiture;
   pr: Integer;
   rang: Integer:=0;
   pos: Integer;
   plc: Integer; -- Emplacement de voiture
   pgnb: Type_Voiture;--Plus grand numero de place
begin

   
   loop
      Put_Line("################## MENU ##################");
      new_line;
      put_Line("Choisissez votre programme a tester en entrant son numero");
      new_line;
      put_line("Liste des programmes a tester :");
      Put_Line("0  : Remplissage du parking manuellement a partir du clavier");
      Put_Line("1  : Affichage de la liste de voitures du parking");
      Put_Line("2  : Trouver une voiture dans le parking");
      Put_Line("3  : Ajouter une voiture dans le parking");
      Put_Line("4  : Ajouter une voiture dans le parking dans une position donnee");
      Put_Line("5  : Supprimer une voiture dans le parking");
      Put_Line("6  : Supprimer une voiture dans le parking dans une position donnee");
      Put_Line("7  : Calculer le nombre de places disponibles");
      Put_Line("8  : Obtenir la voiture avec la plus longue duree");
      Put_Line("9  : Obtenir le tarif pour une duree");
      Put_Line("10 : Obtenir le numero de la place la plus grande");
      Put_Line("ENTREZ AUTRE CHOSE POUR QUITTER");
   
      get(N);
      case N is
         when 0 =>
            remplir_parking(p); New_Line;
         when 1 =>
            afficher_parking(p); New_Line;
         when 2 =>
            put_line("Entrez la voiture que vous cherchez");
            lire_voiture(v);
            if trouver_voiture(p, v) = True then
               put_line("La voiture existe au rang: ");
               put(rang);
               New_Line;
            else
               put_line("La voiture n'existe pas");
            end if;
            New_Line;
         when 3 =>
            put("Ajout d'une voiture a la fin du parking");
            ajouter_voiture(p,v); New_Line;
            afficher_parking(p); New_Line;
         when 4 =>
            put("Ajouter une voiture a la position : ");
            get(pos); New_Line;
            ajouter_voiture_pos(p,v,pos);
            afficher_parking(p); New_Line;
         when 5 =>
            put("Suppression d'une voiture (en fin de parking) : ");
            supprimer_voiture (p); New_Line;
            afficher_parking(p); New_Line;
         when 6 =>
            put("Supprimez une voiture a la position");
            get(pos); New_Line;
            supprimer_voiture_pos(p,pos);
            afficher_parking(p); New_Line;
         when 7 =>
            pr:=nb_places_disponibles(p);
            put(pr); New_Line;
         when 8 =>
            obtenir_voiture_plus_longue_duree(p); New_Line;
         when 9 =>
            put("Quelle voiture voulez-vous le tarif (entrez le placement dans le parking)");
            get(plc);
            obtenir_tarif (p.voiture(plc).place); New_Line;
         when 10 =>
            put("Voici la voiture avec le plus grand numero de place : ");
            pgnb:= obtenir_plus_grand_num_place(p);
            afficher_voiture(pgnb); New_Line;
         when others =>
            exit;
      end case;
   end loop;
end Menu;
