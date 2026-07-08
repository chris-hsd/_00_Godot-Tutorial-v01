# Autoload/EventBus
#das hier definierte Events.global_pos 
extends Node

signal player_moved(global_pos: Vector2)
signal stats_changed(total_health: float, total_steps:int)
signal tile_effect(damage: float, heal: float, total_steps: int)
