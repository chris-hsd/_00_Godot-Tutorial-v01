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
