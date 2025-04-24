# Bachelor Wirtschaftsinformatik - Thesis
Dieses Repository beinhaltet alle Daten hinsichtlich meiner Bachelorarbeit

## Usage
### Projekt kompilieren
Projekt inkl. Glossar und Bibliography kompilieren. 
```
make build
```

### Veröffentlichbare Version erstellen
Release Version des Projektes erstellen inkl. vorhergehender Bereinigung der Laufzeitdateien.
```
make release
```

### Verzeichnis bereinigen
Entfernen aller Laufzeitdateien, welche während des Kompilieren erstellt werden.
```
make clean
```

### Verzeichnis vollständig bereinigen
Entfernen aller Laufzeitdateien inkl. der Bereits kompilierten Versionen.
```
make cleanall
```

### Verzeichnis zurücksetzen
Bereinigt das Verzeichnis vollständig und entfernt zusätzlich den Build- und Release Zähler.
```
make reset
```

## Commit Nachricht (Vorlage)
Jede Commit Nachricht muss einen Präfix als Typ aufweisen, gefolgt von einer prägnanten Überschrift. Im Körper der Nachricht muss dann die Inhaltliche Änderung weiter ausgeführt werden.
```
[type]: [header]

[body]
```
### Mögliche Typen
 - ```chore```: Anpassungen an Abhängigkeiten, Build-System o.ä. 
 - ```docs```: Inhaltliche Änderungen an der Arbeit.
 - ```style```: Änderung am Erscheinungsbild der Arbeit.
 - ```misc```: Alle Anpassungen die zu keine der oben genannten Typen passen.

## Offene Aufgaben ⚒
  - ⛶ GitHub Pipeline erstellen