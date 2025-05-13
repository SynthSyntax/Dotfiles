#!/usr/bin/env python3

import tkinter as tk
import tkinter.font as tkfont
import os

NOTE_FILE = os.path.expanduser("~/.notepad.txt")

def save_and_exit():
    with open(NOTE_FILE, "w") as f:
        f.write(textbox.get("1.0", tk.END).strip())
    root.destroy()

# Create main window
root = tk.Tk()
root.title("NotepadPopup")
root.attributes("-topmost", True)
root.configure(bg="#2e3440")

# Set fixed position and size as requested
root.geometry("600x500+1315+670")

# Font configuration
font = tkfont.Font(family="Fira Code", size=9)

# Main frame styling
frame = tk.Frame(root, bg="#2e3440", bd=0, highlightthickness=0)
frame.pack(fill="both", expand=True, padx=16, pady=16)

# Textbox with aesthetic styling
textbox = tk.Text(
    frame,
    wrap="word",
    bg="#3b4252",
    fg="#eceff4",
    insertbackground="#88c0d0",
    font=font,
    relief="flat",
    height=10,
    padx=10,
    pady=10,
    borderwidth=0
)
textbox.pack(fill="both", expand=True)

# Load previous content
if os.path.exists(NOTE_FILE):
    with open(NOTE_FILE, "r") as f:
        textbox.insert("1.0", f.read())

# Button container
btn_frame = tk.Frame(frame, bg="#2e3440")
btn_frame.pack(fill="x", pady=(10, 0))

# Button styling
btn_style = {
    "bg": "#4c566a",
    "fg": "#eceff4",
    "activebackground": "#5e81ac",
    "activeforeground": "#eceff4",
    "bd": 0,
    "font": ("Fira Code", 10),
    "padx": 10,
    "pady": 5
}

# Save button
save_btn = tk.Button(btn_frame, text="💾 Save & Close", command=save_and_exit, **btn_style)
save_btn.pack(side="right")

textbox.focus_set()
root.mainloop()
