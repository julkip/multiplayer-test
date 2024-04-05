extends Node2D

var player_scene = preload("res://player.tscn")
var peer = ENetMultiplayerPeer.new()


func _ready():
    randomize()
    multiplayer.peer_connected.connect(add_player)


func _on_join_pressed():
    peer.create_client("127.0.0.1", 1027)
    multiplayer.multiplayer_peer = peer
    $CanvasLayer.hide()


func _on_host_pressed():
    peer.create_server(1027)
    multiplayer.multiplayer_peer = peer
    add_player()
    $CanvasLayer.hide()


func add_player(id: int = 1):
    if not multiplayer.is_server():
        return
    if has_node(str(id)):
        print("A player with ID", id, "already exists.")
        return
    var player = player_scene.instantiate()
    player.name = str(id)
    call_deferred("add_child", player)
