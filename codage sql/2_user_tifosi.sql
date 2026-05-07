-- 1/ Création de l'utilisateur avec mot de passe)  
CREATE USER IF NOT EXISTS 'tifosi'@'localhost'
  IDENTIFIED BY 'Password*000';

-- 2/ Attribution des droits sur la base "tifosi"
GRANT ALL PRIVILEGES ON tifosi.* TO 'tifosi'@'localhost';