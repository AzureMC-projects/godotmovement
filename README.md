# Godot Movement System

A small Godot 4 first-person movement system with:

- WASD movement
- Mouse-look camera
- A dedicated **Neck** node for vertical camera rotation
- Horizontal player rotation on the CharacterBody3D
- Gravity and acceleration
- Escape to release the mouse
- Left click to recapture the mouse

## Requirements

- Godot 4.x

## Import into an existing Godot game

You can use this system in an existing Godot 4 project without replacing your current main scene.

### 1. Copy the player files

Copy `player.gd` and `player.tscn` into your existing project, for example in `res://player/`.

### 2. Add the Input Map actions

Open **Project > Project Settings > Input Map** and create these actions:

| Action | Key |
|---|---|
| `move_forward` | W |
| `move_backward` | S |
| `move_left` | A |
| `move_right` | D |

Keep the action names exactly as shown unless you also change them in `player.gd`.

### 3. Add the player to your existing scene

Open the 3D scene where you want the player to spawn and drag `player.tscn` into the scene tree, or use **Scene > Instantiate Child Scene**.

Place the player above your floor or other collision geometry.

### 4. Make sure your level has collision

The controller uses `CharacterBody3D` collision. Your floor, walls, and other objects the player should interact with need appropriate collision shapes/physics bodies.

### 5. Set the camera

The included player contains:

    Player (CharacterBody3D)
    ├── CollisionShape3D
    ├── Body
    └── Neck (Node3D)
        └── Camera3D

The included `Camera3D` is already set as the current camera. If your game already has a gameplay camera, remove/disable the old one or make the player's camera current.

### 6. Run your existing game

Your existing main scene does not need to be replaced. The player is simply instantiated into it.

Use **WASD** to move and the **mouse** to look. **Esc** releases the mouse and **left click** captures it again.

## How to use this repository by itself

1. Clone or download this repository.
2. Open the project folder in Godot 4.
3. Add the player scene to your own 3D level.
4. Configure the four Input Map actions above.
5. Set your level as the main scene.
6. Run the game.

## Player hierarchy

    Player (CharacterBody3D)
    ├── CollisionShape3D
    ├── Body
    └── Neck (Node3D)
        └── Camera3D

The player rotates left/right, while `Neck` rotates up/down. This makes the setup easy to extend with head bobbing, crouching, weapon sway, or other camera effects.

## Tuning movement

Open `player.gd` and adjust:

- `walk_speed` — maximum horizontal speed.
- `acceleration` — ground acceleration.
- `air_acceleration` — acceleration while airborne.
- `gravity` — downward acceleration.
- `mouse_sensitivity` — mouse-look speed.
- `min_pitch` / `max_pitch` — vertical look limits.

## Notes

This is a movement foundation rather than a complete FPS controller. Jumping, sprinting, crouching, head bobbing, and footsteps can be added independently.
