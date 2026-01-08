# 🌊 WAVES - Plateforme de Gestion Collaborative

## 📋 À quoi sert ce projet ?

**WAVES** est une plateforme web complète permettant de **gérer des projets, formations, cours, événements et interactions utilisateurs** dans un environnement collaboratif.

### Utilité principale
C'est un système de gestion intégré (type LMS - Learning Management System) qui permet aux organisations de :
- 📚 **Offrir des cours et formations** en ligne
- 🎓 **Gérer les inscriptions** des utilisateurs
- 📅 **Organiser des événements** et réserver des places
- 🛒 **Vendre des produits/services** via un système de commandes
- 💬 **Faciliter les interactions** entre utilisateurs (commentaires)
- 👥 **Gérer les utilisateurs** avec authentification sécurisée

---

## 🎯 Cas d'usage réels

### Scénario 1 : Centre de Formation
Une organisation offre des formations en ligne :
1. Les étudiants s'inscrivent sur la plateforme
2. Consultent les cours disponibles
3. S'inscrivent aux formations
4. Suivent les événements en direct
5. Téléchargent les certificats

### Scénario 2 : E-learning
Une école utilise WAVES pour :
- Publier des cours structurés
- Gérer les réservations pour les séminaires
- Permettre aux étudiants de commenter les cours
- Vendre des ressources pédagogiques

### Scénario 3 : Plateforme Événementielle
Une entreprise organise des événements :
- Crée des événements
- Les utilisateurs réservent des places
- Reçoivent des confirmations par email
- Accèdent à l'historique de leurs réservations

### Scénario 4 : Système de Boutique
Un commerce en ligne utilise WAVES pour :
- Gérer les articles (ITEM)
- Les clients passent des commandes
- Suivi de la commande
- Factures et historique

---

## 🏗️ Architecture générale

```
┌─────────────────────────────────────────────────┐
│         APPLICATION WEB (Symfony)               │
│  - Interface utilisateur                        │
│  - Gestion des authentifications                │
│  - Affichage des courses/formations/événements │
└──────────────────┬──────────────────────────────┘
                   │
┌──────────────────▼──────────────────────────────┐
│      BASE DE DONNÉES PARTAGÉE (MySQL)           │
│  - 13 tables relationnelles                     │
│  - Données utilisateurs, cours, événements...  │
└──────────────────┬──────────────────────────────┘
                   │
      ┌────────────┴────────────┐
      │                         │
  ┌───▼────────┐        ┌──────▼────────┐
  │ Application│        │ Service Email │
  │  JavaFX    │        │   (Gmail)     │
  │ (Desktop)  │        │               │
  └────────────┘        └────────────────┘
```

---

## 📊 Fonctionnalités principales

### 1️⃣ **Gestion des utilisateurs**
- Inscription / Connexion sécurisée
- Authentification Facebook intégrée
- Profils utilisateurs (nom, email, téléphone, image)
- Système de rôles (Admin, Enseignant, Utilisateur)
- Vérification d'email

### 2️⃣ **Gestion des cours**
- Créer et publier des cours
- Description détaillée, durée
- Consultation publique
- Inscription des étudiants

### 3️⃣ **Formations**
- Programmes structurés de formation
- Niveaux (Débutant, Intermédiaire, Avancé)
- Suivi de progression

### 4️⃣ **Événements**
- Créer des événements avec date/heure/lieu
- **Système de réservation**
- Confirmation par email
- Historique des réservations

### 5️⃣ **Système de commandes**
- Articles disponibles à la vente
- Panier de course
- Calcul du total
- Historique des commandes
- Suivi de statut

### 6️⃣ **Interactions**
- Commentaires sur les cours/contenus
- Discussion collaborative
- Notation

### 7️⃣ **Projets et productions**
- Création de projets
- Gestion des productions/ressources
- Postes disponibles

### 8️⃣ **Notifications**
- Email de confirmation d'inscription
- Alerte de réservation
- Rappels d'événements

---

## 💾 Structure de la base de données

| Table | Utilité |
|-------|---------|
| **user** | Stockage des utilisateurs, authentification |
| **cours** | Catalogue des cours disponibles |
| **formation** | Programmes de formation structurés |
| **event** | Événements à réserver |
| **reservation** | Réservations des utilisateurs aux événements |
| **commande** | Commandes passées par les clients |
| **item** | Articles/produits à vendre |
| **commentaire** | Commentaires des utilisateurs |
| **projet** | Projets gérés |
| **production** | Productions/résultats |
| **poste** | Postes/rôles disponibles |
| **reset_password_request** | Gestion des réinitialisations de mot de passe |
| **messenger_messages** | Queue de messages (notifications asynchrones) |

---

## 🚀 Types d'utilisateurs

### 👨‍💼 **Administrateur**
- Gère tout (utilisateurs, cours, événements, commandes)
- Accès complet à l'application

### 👨‍🏫 **Enseignant/Formateur**
- Crée et gère ses cours
- Consulte ses étudiants
- Répond aux commentaires

### 👨‍🎓 **Étudiant/Client**
- S'inscrit aux cours
- Réserve des événements
- Passe des commandes
- Interagit via commentaires

### 🧑‍💻 **Invité**
- Consultation publique seulement
- Accès à la page d'inscription

---

## 🔧 Stack technologique

```
Frontend:           Backend:           Base de données:
├─ HTML/CSS         ├─ PHP 8+           └─ MySQL 8.0
├─ Bootstrap        ├─ Symfony 6
├─ JavaScript       ├─ Doctrine ORM     Intégrations:
└─ Twig             ├─ Security Bundle  ├─ Gmail (SMTP)
                    └─ Form Component   ├─ Facebook OAuth
                                        └─ XAMPP
```

---

## 📦 Installation et démarrage

### Prérequis
- PHP 8+
- MySQL 8.0
- Composer
- XAMPP

### Installation
```bash
# 1. Cloner le projet
git clone https://github.com/yourrepo/Waves.git
cd Waves-main

# 2. Installer les dépendances
composer install

# 3. Configurer la base de données dans .env
DATABASE_URL="mysql://root:@127.0.0.1:3306/waves_db?serverVersion=8.0"

# 4. Créer la base de données
php bin/console doctrine:database:create
php bin/console doctrine:schema:create

# 5. Démarrer le serveur
symfony server:start
# ou
php -S localhost:8000 -t public/
```

### Accès
- URL : http://localhost:8000
- phpMyAdmin : http://localhost/phpmyadmin

---

## 👥 Utilisateurs

| Rôle | Email | Mot de passe |
|------|-------|-------------|
| Admin | admin@waves.com | AdminPass123 |
| Enseignant | teacher@waves.com | Teacher123 |
| Utilisateur | user@waves.com | Password123 |

*Créer manuellement dans phpMyAdmin ou via formulaire d'inscription*

---

## 🔒 Sécurité

- ✅ Mots de passe hachés en bcrypt
- ✅ Protection CSRF intégrée
- ✅ Sessions sécurisées
- ✅ Validation serveur des données
- ✅ Requêtes préparées (Doctrine ORM)
- ✅ Authentification multi-moyens (Email + Facebook)

---

## 📚 Documentation complète

Voir le fichier `RAPPORT_WAVES.md` pour :
- Architecture détaillée
- Tous les cas d'usage
- Diagrammes ER
- User stories complètes
- Flux de processus

---

## 👨‍💻 Auteurs

- **Ala Moussa** - [Raydux](https://github.com/rayduxx)
- **Hamza Ben Jemia**
- **Aziz Salmi**
- **Ahmed Dhouioui**
- **Iyed Ben Farhat**

---

## 📄 Licence

Projet sous licence MIT - voir [LICENSE.md](LICENSE.md)

---

## ⚠️ Notes importantes

- Cette plateforme est **complète et fonctionnelle**
- Idéale pour **formations en ligne**, **événementiel**, **e-commerce**
- Base de données **bien structurée** avec 13 tables
- **Authentification sécurisée** intégrée
- **Système de rôles** pour différents types d'utilisateurs

---

*Application WAVES v1.0 - Plateforme collaborative de gestion*
