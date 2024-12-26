# Git Helper Script

Este proyecto contiene un script de **bash** que facilita el uso de **git** en proyectos de programación.

---

## Requisitos previos

1. Tener **bash** instalado.
2. Tener **git** instalado.
3. Un repositorio de **git**.

---

## Instalación

1. Clona este repositorio:

   ```bash
   git clone https://github.com/israoo/git-helper-bash.git
   cd git-helper-bash
   ```

2. Haz que el script sea ejecutable:

   ```bash
   chmod +x git-helper.sh
   ```

3. (Opcional) Añade el script a tu PATH para usarlo globalmente:

   ```bash
   mv git-helper.sh /usr/local/bin/git-helper
   ```

---

## Uso

Ejecuta el script dentro de un repositorio git:

```bash
./git-helper.sh
```

---

## Resultado

Una vez ejecutado el script, se mostrará un menú con las siguientes opciones:

```plaintext
1) Perform git pull
2) Create a new branch
3) Switch to an existing branch
4) Add files and commit
5) Show repository status (git status)
6) Push to the current branch
7) Show commit history (git log)
8) Exit
```

---

## Tecnologías utilizadas

- **bash**: Lenguaje de programación de scripts en sistemas Unix.
- **git**: Sistema de control de versiones distribuido.
