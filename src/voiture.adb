with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Text_IO;         use Ada.Text_IO;

package body voiture is

   procedure lire_voiture (v : out type_voiture) is 
      heureEntree_h : Integer; 
      heureEntree_m : Integer;
      i : Integer; --compteur indices
   begin
      put("Entrez votre numero d'immatriculationc carecteur par carecteur: ");
      i := 1;
      while i <= MAX_LENGTH loop
         get(v.num(i));
         i := i + 1;
      end loop;
      Put_Line("Entrez place du parking");
      get(v.place);

      put("Entrez l'heure d'arivee du votre voiture");
      get(heureEntree_h); New_Line;
      
      while heureEntree_h > 23 or heureEntree_h <0 loop
          put("Entrez une novelle l'heure d'arrivee du votre voiture");
         get(heureEntree_h); New_Line;
      end loop;
         
      put("Entrez les minutes entre votre voiture");
      get(heureEntree_m); New_Line;
       while heureEntree_m > 59 or heureEntree_m <0 loop
          put("Entrez une novelle minutes d'arrivee du votre voiture");
         get(heureEntree_m); New_Line;
        end loop;
      v.heureEntree:=(heureEntree_h*3600)+(heureEntree_m*60);
      New_Line;
   end lire_voiture;
   
   procedure afficher_voiture ( v : in type_voiture) is
      i : Integer; 
   begin
      Put_Line("############ Information ###########"); New_Line;
      put("la voiture avec numero d'immatriculation : ");
      i := 1;
      while i <= MAX_LENGTH loop
         put(v.num(i));
         i := i + 1;
      end loop; New_Line;
      put("est stationee a la place de parking : ");
      put(v.place); New_Line;
      put("et son heure d'arrivee est : ");
      put(v.heureEntree/3600);
      put("h:");
      put((v.heureEntree-(3600*(v.heureEntree/3600)))/60);
      put("m");
      New_Line;
   end afficher_voiture;
   
   function egalite (v1 : in type_voiture;
                     v2 : in type_voiture) return Boolean is
      i : Integer; --compteur indices
   begin
      i := 1;

      while  i <= MAX_LENGTH and then v1.num(i) = v2.num(i) loop
      i := i +1;
      end loop;
      
      if i > MAX_LENGTH then 
         return True;
      else 
        return False;
      end if;
      
        
   end egalite;
   
  function obtenir_matricule (v : in type_voiture)  return charArray is
   begin
      return v.num;
   end obtenir_matricule;
   
   function obtenir_num_place ( v : in type_voiture) return Integer is 
   begin
      return v.place;
   end obtenir_num_place;
   
 
   
   function calculer_duree_stationnement (v: in type_voiture;
                                         heureSortie_h : Integer;
                                         heureSortie_m : Integer) return Integer is   
      heureSortie   : Integer;
      duree         : Integer;
   begin
      heureSortie:=(heureSortie_h*3600)+(heureSortie_m*60);
      duree := heureSortie - v.heureEntree;
      if duree < 0 then 
         return -1;
      else
         return duree;
      end if;
      
     
   end calculer_duree_stationnement;
   

end voiture;
