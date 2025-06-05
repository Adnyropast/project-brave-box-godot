extends Resource

class_name ActiveAbility

enum TargetType {
	SINGLE,
	MULTIPLE,
	SINGLE_AND_MULTIPLE,
	SELF,
}

@export var name: String
@export var mp_cost: int
var item_cost: Item
@export var target_type: TargetType
@export var allies_by_default: bool
@export var koed_targets: bool
@export var gdscript: GDScript

func can_target_single():
	return target_type == TargetType.SINGLE or target_type == TargetType.SINGLE_AND_MULTIPLE

func can_target_multiple():
	return target_type == TargetType.MULTIPLE or target_type == TargetType.SINGLE_AND_MULTIPLE

func can_target_allies_and_enemies():
	return false

func targets_self():
	return target_type == TargetType.SELF
