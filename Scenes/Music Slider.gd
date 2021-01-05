extends HSlider

func _ready():
	self.set_as_ratio(Settings.MUSICVOLUME)

func _process(_delta):
	Settings.set_music_db(self.get_as_ratio())


