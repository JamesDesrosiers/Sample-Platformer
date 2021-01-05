extends HSlider

func _ready():
	self.set_as_ratio(Settings.EFFECTVOLUME)

func _process(_delta):
	Settings.set_effect_db(self.get_as_ratio())
