# Candy
Candy est une app permettant la gestion de ses candidatures à différents emplois.

## Versions et fonctionnalités associées
### V0 : Mise en place du projet
- Apprentissage des bases du langages Swift et du fonctionnement de l'UI des OS Apple (en particulier IOS)
- Mise en place des premières vues (mise à jour par la suite)

### V0.1 : les données et leurs modèles
- Continuité de l'apprentissage du fonctionnement de l'UI des OS Apple (IOS en particulier)
- Mise en place du modèle de données appropriés

### V0.2 : Les vues et les données liées 
- Mise en place des vues : 
    - Home (avec du texte temporaire)
    - Candidatures 
    - Entreprises
- Connexion des vues avec les modèles de données 

### V0.3 : Début de l'agencement des vues et des liens entre elles 
- Ajout d'un item "TaView" permettant d'accéder aux différentes vues de l'application
- Modification de l'esthétique des vues

### V0.4 : Ajout de données dans la BDD
- Ajout de la vue permettant l'ajout de données dans la BDD
- Ajout de la fonction addEntrepriseToModel(...) permettant l'ajout des données d'entreprise à la BDD

### V0.4.1 : Correction de bugs
- Correction de la vue : 
    * Correction de la partie .onSubmit du bloc Form, où "guard" mettait à jour un booléan pour savoir si oui ou on ajoute les données
    * Suppression du bloc "if" et du booléan
    * Ajout d'un retour à la page d'accueil quand les données ont bien été saisies (ajout d'un retour visuel à faire en cas d'échec / de réussite) 


## Fonctionnalités futures ou envisagées
### Fonctionnalités futures 
- Ajout de la partie entretiens de l'application 
- Ajout des différents retours visuels en cas d'échec ou de réussite d'une action

### Fonctionnalités envisagées 
- Ajout d'une page "Statistiques" permettant l'affichage des stats sur les entretiens, les candidatures, etc.
- Ajout d'un calendrier sur la page d'accueil listant les prochains entretiens où les tâches à faire.
