#!/bin/bash

show_menu() {
  echo "==================================="
  echo "          Git Helper Script        "
  echo "==================================="
  echo "1) Perform git pull"
  echo "2) Create a new branch"
  echo "3) Switch to an existing branch"
  echo "4) Add files and commit"
  echo "5) Show repository status (git status)"
  echo "6) Push to the current branch"
  echo "7) Show commit history (git log)"
  echo "8) Exit"
  echo "==================================="
}

git_pull() {
  echo "Performing git pull..."
  git pull
}

create_branch() {
  read -p "Enter the name of the new branch: " branch_name
  if git branch --list | grep -q "$branch_name"; then # Lista las ramas con ‘git branch –list’ y verifica con ‘grep -q’ si la rama existe en la salida
    echo "Error: The branch '$branch_name' already exists."
    return
  fi

  echo "Creating and switching to branch $branch_name..."
  git checkout -b "$branch_name"
}

switch_branch() {
  branches=$(git branch)
  if [ -z "$branches" ]; then # Verifica con ‘-z’ si la variable ‘branches’ está vacía
    echo "No branches available in this repository."
    return
  fi

  echo "Available branches:"
  echo "$branches"

  read -p "Enter the name of the branch you want to switch to: " branch_name
  if ! git branch --list | grep -q "$branch_name"; then
    echo "Error: The branch '$branch_name' does not exist."
    return
  fi

  echo "Switching to branch $branch_name..."
  git checkout "$branch_name"
}

git_commit() {
  while true; do
    git status

    read -p "Which files do you want to add? (use . for all or 'exit' to cancel): " files
    if [[ "$files" == "exit" ]]; then
      echo "Operation canceled."
      return # Termina la ejecución del bucle ‘while’
    fi

    git add "$files"

    read -p "Enter the commit message: " commit_message
    git commit -m "$commit_message"
    echo "Commit completed."
    break
  done
}

git_status() {
  echo "Showing repository status..."
  git status
}

git_push() {
  echo "Pushing to branch $branch..."
  git push origin "$branch"
}

git_log() {
  echo "Recent commit history:"
  git log --oneline --graph --decorate -10
}

check_git_repo() {
  if [ ! -d .git ]; then # Verifica con '! -d' si el directorio ‘.git’ no existe en el directorio actual
    echo "Error: This does not appear to be a Git repository."
    exit 1
  fi
}

main() {
  check_git_repo

  while true; do
    show_menu
    read -p "Select an option: " choice # Lee la opción ingresada por el usuario y la almacena en la variable ‘choice’
    case $choice in
      1) git_pull ;;
      2) create_branch ;;
      3) switch_branch ;;
      4) git_commit ;;
      5) git_status ;;
      6) git_push ;;
      7) git_log ;;
      8) echo "Exiting..."; exit 0 ;; # Con ‘exit 0’ se finaliza el script con un código de salida 0 que indica que no hubo errores
      *)
        echo "Invalid option. Please try again."
        continue # Regresa al inicio del bucle ‘while’
        ;;
    esac
    break # Termina el bucle ‘while’
  done
}

main # Llama a la función ‘main’ para iniciar el script
