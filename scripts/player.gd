extends CharacterBody2D

const SPEED = 130.0
const JUMP_VELOCITY = -300.0
const FLY_SPEED = 180.0

var is_flying := false # mod terbang
var current_portal = null

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var jump_sound: AudioStreamPlayer2D = $JumpSound

func _physics_process(delta: float) -> void:
	# === TOGGLE FLY MODE ===
	if Input.is_action_just_pressed("fly_toggle"):
		is_flying = !is_flying
		velocity.y = 0
		
	# === INTERACT === #
	if Input.is_action_just_pressed("Interact"):
		if current_portal != null:
			current_portal.interact()
			
	# === VERTICAL MOVEMENT ===
	if is_flying:
		velocity.y = 0

		if Input.is_action_pressed("jump"):
			velocity.y = -FLY_SPEED
		elif Input.is_action_pressed("fly_down"):
			velocity.y = FLY_SPEED
	else:
		# Gravity normal
		if not is_on_floor():
			velocity += get_gravity() * delta

		if Input.is_action_just_pressed("jump") and is_on_floor():
			velocity.y = JUMP_VELOCITY
			jump_sound.play()
			

	# === HORIZONTAL MOVEMENT ===
	var direction := Input.get_axis("move_left", "move_right")

	if direction > 0:
		animated_sprite.flip_h = false
	elif direction < 0:
		animated_sprite.flip_h = true

	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	# === ANIMATION ===
	if is_flying:
		animated_sprite.play("jump")
	elif is_on_floor():
		if direction == 0:
			animated_sprite.play("idle")
		else:
			animated_sprite.play("run")
	else:
		animated_sprite.play("jump")

	move_and_slide()
	
