#!/bin/bash

# List of nested repository paths
nested_repos=(
    "Basic-Go-Structure/GoBaseStructure"
    "Basic-Go-Structure/LetsGo"
    "Basic-Go-Structure/hms-backend"
    "Bout-Go"
    "ChatConnect"
    "Expatriation"
    "HMS-New/HMS-Docs-data"
    "HMS-New/hms-sa-backend"
    "HMS-New/simple-hms-backend"
    "HMS/go-test-template"
    # Add more paths as needed
)

for repo in "${nested_repos[@]}"; do
    if [ -d "$repo/.git" ]; then
        echo "Removing .git from $repo..."
        rm -rf "$repo/.git"
    else
        echo "$repo is not a Git repository or doesn't exist."
    fi
done

echo "Flattening complete. Please run 'git add .' and commit the changes."
