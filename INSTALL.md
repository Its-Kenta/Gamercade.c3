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
import gamercade;
import std::math::nolibc::trig;

usz frameCounter = 0;
int xPos = 0;
int yPos = 0;

// Called once, at the start of the game.
fn void init() @extern("init") @wasm {
    gamercade::consoleLog("Hello from C3!");

    xPos = gamercade::width() / 2;
    yPos = gamercade::height() / 2;
}

// Called once every frame, before draw.
fn void update() @extern("update") @wasm {

    // Print a message if the user presses the A button.
    // This defaults to the U key on the keyboard.
    if (gamercade::buttonAPressed(0) == 1) {
        gamercade::consoleLog("Pressed button A!");
    }

    // Let's move the pixel with the arrow keys
    // Handle up/down motion
    if (gamercade::buttonUpHeld(0) == 1) {
        yPos -= 1;
    }

    if (gamercade::buttonDownHeld(0) == 1) {
        yPos += 1;
    }

    // And repeat for left/right
    if (gamercade::buttonLeftHeld(0) == 1) {
        xPos -= 1;
    }

    if (gamercade::buttonRightHeld(0) == 1) {
        xPos += 1;
    }

    // Update the frame counter to keep the animation looping
    frameCounter += 1;
}

// Called once every frame, after update.
fn void draw() @extern("draw") @wasm {
    // Clear screen function takes a GraphicsParameters as a parameter,
    // so let's make one.
    int clearColor = gamercade::colorIndex(0);

    // Now, we can clear the screen.
    gamercade::clearScreen(clearColor);

    // Let's draw a pixel.
    int pixelColor = gamercade::colorIndex(16);
    gamercade::setPixel(pixelColor, xPos, yPos);

    // Let's draw a spinning pixel.
    int spinningPixelColor = gamercade::colorIndex(9);

    // Make it spin around
    float frame = (float)(frameCounter);
    float x = trig::_sinf(frame * 0.1) * 25.0;
    float y = trig::_cosf(frame * 0.1) * 25.0;

    x += (float)(xPos);
    y += (float)(yPos);

    // Draw the spinning pixel
    gamercade::setPixel(spinningPixelColor, (int)(x), (int)(y));
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
