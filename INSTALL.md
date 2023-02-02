<div align="center">
<p>

[📖 Back to Main Page](./README.md)
</p>

# Installation Guide

</div>

## Table of Contents

- [Installation Guide](#installation-guide)
  - [Table of Contents](#table-of-contents)
  - [Installation](#compatibility)
  - [Dependencies](#dependencies)
  - [Usage](#usage)
  - [Building Project](#building-project)

## Installation

[**gamercade.c3**](https://github.com/Its-Kenta/Gamercade.c3/blob/main/gamercade.c3) needs to be dropped into your project and have it's module imported `import gamercade;`

You can also view the template added to this repository to see how it's setup.

## Dependencies

No dependencies required for this binding.

## Usage

Follow the [Gamercade Getting Started Guide](https://gamercade.io/docs/category/getting-started) to find out how to create and write your first rom for Gamercade. **Gamercade.c3** follows the same underlying API, no differences are made. We're only following a different naming convention.

To embark on your journey to writing your first rom we need to learn few important bits about Gamercade for C3.

Your main entry point `main.c3` does not require a `fn int main(String[] argv)` function as Gamercades `init()` becomes the main entry point within the console itself.

Your `main.c3` needs to hold three functions that are not part of the **Gamercade.c3** binding, those functions have to be written by yourself and they're:

- init
- update
- draw

Three functions required to create your game for Gamercade and this is how your beginning project should look like:

```c
module mygame;
import gamercade;

// Called once, at the start of the game.
fn void init() @extern("init") @wasm {

}

// Called once every frame, before draw.
fn void update() @extern("update") @wasm {

}

// Called once every frame, after update.
fn void draw() @extern("draw") @wasm {
   
}
```

This is all you need to start! You can see a code example below:

<details>
<summary><b>Example Code</b></summary>

```c
module mygame;
import gamercade::gc;
import std::math;

usz frame_counter = 0;
int xpos = 0;
int ypos = 0;

// Called once, at the start of the game.
fn void init() @extern("init") @wasm {
    gc::console_log_string("Hello from C3!");

    xpos = gc::width() / 2;
    ypos = gc::height() / 2;
}

// Called once every frame, before draw.
fn void update() @extern("update") @wasm {

    // Print a message if the user presses the A button.
    // This defaults to the U key on the keyboard.
    if (gc::button_a_pressed(0) == 1) {
        gc::console_log_string("Pressed button A!");
    }

    // Let's move the pixel with the arrow keys
    // Handle up/down motion
    if (gc::button_up_held(0) == 1) {
        ypos -= 1;
    }

    if (gc::button_down_held(0) == 1) {
        ypos += 1;
    }

    // And repeat for left/right
    if (gc::button_left_held(0) == 1) {
        xpos -= 1;
    }

    if (gc::button_right_held(0) == 1) {
        xpos += 1;
    }

    // Update the frame counter to keep the animation looping
    frame_counter += 1;
}

// Called once every frame, after update.
fn void draw() @extern("draw") @wasm {
    // Clear screen function takes a GraphicsParameters as a parameter,
    // so let's make one.
    int clear_color = gc::color_index(0);

    // Now, we can clear the screen.
    gc::clear_screen(clear_color);

    // Let's draw a pixel.
    int pixel_color = gc::color_index(16);
    gc::set_pixel(pixel_color, xpos, ypos);

    // Let's draw a spinning pixel.
    int spinning_pixel_color = gc::color_index(9);

    // Make it spin around
    float frame = (float)(frame_counter);
    float x = math::sin(frame * 0.1f) * 25.0f;
    float y = math::cos(frame * 0.1f) * 25.0f;

    x += (float)(xpos);
    y += (float)(ypos);

    // Draw the spinning pixel
    gc::set_pixel(spinning_pixel_color, (int)(x), (int)(y));
}
```

</details>

## Building Project

Before we build our project we need to adjust `project.json` file with additional linker arguments:

```json
{
  // language version of C3
  "langrev": "1",
  // warnings used for all targets
  "warnings": [ "no-unused" ],
  // directories where C3 library files may be found
  "dependency-search-paths": [ "lib" ],
  // libraries to use for all targets
  "dependencies": [ ],
  // author(s), optionally with email
  "authors": [ "John Doe <john.doe@example.com>" ],
  // Version using semantic versioning
  "version": "0.1.0",
  // sources compiled for all targets
  "sources": [ "src/**" ],
  "target" : "wasm32",
  "nolibc" : true,
  "no-entry" : true,
  "link-args" : ["--allow-undefined"],
  // Targets
  "targets": {
    "gamercade": { // this field changes the name of the .wasm file.
      "type": "executable"
    }
  }
}

```
