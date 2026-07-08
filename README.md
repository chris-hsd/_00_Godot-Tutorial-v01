> **🌐 Sprachen / Languages:** Dieses README ist zweisprachig. Zuerst folgt die **deutsche** Fassung, danach der **englische** Originaltext. — This README is bilingual. The **German** version comes first, followed by the **English** original. ([→ English](#english-version))

---

# 🇩🇪 Deutsche Fassung

# Godot 2D Top-Down — Tutorials zu Kernmechaniken

Eine Sammlung kleiner, in sich geschlossener Godot-4.6-Projekte, die jeweils eine einzelne **Kernmechanik** für die Entwicklung von 2D-Top-Down-Spielen isolieren. Arbeite sie in der nummerierten Reihenfolge durch: Jedes Projekt baut auf den Ideen des vorherigen auf. Die Projekte `03`–`07` enthalten einen `docs/`-Ordner mit einer Schritt-für-Schritt-Ausarbeitung (`.docx` / `.pdf`, auf Deutsch).

> Engine: Godot **4.6** (GL Compatibility). Wiederkehrende Besetzung: eine `player`-Figur (CharacterBody2D „Girl"), eine `world`/`game`-Szene und — ab Projekt 04 — einsammelbare **Eier** sowie ein globaler `events.gd`-Signalbus.

## Die 7 Projekttypen

**01 — Spieler & Animationen** (`01_player_and_animations`)
Der Ausgangspunkt: ein Projekt anlegen, Nodes und Skripte hinzufügen und einen `CharacterBody2D` per Eingabe steuern. Führt die GDScript-Grundlagen und die richtungsabhängige Sprite-Animation (idle / oben / unten / links / rechts) über `AnimatedSprite2D` ein. Wird mit einer `begin`- und einer `end`-Version ausgeliefert, sodass du vorher/nachher vergleichen kannst.

**02 — Tilemap-Ebenen & Auto-Tiling** (`02_tilemap-layers`)
Baue die Spielwelt aus Kacheln auf. Behandelt `TileMapLayer`, Atlas-Quellen, **Terrains (Auto-Tiling)** mit dem 3×3-Peering-Bit-Modell, Kachelkollision und benutzerdefinierte Datenebenen. Enthält `Start`- und `Finale`-Versionen sowie drei alternative Asset-Pakete, um dieselbe Mechanik mit unterschiedlicher Grafik zu gestalten: `_ninja-assets`, `_pirat-assets` und `_sprout-assets`.

**03 — Audio** (`03_Audio`)
Erwecke die Welt mit Klang zum Leben: bildgenaue Schrittgeräusche, gekoppelt an die Laufanimation (über das `frame_changed`-Signal von `AnimatedSprite2D` und einen `AudioStreamRandomizer`), Hintergrundmusik und UI-Sounds. Behandelt außerdem, wo man kostenlose Audiodateien findet und wie man sie bearbeitet.

**04 — Signale** (`04_Signale_eggs`)
Entkopplung mit Signalen, vermittelt anhand einsammelbarer Eier. Stellt fragile direkte Node-Referenzen dem Signalsystem von Godot gegenüber — integrierte Signale (`Area2D.body_entered`) versus eigene `signal`-Deklarationen — und führt einen globalen **Signalbus** (`events.gd`-Autoload) sowie einen HUD-Zähler ein.

**05 — Handgemachter Dialog** (`05_Dialog_handcrafted`)
Baue ein Dialogsystem von Grund auf (ohne Add-on): Ein Auslöser (z. B. ein sprechendes Haus) reagiert auf Kollision und steuert von Hand in GDScript geschriebene Dialogdaten und -UI. Gut, um zu verstehen, was ein Dialog-Add-on unter der Haube tut, bevor man zu einem greift.

**06 — Dialog per Add-on** (`06_Dialog_add-on`)
Dasselbe Ziel — In-Game-Dialoge — jedoch mit dem Add-on **Dialogic 2**. Behandelt das Installieren/Aktivieren eines Add-ons, das Erstellen von Timelines und Charakteren, das Styling und das Auslösen einer Timeline aus einer Szene. Enthält Hinweise zur Bewertung von Add-ons (GitHub-Aktivität, Sterne, Mitwirkende, Engine-Kompatibilität).

**07 — Bewegte NPCs / Objekte** (`07_Bewegte_NPCs`)
Drei Arten, Objekte zu bewegen, alle unter Wiederverwendung einer `egg.tscn`: **A)** auf Schienen mit `Path2D` + `PathFollow2D`, **B)** springend zu zufälligen Zielen mit **Tweens** (ohne Physik) und **C)** physikbasiertes Umherwandern, das vor dem Spieler flieht und von Wänden blockiert wird. Außerdem ein Überblick über häufige Kollisions- und Signalfallen.

## Verwendung

Öffne den Ordner eines beliebigen Projekts als Projekt im Godot-4.6-Editor und starte die Hauptszene (`game.tscn` / `world.tscn`). Lies das passende Dokument im `docs/`-Ordner des jeweiligen Projekts begleitend zum Code.

---

<a name="english-version"></a>
# 🇬🇧 English Version

# Godot 2D Top-Down — Core Mechanics Tutorials

A collection of small, self-contained Godot 4.6 projects, each isolating one **core mechanic** for building 2D top-down games. Work through them in numbered order: every project builds on the ideas of the previous one. Projects `03`–`07` include a `docs/` folder with a step-by-step write-up (`.docx` / `.pdf`, in German).

> Engine: Godot **4.6** (GL Compatibility). Recurring cast: a `player` (CharacterBody2D "Girl"), a `world`/`game` scene, and — from project 04 onward — collectible **eggs** and a global `events.gd` signal bus.

## The 7 project types

**01 — Player & Animations** (`01_player_and_animations`)
The starting point: create a project, add nodes and scripts, and drive a `CharacterBody2D` with input. Introduces GDScript basics and directional sprite animation (idle / up / down / left / right) via `AnimatedSprite2D`. Ships with a `begin` and an `end` version so you can compare before/after.

**02 — Tilemap Layers & Auto-Tiling** (`02_tilemap-layers`)
Build the game world from tiles. Covers `TileMapLayer`, atlas sources, **terrains (auto-tiling)** with the 3×3 peering-bit model, tile collision, and custom data layers. Includes `Start` and `Finale` versions, plus three alternate asset packs to paint the same mechanic with different art: `_ninja-assets`, `_pirat-assets`, and `_sprout-assets`.

**03 — Audio** (`03_Audio`)
Bring the world to life with sound: frame-accurate footstep sounds coupled to the walk animation (via the `AnimatedSprite2D` `frame_changed` signal and an `AudioStreamRandomizer`), ambient music, and UI sounds. Also covers where to source free audio and how to edit it.

**04 — Signals** (`04_Signale_eggs`)
Decoupling with signals, taught through collectible eggs. Contrasts fragile direct node references against Godot's signal system — built-in signals (`Area2D.body_entered`) versus custom `signal` declarations — and introduces a global **signal bus** (`events.gd` autoload) plus a HUD counter.

**05 — Handcrafted Dialog** (`05_Dialog_handcrafted`)
Build a dialogue system from scratch (no add-on): a trigger (e.g. a talking house) fires on collision, driving dialogue data and UI written by hand in GDScript. Good for understanding what a dialogue add-on does under the hood before reaching for one.

**06 — Dialog via Add-on** (`06_Dialog_add-on`)
The same goal — in-game dialogue — using the **Dialogic 2** add-on instead. Covers installing/activating an add-on, authoring timelines and characters, styling, and triggering a timeline from a scene. Includes notes on evaluating add-ons (GitHub activity, stars, contributors, engine compatibility).

**07 — Moving NPCs / Objects** (`07_Bewegte_NPCs`)
Three ways to make objects move, all reusing one `egg.tscn`: **A)** on rails with `Path2D` + `PathFollow2D`, **B)** hopping to random targets with **Tweens** (no physics), and **C)** physics-based wandering that flees the player and is blocked by walls. Also a tour of common collision and signal pitfalls.

## How to use

Open any project's folder as a project in the Godot 4.6 editor and run the main scene (`game.tscn` / `world.tscn`). Read the matching document in that project's `docs/` folder alongside the code.
