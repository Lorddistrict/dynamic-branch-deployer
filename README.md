### Création d'un groupe dédié à la CI car root avait trop de permissions :

```# useradd -m github_actions```

Mais lors de l'exécution du script, github_actions n'avait les permissions pour créer de fichiers de configuration ou pour créer un lien symbolique.
Il a donc fallu changer leur groupe avec le même nom que l'utilisateur précédemment créé :

```# chown -R root:github_actions /etc/nginx/sites-available```
```# chown -R root:github_actions /etc/nginx/sites-enabled```

L'utilisateur a généré une clé SSH.

```$ ssh-keygen -t ed25519 -a 100 -o```

La clé privée ira sur Github dans un SECRET et la clé publique ira dans authorized_keys.
Les sous-domaine ayant une longueur anormalement longue à cause du slug de branche, il est nécessaire d'ajuster un paramètre dans : /etc/nginx/nginx.conf.

Par défaut, la ligne est commentée.

```
http {
  server_names_hash_bucket_size 256;
}
```
