release tag:
    git tag {{tag}}
    git push --atomic origin main refs/tags/{{tag}}
