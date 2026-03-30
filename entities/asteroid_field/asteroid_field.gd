extends GPUParticles2D

var ratio_increase_interval: float = 10
var time: float = 0

func _ready() -> void:
	self.emitting = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if time > ratio_increase_interval:
		self.amount_ratio = self.amount_ratio + 0.1
		time = 0
	else:
		time += delta
		print(time)


func increase_amount_ration() -> void:
	self.amount_ratio += 0.025
