extends HSlider

func _ready():
	self.set_as_ratio(Settings.MASTERVOLUME)

func _process(_delta):
	Settings.set_master_db(self.get_as_ratio())


