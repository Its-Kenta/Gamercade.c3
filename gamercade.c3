module gamercade;

// Audio
fn void playBgm(int bgmIndex) @extern("play_bgm") @wasm;
fn void playSfx(int sfxIndex, int channel) @extern("play_sfx") @wasm;
fn void stopBgm() @extern("stop_bgm") @wasm;
fn void stopChannel(int channel) @extern("stop_channel") @wasm;
fn void playNote(int noteID, int instrumentIndex, int channel) @extern("play_note") @wasm;
fn void playFrequency(float frequency, int instrumentIndex, int channel) @extern("play_frequency") @wasm;

// Data
fn int height() @extern("height") @wasm;
fn int width() @extern("width") @wasm;
fn int fps() @extern("fps") @wasm;
fn int frameTime() @extern("frame_time") @wasm;
fn int spriteSheetCount() @extern("sprite_sheet_count") @wasm;
fn int paletteCount() @extern("palette_count") @wasm;
fn int spriteHeight(int spriteSheet) @extern("sprite_height") @wasm;
fn int spriteWidth(int spriteSheet) @extern("sprite_width") @wasm;
fn int spriteCount(int spriteSheet) @extern("sprite_count") @wasm;
fn int bgmLengthSecs(int bgmIndex) @extern("bgm_length_secs") @wasm;
fn int bgmLengthFrames(int bgmIndex) @extern("bgm_length_frames") @wasm;
fn int sfxLengthSecs(int sfxIndex) @extern("sfx_length_secs") @wasm;
fn int sfxLengthFrames(int sfxIndex) @extern("sfx_length_frames") @wasm;


// Graphics Params
fn int paletteIndex(int palette_index) @extern("palette_index") @wasm;
fn int spriteSheetIndex(int spriteSheetIndex) @extern("sprite_sheet_index") @wasm;
fn int spriteIndex(int spriteIndex) @extern("sprite_index") @wasm;
fn int colorIndex(int colorIndex) @extern("color_index") @wasm;
fn int flipX(int flipX) @extern("flip_x") @wasm;
fn int flipY(int flipY) @extern("flip_y") @wasm;
fn int graphicsParameters(int paletteIndex, int spriteSheetIndex, int spriteIndex, int colorIndex, int flipX, int flipY) @extname("graphics_parameters") @wasm;

// Draw
fn void clearScreen(int graphicsParameters) @extern("clear_screen") @wasm;
fn void setPixel(int graphicsParameters, int x, int y) @extern("set_pixel") @wasm;
fn void circle(int graphicsParameters, int x, int y, int radius) @extern("circle") @wasm;
fn void rect(int graphicsParameters, int x, int y, int width, int height) @extern("rect") @wasm;
fn void rectFilled(int graphicsParameters, int x, int y, int width, int height) @extern("rect_filled") @wasm;
fn void line(int graphicsParameters, int x0, int y0, int x1, int y1) @extern("line") @wasm;
fn void sprite(int graphicsParameters, long transparencyMask, int x, int y) @extern("sprite") @wasm;

// Text
extern fn void console_log(char* text, usz len) @wasm;
macro void consoleLog(String text) => console_log(text, text.len);

// Random
fn void setSeed(int setSeed) @extern("set_seed") @wasm;
fn int randomIntRange(int min, int max) @extern("random_int_range") @wasm;
fn float randomFloat() @extern("random_float") @wasm;
fn float randomFloatRange(float min, float max) @extern("random_float_range") @wasm;

// Input
fn int buttonAPressed(int playerID) @extern("button_a_pressed") @wasm;
fn int buttonAReleased (int playerID) @extern("button_a_released") @wasm;
fn int buttonAHeld(int playerID) @extern("button_a_held") @wasm;
fn int buttonBPressed(int playerID) @extern("button_b_pressed") @wasm;
fn int buttonBReleased(int playerID) @extern("button_b_released") @wasm;
fn int buttonBHeld(int playerID) @extern("button_b_held") @wasm;
fn int buttonCPressed(int playerID) @extern("button_c_pressed") @wasm;
fn int buttonCReleased(int playerID) @extern("button_c_released") @wasm;
fn int buttonCHeld(int playerID) @extern("button_c_held") @wasm;
fn int buttonDPressed(int playerID) @extern("button_d_pressed") @wasm;
fn int buttonDReleased(int playerID) @extern("button_d_released") @wasm;
fn int buttonDHeld(int playerID) @extern("button_d_held") @wasm;
fn int buttonUpPressed(int playerID) @extern("button_up_pressed") @wasm;
fn int buttonUpReleased(int playerID) @extern("button_up_released") @wasm;
fn int buttonUpHeld(int playerID) @extern("button_up_held") @wasm;
fn int buttonDownPressed(int playerID) @extern("button_down_pressed") @wasm;
fn int buttonDownReleased(int playerID) @extern("button_down_released") @wasm;
fn int buttonDownHeld(int playerID) @extern("button_down_held") @wasm;
fn int buttonLeftPressed(int playerID) @extern("button_left_pressed") @wasm;
fn int buttonLeftReleased(int playerID) @extern("button_left_released") @wasm;
fn int buttonLeftHeld(int playerID) @extern("button_left_held") @wasm;
fn int buttonRightPressed(int playerID) @extern("button_right_pressed") @wasm;
fn int buttonRightReleased(int playerID) @extern("button_right_released") @wasm;
fn int buttonRightHeld(int playerID) @extern("button_right_held") @wasm;
fn int buttonStartPressed(int playerID) @extern("button_start_pressed") @wasm;
fn int buttonStartReleased(int playerID) @extern("button_start_released") @wasm;
fn int buttonStartHeld(int playerID) @extern("button_start_held") @wasm;
fn int buttonSelectPressed(int playerID) @extern("button_select_pressed") @wasm;
fn int buttonSelectReleased(int playerID) @extern("button_select_released") @wasm;
fn int buttonSelectHeld(int playerID) @extern("button_select_held") @wasm;
fn int buttonLeftShoulderPressed(int playerID) @extern("button_left_shoulder_pressed") @wasm;
fn int buttonLeftShoulderReleased(int playerID) @extern("button_left_shoulder_released") @wasm;
fn int buttonLeftShoulder_Held(int playerID) @extern("button_left_shoulder_held") @wasm;
fn int buttonRightShoulderPressed(int playerID) @extern("button_right_shoulder_pressed") @wasm;
fn int buttonRightShoulderHeld(int playerID) @extern("button_right_shoulder_held") @wasm;
fn int buttonLeftStickPressed(int playerID) @extern("button_left_stick_pressed") @wasm;
fn int buttonLeftStickReleased(int playerID) @extern("button_left_stick_released") @wasm;
fn int buttonLeftStickHeld(int playerID) @extern("button_left_stick_held") @wasm;
fn int buttonRightStickPressed(int playerID) @extern("button_right_stick_pressed") @wasm;
fn int buttonRightStickReleased(int playerID) @extern("button_right_stick_released") @wasm;
fn int buttonRightStickHeld(int playerID) @extern("button_right_stick_held") @wasm;
fn int buttonLeftTriggerPressed(int playerID) @extern("button_left_trigger_pressed") @wasm;
fn int buttonLeftTriggerReleased(int playerID) @extern("button_left_trigger_released") @wasm;
fn int buttonLeftTriggerHeld(int playerID) @extern("button_left_trigger_held") @wasm;
fn int buttonRightTriggerPressed(int playerID) @extern("button_right_trigger_pressed") @wasm;
fn int buttonRightTriggerPeleased(int playerID) @extern("button_right_trigger_released") @wasm;
fn int buttonRightTriggerHeld(int playerID) @extern("button_right_trigger_held") @wasm;
fn int analogLeftX(int playerID) @extern("analog_left_x") @wasm;
fn int analogLeftY(int playerID) @extern("analog_left_y") @wasm;
fn int analogRightX(int playerID) @extern("analog_right_x") @wasm;
fn int analogRightY(int playerID) @extern("analog_right_y") @wasm;
fn int triggerLeft(int playerID) @extern("trigger_left") @wasm;
fn int triggerRight(int playerID) @extern("trigger_right") @wasm;
fn int rawInputState(int playerID) @extern("raw_input_state") @wasm;

// Multiplayer
fn int numPlayers() @extern("num_players") @wasm;

fn int isLocalPlayer(int playerID) @extern("is_local_player") @wasm;
fn int isRemotePlayer(int playerID) @extern("is_remote_player") @wasm;