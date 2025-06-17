# Bachelor Wirtschaftsinformatik - Thesis
Dieses Repository beinhaltet alle Daten hinsichtlich meiner Bachelorarbeit.

## Usage
### Projekt kompilieren
Projekt inkl. Glossar und Bibliography kompilieren. 
```
make build
```

### PDF Datei neu erzeugen kompilieren
Kompiliert das Projekt ohne Glossar und Bibliography
```
make quick
```

### Veröffentlichbare Version erstellen
Release Version des Projektes erstellen inkl. vorhergehender Bereinigung der Laufzeitdateien. Ein Symlink `$(TEX).pdf` auf die zuletzt erstellte Build Version wird erzeugt.
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

## Einträge in der Bibliographie (.bib)
### Allgemein
  - Informationen zum Individuum
    - `author`: Liste aus Autoren. Jeder Autor ist in `{}` eingefasst und durch ein `,` getrennt. Alternativ die Organisation, wenn es keine natürliche Person gibt.
  - Informationen zur Organisation
    - `institution`: Einrichtungen wie beispielsweise Universitäten.
    - `organization`: Unternehmen, Behörden, etc.
    - `publisher`: Institution _oder_ die Organisation, welche das Werk veröffentlicht hat.
  - Informationen zu dem Dokument
    - `title`: Titel des Werkes.
    - `date`: Veröffentlichungsdatum im Format `yyyy`.
    - `volume`: Band- oder Ausgabennummer.
    - `edition`: (Versions)Nummer des Buches.
    - `isbn`: ISBN Nummer des Werkes
    - `file`: Lokaler Pfad unter welchem die Datei zu finden ist.
    - `url`: URL, über welche das Dokument im Internet abrufbar ist.
    - `urldate`: Datum, an welchem das Dokument abgerufen wurde, im Format `yyyy-mm-dd`.
    - `doi`: DOI des Dokumentes

### Buch (`book`)
Für alle Buchquellen wird als Typ für den Eintrag `book` verwenden. In dem Kontext ist alles was eine _ISBN Nummer_ hat ein Buch. 
#### Vorlage
```
@book { ISBN
    %:: Informationen zum Individuum
    author = {{}},
    
    %:: Informationen zur Organisation
    % institution = {},
    % organization = {},
    % publisher = {{}},

    %:: Informationen zu dem Dokument
    title = {},
    date = {},
    % volume = {},
    % edition = {},
    isbn = {},
    file = {},
}
```

### Artikel (`article`)
Sämtliche Artikeln, ob Online oder in einer Fachzeitschrift veröffentlicht.
#### Vorlage
```
@article { KEY
    %:: Informationen zum Individuum
    author = {{}},
    
    %:: Informationen zur Organisation
    % institution = {},
    % organization = {},
    % publisher = {{}},

    %:: Informationen zu dem Dokument
    title = {},
    date = {},
    url = {},
    urldate  = {},
    file = {}
}
```
### Handbücher / technische Dokumentationen, o.ä. (`manual`)
Alle Anleitungen (On- oder Offline), wie bspw. [Microsoft](learn.microsoft.com) oder dergleichen.
#### Vorlage
```
@manual { KEY,
    %:: Informationen zum Individuum
    author = {{}},
    
    %:: Informationen zur Organisation
    % institution = {},
    % organization = {},
    % publisher = {{}},

    %:: Informationen zu dem Dokument
    title = {},
    date = {},
    url = {},
    urldate  = {},
    file = {}
}
```

### Onlinequellen (`online`)

#### Vorlage
```
@online { KEY,
    %:: Informationen zum Individuum
    author = {{}},
    
    %:: Informationen zur Organisation
    % institution = {},
    % organization = {},
    % publisher = {{}},

    %:: Informationen zu dem Dokument
    title = {},
    date = {},
    url = {},
    urldate  = {},
    file = {}
}
```

### Gesetzestexte / Spezifikationen, o.ä. (`misc`)

#### Vorlage
```
@misc { KEY,
    %:: Informationen zum Individuum
    author = { {} },
    
    %:: Informationen zur Organisation
    % institution = { {} },
    % organization = { {} },
    % publisher = { {} },

    %:: Informationen zu dem Dokument
    title = {},
    date = {},
    url = {},
    urldate  = {},
    file = {}
}
```

## Offene Aufgaben ⚒
  - ⛶ GitHub Pipeline erstellen
  - biber Definitionen in einer eigenen Datei

## Umgebungen
### Tabellen
  - `\caption[<list entry>]{<heading>}`: `list entry` ist der Text für das Tabellenverzeichnis und `<heading>` die eigentliche Überschrift 
```latex
\begin{table}[ht!]
  \caption[Kurzer Titel]{Langer Titel\footnotemark}
  \label{tbl:label}
  \resizebox{\textwidth}{!}{
    \begin{tabular}{llll}
      \hline
      Header 1 & Header 2 & Header 3 & Header 4 \\
      Zeile  1 & Zeile  1 & Zeile  1 & Zeile  1 \\  
      \hline 
      \end{tabular}
    }
\end{table}\footnotetext{Fußnote^}
```

### Mathematische Umgebungen
#### Innerhalb der Zeile (inline)
```latex
Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed \(<Math goes here>\) diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. 
```

#### Abgesetzt (display)
```latex
Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. 
\[ 
  <Math goes here>
\]
Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. 
```


### Notizen
```
\DeclareLabeldate{\field{date}\field{eventdate} \field{origdate}\literal{nodate}} % <-- def für was als Datum genutzt werden soll
\DefineBibliographyStrings{german}{
    nodate = {o.J.}
} % <-- def für date Feld fehlt
```