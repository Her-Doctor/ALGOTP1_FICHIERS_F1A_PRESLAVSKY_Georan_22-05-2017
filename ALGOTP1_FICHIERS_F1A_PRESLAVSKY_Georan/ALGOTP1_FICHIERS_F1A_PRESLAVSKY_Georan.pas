program Conjug_Verbes;

uses crt;
// ATTENTION ! : ne fonctionne pas , il me fait une sorte de boucle infinie , pour aucune raion ....

// dans les dossiers pour délimiter les verbes , ils seront tous à l'infinitif.
// dans les dossiers pour les conjugaisons , ils seront notés comme si dessous:
{
	être
	je suis
	tu est
	il est
	nous sommes
	vous êtes
	ils sont
}
// la procedure ecrira toutes les conjugaisons du verbe 

// variables principales
Var
	VerbeD:String;
	f1,f2,f3: TextFile;
	ResRech:boolean;

function Recherche (var f : TextFile):Boolean; // va rechercher le verbe dans les fichiers
	var
	s:String;
		begin
			Recherche:=False;
			While Not Eof do // Eof signifie end of file
				begin 
				read(f,s);
					if (lowercase(VerbeD) = lowercase(s)) then
						begin
							Recherche :=true;
						end; 
				end;
		end;

procedure Conjug(var f :TextFile); //va rechercher la conjugaison des verbes
	var
	s:String;
	cpt:Integer;
		begin
			cpt:=0;
			While Not Eof do // Eof signifie end of file
				begin 
				read(f,s);
					if (lowercase(VerbeD) = lowercase(s)) then
						begin
							For cpt:=1 to 6 do
								begin
									writeln(s);
								end; // permet d'écrire les conjugaisons du verbe demandé
						end;
				end;
		end;

//Programme principal
BEGIN
	clrscr;
	writeln('Programme de conjugaison');
	writeln('entrez votre verbe');
	readln(VerbeD);

	//init; // procedure
// recherche du groupe du verbe , si il est groupe 1 alors (instructions) sinon si groupe 2 alors etc...
Assign(f1,'C:\FPC\3.0.0\bin\i386-win32\ALGOTP1_FICHIERS_F1A_PRESLAVSKY_Georan\ConjugGrp1.txt');
	Reset(f1);
ResRech := Recherche(f1);
	if ResRech = true then 
		begin
			writeln('Le verbe ',VerbeD,' est du 1 er groupe');
			Conjug(f1);
		end
	else
		close(f1);
		Assign(f2,'C:\FPC\3.0.0\bin\i386-win32\ALGOTP1_FICHIERS_F1A_PRESLAVSKY_Georan\ConjugGrp2.txt');
			Reset(f2);
		ResRech := Recherche(f2);
			if ResRech = true then 
				begin
					writeln('Le verbe ',VerbeD,' est du 2e groupe');
					Conjug(f2);
				end
	else
		close(f2);
		Assign(f3,'C:\FPC\3.0.0\bin\i386-win32\ALGOTP1_FICHIERS_F1A_PRESLAVSKY_Georan\ConjugGrp3.txt');
			Reset(f3);
		ResRech := Recherche(f3);
			if ResRech = true then 
				begin
					
					writeln('Le verbe ',VerbeD,' est du 3e groupe');
					Conjug(f3);
				end
	else
		begin
			close(f3);
			writeln('Ce mot n''est pas dans la liste.');
		end;
	
	
	
	readln;


END.

