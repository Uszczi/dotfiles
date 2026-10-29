---
name: djangopersonal-tasks
description: Pobiera zadania w statusie "Gotowe dla agenta" z projektu "DjangoPersonal" przez serwer MCP djangopersonal i wykonuje je w repozytorium DjangoPersonal na nowym branchu, jeden commit na zadanie. Użyj, gdy użytkownik prosi o "zrobienie zadań z DjangoPersonal", "pobierz zadania z MCP", "wykonaj taski z projektu" itp.
---

# Wykonywanie zadań z projektu DjangoPersonal

Zadania leżą w aplikacji DjangoPersonal (projekt o nazwie **DjangoPersonal**), dostępnej przez serwer MCP `djangopersonal`
(w Claude Code narzędzia `mcp__djangopersonal__*`, w opencode `djangopersonal_*`). Kod do zmiany to repozytorium
`~/Projects/DjangoPersonal` (jeśli nie jesteś w nim, przejdź tam).

## 1. Pobierz zadania

1. `list_projects` → znajdź projekt o nazwie `DjangoPersonal` (bez względu na wielkość liter). Jeśli go nie ma albo MCP nie odpowiada / wymaga logowania — zatrzymaj się i powiedz o tym użytkownikowi.
2. `get_project` → poznaj listę statusów i status końcowy („done”). Sprawdź, że istnieje status **`Gotowe dla agenta`** (bez względu na wielkość liter); jeśli go nie ma — zatrzymaj się i powiedz o tym użytkownikowi.
3. `list_tasks` dla tego projektu → weź **wyłącznie** zadania w statusie `Gotowe dla agenta`. Zadań w innych statusach (`Todo`, status końcowy itd.) nie ruszaj i nie pytaj o nie. Jeśli żadne zadanie nie ma tego statusu — powiedz to użytkownikowi i zakończ.
4. Przeczytaj tytuł i opis każdego zadania. Przeczytaj też `AGENTS.md` / `CLAUDE.md` repozytorium.

## 2. Oceń zadania, zanim cokolwiek zmienisz

Dla każdego zadania zdecyduj:

- **Niejasne** (nie wiadomo, co ma powstać, brak kryteriów, kilka sensownych interpretacji) → **zapytaj użytkownika**, co zrobić. Nie zgaduj.
- **Duże** (wiele modułów/warstw naraz, migracje + API + frontend + mobile, nowa funkcja do zaprojektowania, wyraźnie więcej niż jeden sensowny commit) → **zapytaj użytkownika**, co z nim zrobić: np. podzielić na mniejsze zadania, zrobić tylko część, pominąć, czy robić w całości.
- **Jasne i małe** → do wykonania.

Zbierz wszystkie pytania i zadaj je **razem, na początku** (w Claude Code przez `AskUserQuestion`, w opencode zwykłym pytaniem), żeby nie przerywać pracy co chwilę. Jeśli pytanie pojawi się dopiero w trakcie pracy nad zadaniem — zapytaj wtedy.

Pokaż użytkownikowi krótką listę: kolejność wykonania, co pomijasz/na co czekasz.

## 3. Branch

- Sprawdź `git status` — jeśli są niezacommitowane zmiany, zapytaj użytkownika, co z nimi zrobić (nie usuwaj ich).
- Utwórz nowy branch od aktualnego `master`: `git switch -c tasks/<RRRR-MM-DD>` (jeśli istnieje, dodaj sufiks `-2`, `-3`…).

## 4. Wykonuj zadania — jeden commit na zadanie

Kolejność wybierasz sam (np. najpierw zależności, potem rzeczy na nich oparte, drobnice razem na początku). Dla każdego zadania:

1. Zaimplementuj zmianę zgodnie z konwencjami repozytorium (AGENTS.md): handlery w `core`, ORM w `infra/repo`, cienkie routery; nie edytuj ręcznie plików generowanych (`just generate-api`); migracje przez `just makemigrations`; dodaj/zmień testy.
2. Uruchom odpowiednie testy / `just check` (przynajmniej części dotkniętej zmianą). Nie commituj czerwonego stanu — jeśli nie da się naprawić, zapytaj użytkownika.
3. Zrób **dokładnie jeden commit** na zadanie, w stylu historii repo (Conventional Commits, np. `feat(timer): ...`, `fix: ...`), w treści tytuł zadania. Dodawaj tylko pliki tego zadania (`git add <ścieżki>`, nie `git add -A` na ślepo).
4. Po commicie przestaw zadanie w MCP na status końcowy projektu (`update_task`). Jeśli nie masz pewności, czy użytkownik tego chce — zapytaj raz na początku.

## 5. Zakończenie

- Nie pushuj i nie merguj bez wyraźnej prośby.
- Podsumuj: nazwa brancha, lista commitów ↔ zadań, zadania pominięte/czekające na decyzję i dlaczego, wynik testów.
