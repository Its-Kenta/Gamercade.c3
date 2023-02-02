module mygame;
import gamercade::gc;
import std::math;

usz frameCounter = 0;
int xPos = 0;
int yPos = 0;

// Called once, at the start of the game.
fn void init() @extern("init") @wasm {
    gc::consoleLog("Hello from C3!");

    xPos = gc::width() / 2;
    yPos = gc::height() / 2;
}

// Called once every frame, before draw.
fn void update() @extern("update") @wasm {

    // Print a message if the user presses the A button.
    // This defaults to the U key on the keyboard.
    if (gc::buttonAPressed(0) == 1) {
        gc::consoleLog("Pressed button A!");
    }

    // Let's move the pixel with the arrow keys
    // Handle up/down motion
    if (gc::buttonUpHeld(0) == 1) {
        yPos -= 1;
    }

    if (gc::buttonDownHeld(0) == 1) {
        yPos += 1;
    }

    // And repeat for left/right
    if (gc::buttonLeftHeld(0) == 1) {
        xPos -= 1;
    }

    if (gc::buttonRightHeld(0) == 1) {
        xPos += 1;
    }

    // Update the frame counter to keep the animation looping
    frameCounter += 1;
}

// Called once every frame, after update.
fn void draw() @extern("draw") @wasm {
    // Clear screen function takes a GraphicsParameters as a parameter,
    // so let's make one.
    int clearColor = gc::colorIndex(0);

    // Now, we can clear the screen.
    gc::clearScreen(clearColor);

    // Let's draw a pixel.
    int pixelColor = gc::colorIndex(16);
    gc::setPixel(pixelColor, xPos, yPos);

    // Let's draw a spinning pixel.
    int spinningPixelColor = gc::colorIndex(9);

    // Make it spin around
    float frame = (float)(frameCounter);
    float x = math::sin(frame * 0.1f) * 25.0f;
    float y = math::cos(frame * 0.1f) * 25.0f;

    x += (float)(xPos);
    y += (float)(yPos);

    // Draw the spinning pixel
    gc::setPixel(spinningPixelColor, (int)(x), (int)(y));
}