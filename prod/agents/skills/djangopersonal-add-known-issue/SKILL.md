---
name: djangopersonal-add-known-issue
description: Zapisuje znany problem jako zadanie w statusie "Znane problemy" w projekcie "DjangoPersonal" przez serwer MCP djangopersonal. Użyj, gdy użytkownik prosi o "dodanie znanego problemu", "zapisz to jako znany problem", "dodaj do znanych problemów w DjangoPersonal" itp.
---

# Dodawanie znanego problemu do DjangoPersonal

Zadania leżą w aplikacji DjangoPersonal (projekt **DjangoPersonal**), dostępnej przez serwer MCP `djangopersonal`
(w Claude Code narzędzia `mcp__djangopersonal__*`, w opencode `djangopersonal_*`). Znany problem to zadanie
w statusie **`Znane problemy`**: zapis usterki lub ryzyka do naprawienia później, a nie jego naprawa.

## 1. Znajdź projekt i status

1. `list_projects` → projekt o nazwie `DjangoPersonal` (bez względu na wielkość liter). Jego `project_statuses` musi zawierać `Znane problemy` (bez względu na wielkość liter; do `create_task` przekaż pisownię z projektu).
2. Gdy brakuje projektu albo statusu, albo MCP wymaga logowania, zatrzymaj się i powiedz o tym użytkownikowi (logowanie: `/mcp`).

## 2. Sprawdź duplikaty

`list_tasks` z `project_id` projektu → przejrzyj zadania w `Znane problemy` (i w `Todo`). Jeśli któreś opisuje ten sam problem, pokaż je użytkownikowi i zapytaj: uzupełnić istniejące (`update_task`) czy dodać nowe.

## 3. Napisz zadanie

Treść pisz po polsku, a nazwy plików, komend i identyfikatorów zostaw w oryginale.

- **Tytuł**: jedno zdanie opisujące objaw, np. „Deploy nie restartuje observability po zmianie konfiguracji”.
- **Opis**, tak żeby osoba (albo agent) bez kontekstu tej rozmowy mogła podjąć problem:
  - co jest nie tak i kiedy to występuje;
  - gdzie: konkretne ścieżki plików, serwisy, komendy;
  - skutek, czyli co się psuje albo czym to grozi;
  - możliwe rozwiązania, jeśli są znane (jako propozycje, nie decyzje).

Fakty o kodzie sprawdź w repozytorium `~/Projects/DjangoPersonal`, zanim je zapiszesz.

## 4. Utwórz i zgłoś

`create_task` z `project_id`, `status` = `Znane problemy`, `title`, `description`. Napisz użytkownikowi numer zadania (`id`) i jego tytuł.
