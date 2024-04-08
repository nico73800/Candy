# Candy
Candy est une app permettant la gestion de ses candidatures à différents emplois.

## Versions et fonctionnalités associées
### V0 : Mise en place du projet
- Apprentissage des bases du langages Swift et du fonctionnement de l'UI des OS Apple (en particulier IOS)
- Mise en place des premières vues (misent à jour par la suite)

### V0.1.0 : les données et leurs modèles
- Continuité de l'apprentissage du fonctionnement de l'UI des OS Apple (IOS en particulier)
- Mise en place du modèle de données appropriés

### V0.2.0 : Les vues et les données liées 
- Mise en place des vues : 
    - Home (avec du texte temporaire)
    - Candidatures 
    - Entreprises
- Connexion des vues avec les modèles de données 

### V0.3.0 : Début de l'agencement des vues et des liens entre elles 
- Ajout d'un item "TabView" permettant d'accéder aux différentes vues de l'application
- Modification de l'esthétique des vues

### V0.4.0 : Ajout de données dans la BDD
- Ajout de la vue permettant l'ajout de données dans la BDD
- Ajout de la fonction addEntrepriseToModel(...) permettant l'ajout des données d'entreprise à la BDD

### V0.4.1 : Correction des vues
- Correction de la vue EntAddItemView(...) : 
    * Correction de la partie .onSubmit du bloc Form, où "guard" mettait à jour un booléan pour savoir si oui ou on ajoute les données
    * Suppression du bloc "if" et du booléan
    * Ajout d'un retour à la page d'accueil quand les données ont bien été saisies (ajout d'un retour visuel à faire en cas d'échec / de réussite) 
    * Ajout d'une librairie tierce pour l'affichage d'un message si les données ont bien été saisies ou non

### V0.4.2 : Ajout des contrôles 
- Ajout du contrôle d'intégrité dans les données des entreprises liées aux candidatures :
    * Si une entreprise est supprimée et est liée à une candidature, la candidature sera supprimée également.

### V0.5.0 : Modification du modèle de données et des vues EntreprisesView et CandidaturesView (et sous vues associées)
- Dans les candidatures, remplacement dans le constructeur de la classe entreprise par l'ID de l'entreprise 
- Dans la vue CandidaturesView : 
    - Ajout d'une fonction permettant la récupération des données d'une entreprise par son ID 
    - Dans la sous vue "CanAddItemView" :
        - Ajout des fonctionnalités de saisie de la date et du responsable
        - Ajout d'un DatePicker pour récupérer la date
        - Ajout d'un Picker pour récupérer le nom et l'ID de l'entreprise 
        - Ajout d'une fonction addCandidatureToModel(...) pour ajouter les données dans la BDD
        - Ajout d'une fonction estPresent(...) pour tester la présence de l'ID de l'entreprise avec l'ID récupérer du Picker  

### V0.5.1 : corrections et bugs
- Suppression des commentaires inutiles 
- Apparition des bugs dans les interfaces : l'app crash à l'ouverture des candidature après une suppression d'une entreprise avec une candidature
- Suppresion des éléments inutiles dans les vues, notamment le MainView qui s'incrustait dans chacune des vues lorsque on le met dans la partie body > WindowsGroup du fichier CandyApp.swift 

### V0.5.2 : corrections des bugs de la version V0.5.1 et modifications annexes
- Ajout des règle de suppression en cascade permettant la suppression d'une fonction qui faisait planter l'app.
- Modification du modèle de données pour CandidaturesModel : changement du type "entreprise : uuid" -> "entreprise : Entreprises".

### V0.5.3 : bugs
- Suppression des commentaires inutiles 
- Bugs : ajout des données, raison : refuse la première valeur d'une liste 

### V0.5.4 : corrections des bugs de la version V0.5.3 et modifications annexes
- Suppression des commentaires inutiles 
- Modification de la fonction "estPresent" dans 'CanAddItemView.swift' qui retourne un type Entreprises au lieu d'un booléen, et modification de l'utilisation de la fonction dans le même fichier qui si la fonction ne renvoie rien alors un contenu vide est renvoyé.

### V1.0.0 : Ajout de la partie Statistiques
- Ajout de la vue StatsView : affichant les statistiques de candidatures (uniquement le nombre de candidatures à l'heure actuelle), sous la forme d'un graphique en barre.

### V1.0.1 : Corrections des bugs dans la vue StatsView
- Correction du bug qui faisait que l'application cumulait le nombre de candidatures pour chaque mois

### V1.1.0 : Modification de l'esthétique de l'UI
- Modification des espacements dans les GroupBox des vues CandidaturesView et EntreprisesView
- Remplacement de la fonction dépréciée "cornerRadius" par la fonction "clipShape"

### V1.1.1 : Bugs dans l'ajout des données dans les sous vues Can/EntAddItemView 
- La page d'ajout ne se ferme pas automatiquement + les données si l'on souhaite en ajouté une autre modifie la données venant d'être ajoutée 

## Fonctionnalités futures ou envisagées
### Fonctionnalités futures 
- Ajout de la partie entretiens de l'application 
- Ajout des différents retours visuels en cas d'échec ou de réussite d'une action

### Fonctionnalités envisagées 
- Ajout d'une page "Statistiques" permettant l'affichage des stats sur les entretiens, les candidatures, etc.
- Ajout d'un calendrier sur la page d'accueil listant les prochains entretiens où les tâches à faire.


## Informations sur les versions 
- Les versions principales VX (X pour le numéro de version), contiendront les avancées "majeures" de l'application (changement conséquent dans l'UI, ajout de fonctionnalités importantes (nouvelles vues, nouveaux fonctionnements, etc.))
- Les versions secondaires VX.Y (Y pour le numéro de la sous-version), contiendront les mises à jour non majeures de l'application (ajout de fonctionnalités secondaires (ajout de fonctions dans les UI (boutons, textfiels, etc.)))
- Les versions tertiaires VX.Y.Z (Z pour le numéro de la versions sous-sous-version), contiendront toutes les corrections de bugs, et changements n'ajoutant pas de fonctionnalités dans l'application
