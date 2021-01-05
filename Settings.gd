extends Node

var MASTERVOLUME = 1
var MUSICVOLUME = 1
var EFFECTVOLUME = 1


func _ready():
	refresh_levels()

#This function redoes all audio levels to the set value
func refresh_levels():
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), linear2db(MASTERVOLUME))
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Music"), linear2db(MUSICVOLUME))
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Sound Effect"), linear2db(EFFECTVOLUME))
	pass

#This function sets the master volume to a % of 100(Expects float)
func set_master_db(input):
	MASTERVOLUME = input
	refresh_levels()
	
#This function sets the music volume to a % of 100(Expects float)
func set_music_db(input):
	MUSICVOLUME = input
	refresh_levels()

func set_effect_db(input):
	EFFECTVOLUME = input
	refresh_levels()
