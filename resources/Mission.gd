extends Resource

class_name Mission

@export var title: String
@export var battle: Battle
@export var unlocks: Array[Mission]
var completable: bool = true
