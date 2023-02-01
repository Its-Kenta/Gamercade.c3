module hello_world;
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