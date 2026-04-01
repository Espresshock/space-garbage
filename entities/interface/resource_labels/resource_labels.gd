extends HBoxContainer


@onready var resource: Label = $InputResource
@onready var storage: Label = $InputStorage

func set_labels(_resource: GlobalResources.RESOURCE, _storage: int) -> void:
	resource.text = str(GlobalResources.RESOURCE.keys()[_resource])
	storage.text = str(_storage)
