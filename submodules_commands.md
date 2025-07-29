1. Добавить новый подмодуль в проект

```bash
git submodule add <URL> <project/path>
git commit -am "Added new module"
```

2. При клонировании проекта:

```bash
git clone <main-repo>
cd <main-repo>
git submodule update --init --recursive
```

3. Обновить подмодуль до последней версии в его репозитории:

```bash
cd <submodule/path>
git pull origin main
cd ../..
git add <submodule/path>
git commit -m "Updated my submodule"
```

4. Зафиксировать изменения внутри подмодуля и в основном проекте:

```bash
cd <submodule/path>

cd ../..
git add <submodule/path>
git commit -m "Updated my submodule in a new revision"
```

5. Удалить подмодуль

```bash
git submodule deinit -f <submodule/path>
git rm -f <submodule/path>
rm -rf .git/modules/<submodule/path>
```
