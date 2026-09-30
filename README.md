# Godot Movement System

A small Godot 4 first-person movement starter with:

- WASD movement
- Mouse-look camera
- A dedicated **Neck** node for vertical camera rotation
- Horizontal player rotation on the CharacterBody3D
- Gravity and acceleration
- Escape to release the mouse
- Left click to recapture the mouse

## Requirements

- Godot 4.x

## How to use

1. Clone or download this repository.
2. Open the project folder in Godot 4.
3. Run the project. The included `main.tscn` is already configured as the main scene.
4. Move with **WASD**.
5. Move the mouse to look around.
6. Press **Esc** to release the mouse cursor.
7. Left-click the game window to capture the cursor again.

## Using the player in another project

1. Copy `player.gd` and `player.tscn` into your project.
2. Add these Input Map actions in **Project > Project Settings > Input Map**:
   - `move_forward` = W
   - `move_backward` = S
   - `move_left` = A
   - `move_right` = D
3. Instantiate `player.tscn` into a 3D scene with collision geometry.
4. Make sure the player starts above a walkable surface.
5. Run the scene.

## Player hierarchy

```
Player (CharacterBody3D)
├── CollisionShape3D
├── Body
└── Neck (Node3D)
    └── Camera3D
```

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
