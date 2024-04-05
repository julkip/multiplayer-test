extends Sprite2D


func _enter_tree():
    set_multiplayer_authority(name.to_int())


func _ready():
    position = Vector2(randi() % 1000 + 50, randi() % 500 + 50)


func _process(_delta):
    if not is_multiplayer_authority():
        return
    if Input.is_action_just_pressed("ui_accept"):
        self.rotation = self.rotation + PI / 2
