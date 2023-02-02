module hello_world;
import gamercade;
import std::math;

usz frame_counter = 0;
int xpos = 0;
int ypos = 0;

// Called once, at the start of the game.
fn void init() @extern("init") @wasm {
    gamercade::console_log_string("Hello from C3!");

    xpos = gamercade::width() / 2;
    ypos = gamercade::height() / 2;
}

// Called once every frame, before draw.
fn void update() @extern("update") @wasm {

    // Print a message if the user presses the A button.
    // This defaults to the U key on the keyboard.
    if (gamercade::button_a_pressed(0) == 1) {
        gamercade::console_log_string("Pressed button A!");
    }

    // Let's move the pixel with the arrow keys
    // Handle up/down motion
    if (gamercade::button_up_held(0) == 1) {
        ypos -= 1;
    }

    if (gamercade::button_down_held(0) == 1) {
        ypos += 1;
    }

    // And repeat for left/right
    if (gamercade::button_left_held(0) == 1) {
        xpos -= 1;
    }

    if (gamercade::button_right_held(0) == 1) {
        xpos += 1;
    }

    // Update the frame counter to keep the animation looping
    frame_counter += 1;
}

// Called once every frame, after update.
fn void draw() @extern("draw") @wasm {
    // Clear screen function takes a GraphicsParameters as a parameter,
    // so let's make one.
    int clear_color = gamercade::color_index(0);

    // Now, we can clear the screen.
    gamercade::clear_screen(clear_color);

    // Let's draw a pixel.
    int pixel_color = gamercade::color_index(16);
    gamercade::set_pixel(pixel_color, xpos, ypos);

    // Let's draw a spinning pixel.
    int spinning_pixel_color = gamercade::color_index(9);

    // Make it spin around
    float frame = (float)(frame_counter);
    float x = math::sin(frame * 0.1f) * 25.0f;
    float y = math::cos(frame * 0.1f) * 25.0f;

    x += (float)(xpos);
    y += (float)(ypos);

    // Draw the spinning pixel
    gamercade::set_pixel(spinning_pixel_color, (int)(x), (int)(y));
}