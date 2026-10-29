# PoHeSie — Landingpage

Eigenständiges Hugo-Projekt ohne externes Theme, JavaScript, npm-Abhängigkeiten, Tracking oder externe Fonts. Die Texte und der Auftritt beziehen sich auf den geplanten Start im Sommer 2027. Es wurde nichts veröffentlicht.

## Lokal unter Linux starten

Hugo-Version: siehe `.hugo-version` (Standardedition). Die Linux-Binary liegt in `.tools/linux/hugo`; die alte `hugo.exe` wird nicht verwendet. Der Installer unterstützt x86_64 und ARM64 und prüft die offizielle SHA-256-Prüfsumme. Es ist keine systemweite Installation nötig.

```sh
cd /home/rhe/codex/pohesie/website
./scripts/install-hugo.sh  # einmalig bei einer frischen Kopie
./scripts/dev.sh
```

Vorschau: http://localhost:1313/ . Beenden mit Strg+C. Das Startskript funktioniert auch von einem anderen Arbeitsverzeichnis aus und verwendet den lokalen Cache `.cache/`.

Produktionsbuild:

```sh
.tools/linux/hugo --minify --baseURL https://DEINE-DOMAIN/ --cacheDir "$PWD/.cache"
```

Die fertige Website liegt in `public/`. Nur dieser Ordner wird veröffentlicht, keine Businessplan-Dateien.

## Bearbeiten

- `hugo.toml`: Saison, Status, Beschreibung und Kontaktadresse (`params.email`). Solange die Adresse leer ist, erscheint kein Kontaktlink.
- `layouts/home.html`: Texte, Abschnitte und FAQ.
- `assets/css/main.css`: responsives Design, Farben und Schriften.
- `assets/images/banh-mi.png`: generiertes Konzeptmotiv. Hugo erstellt automatisch kleinere WebP-Dateien; vor dem echten Marktstart idealerweise durch ein Foto des tatsächlichen Angebots ersetzen.
- `static/favicon.svg`: kleines Markenicon.
- `static/images/poheSie-logo.svg`: gemeinsame Wortmarke für Website und Preisliste, mit Schriftkonturen statt Betriebssystem-Fontabhängigkeit.
- `scripts/`: Linux-Installation und lokaler Start.

Der GitHub-Pages-Workflow verwendet bereits Linux; dafür ist keine Plattformumstellung nötig.

Die geplanten Termine sind ausdrücklich noch nicht bestätigt. Keine erfundenen Preise, Bestellmöglichkeiten oder Kontaktdaten. Vor dem öffentlichen Start: Termine und Rezept prüfen, Betreiber-/Kontaktangaben ergänzen und die für den tatsächlichen Betrieb nötigen rechtlichen Angaben abstimmen. Das Bild ist eine Visualisierung, kein Produktfoto eures fertigen Rezepts.

## Später mit GitHub Pages veröffentlichen

1. **Den Inhalt dieses Ordners `website/` als Wurzel eines eigenen GitHub-Repositories verwenden.** `.github` und `.hugo-version` mitnehmen, `.tools`, `public` und `resources` auslassen. Der Workflow erwartet diese Struktur. Den übergeordneten Businessplan nicht in dieses Repository kopieren.
2. In GitHub unter **Settings → Pages → Source → GitHub Actions** wählen.
3. Auf `main` pushen. `.github/workflows/pages.yml` baut mit der gepinnten Hugo-Version und veröffentlicht über das offizielle Pages-Artefakt. Pull Requests bauen nur und veröffentlichen nicht.
4. Der Workflow übernimmt die Pages-Basisadresse automatisch; damit funktionieren auch Projektadressen wie `https://name.github.io/poheSie/`.
5. Für eine eigene Domain die Custom-Domain-Einstellungen in GitHub Pages und DNS konfigurieren; `baseURL` für manuelle Builds passend setzen.

Falls das gesamte übergeordnete Arbeitsverzeichnis ein Repository werden soll, den Workflow in dessen `.github/workflows/` verschieben und Build-, Versions- sowie Artefaktpfade auf `website/` anpassen. Die eigenständige Variante oben ist für diese Website vorgesehen.

Grundlage: [offizielle Hugo-Anleitung für GitHub Pages](https://gohugo.io/host-and-deploy/host-on-github-pages/). Der Workflow ist vorbereitet; ein Lauf auf GitHub erfordert erst ein Repository und aktivierte Pages.

## Bildherkunft

Erstellt mit dem eingebauten Imagegen-Werkzeug. Prompt: siehe `image-prompt.txt`. Das Motiv wurde als lokale Projektdatei gespeichert. Die Website lädt keine externen Bilder oder Schriften.
