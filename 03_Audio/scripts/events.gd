# Autoload/EventBus
#das hier definierte Events.global_pos 
extends Node

signal player_moved(global_pos: Vector2)
signal stats_changed(total_health: float, total_steps:int)
signal tile_effect(damage: float, heal: float, total_steps: int)

#leaving hall, entering the forest 
signal zone_entered(zone_name: String, body: Node2D)
signal zone_exited(zone_name: String, body: Node2D)
