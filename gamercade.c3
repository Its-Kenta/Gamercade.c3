module gamercade::gc;

// Audio
fn void playBgm(int bgmIndex) @extern("play_bgm");
fn void playSfx(int sfxIndex, int channel) @extern("play_sfx");
fn void stopBgm() @extern("stop_bgm");
fn void stopChannel(int channel) @extern("stop_channel");
fn void playNote(int noteID, int instrumentIndex, int channel) @extern("play_note");
fn void playFrequency(float frequency, int instrumentIndex, int channel) @extern("play_frequency");

// Data
fn int height() @extern("height");
fn int width() @extern("width");
fn int fps() @extern("fps");
fn int frameTime() @extern("frame_time");
fn int spriteSheetCount() @extern("sprite_sheet_count");
fn int paletteCount() @extern("palette_count");
fn int spriteHeight(int spriteSheet) @extern("sprite_height");
fn int spriteWidth(int spriteSheet) @extern("sprite_width");
fn int spriteCount(int spriteSheet) @extern("sprite_count");
fn int bgmLengthSecs(int bgmIndex) @extern("bgm_length_secs");
fn int bgmLengthFrames(int bgmIndex) @extern("bgm_length_frames");
fn int sfxLengthSecs(int sfxIndex) @extern("sfx_length_secs");
fn int sfxLengthFrames(int sfxIndex) @extern("sfx_length_frames");


// Graphics Params
fn int paletteIndex(int palette_index) @extern("palette_index");
fn int spriteSheetIndex(int spriteSheetIndex) @extern("sprite_sheet_index");
fn int spriteIndex(int spriteIndex) @extern("sprite_index");
fn int colorIndex(int colorIndex) @extern("color_index");
fn int flipX(int flipX) @extern("flip_x");
fn int flipY(int flipY) @extern("flip_y");
fn int graphicsParameters(int paletteIndex, int spriteSheetIndex, int spriteIndex, int colorIndex, int flipX, int flipY) @extname("graphics_parameters");

// Draw
fn void clearScreen(int graphicsParameters) @extern("clear_screen");
fn void setPixel(int graphicsParameters, int x, int y) @extern("set_pixel");
fn void circle(int graphicsParameters, int x, int y, int radius) @extern("circle");
fn void rect(int graphicsParameters, int x, int y, int width, int height) @extern("rect");
fn void rectFilled(int graphicsParameters, int x, int y, int width, int height) @extern("rect_filled");
fn void line(int graphicsParameters, int x0, int y0, int x1, int y1) @extern("line");
fn void sprite(int graphicsParameters, long transparencyMask, int x, int y) @extern("sprite");

// Text
extern fn void console_log(char* text, usz len);
macro void consoleLog(String text) => console_log(text, text.len);

// Random
fn void setSeed(int setSeed) @extern("set_seed");
fn int randomIntRange(int min, int max) @extern("random_int_range");
fn float randomFloat() @extern("random_float");
fn float randomFloatRange(float min, float max) @extern("random_float_range");

// Input
fn int buttonAPressed(int playerID) @extern("button_a_pressed");
fn int buttonAReleased (int playerID) @extern("button_a_released");
fn int buttonAHeld(int playerID) @extern("button_a_held");
fn int buttonBPressed(int playerID) @extern("button_b_pressed");
fn int buttonBReleased(int playerID) @extern("button_b_released");
fn int buttonBHeld(int playerID) @extern("button_b_held");
fn int buttonCPressed(int playerID) @extern("button_c_pressed");
fn int buttonCReleased(int playerID) @extern("button_c_released");
fn int buttonCHeld(int playerID) @extern("button_c_held");
fn int buttonDPressed(int playerID) @extern("button_d_pressed");
fn int buttonDReleased(int playerID) @extern("button_d_released");
fn int buttonDHeld(int playerID) @extern("button_d_held");
fn int buttonUpPressed(int playerID) @extern("button_up_pressed");
fn int buttonUpReleased(int playerID) @extern("button_up_released");
fn int buttonUpHeld(int playerID) @extern("button_up_held");
fn int buttonDownPressed(int playerID) @extern("button_down_pressed");
fn int buttonDownReleased(int playerID) @extern("button_down_released");
fn int buttonDownHeld(int playerID) @extern("button_down_held");
fn int buttonLeftPressed(int playerID) @extern("button_left_pressed");
fn int buttonLeftReleased(int playerID) @extern("button_left_released");
fn int buttonLeftHeld(int playerID) @extern("button_left_held");
fn int buttonRightPressed(int playerID) @extern("button_right_pressed");
fn int buttonRightReleased(int playerID) @extern("button_right_released");
fn int buttonRightHeld(int playerID) @extern("button_right_held");
fn int buttonStartPressed(int playerID) @extern("button_start_pressed");
fn int buttonStartReleased(int playerID) @extern("button_start_released");
fn int buttonStartHeld(int playerID) @extern("button_start_held");
fn int buttonSelectPressed(int playerID) @extern("button_select_pressed");
fn int buttonSelectReleased(int playerID) @extern("button_select_released");
fn int buttonSelectHeld(int playerID) @extern("button_select_held");
fn int buttonLeftShoulderPressed(int playerID) @extern("button_left_shoulder_pressed");
fn int buttonLeftShoulderReleased(int playerID) @extern("button_left_shoulder_released");
fn int buttonLeftShoulder_Held(int playerID) @extern("button_left_shoulder_held");
fn int buttonRightShoulderPressed(int playerID) @extern("button_right_shoulder_pressed");
fn int buttonRightShoulderHeld(int playerID) @extern("button_right_shoulder_held");
fn int buttonLeftStickPressed(int playerID) @extern("button_left_stick_pressed");
fn int buttonLeftStickReleased(int playerID) @extern("button_left_stick_released");
fn int buttonLeftStickHeld(int playerID) @extern("button_left_stick_held");
fn int buttonRightStickPressed(int playerID) @extern("button_right_stick_pressed");
fn int buttonRightStickReleased(int playerID) @extern("button_right_stick_released");
fn int buttonRightStickHeld(int playerID) @extern("button_right_stick_held");
fn int buttonLeftTriggerPressed(int playerID) @extern("button_left_trigger_pressed");
fn int buttonLeftTriggerReleased(int playerID) @extern("button_left_trigger_released");
fn int buttonLeftTriggerHeld(int playerID) @extern("button_left_trigger_held");
fn int buttonRightTriggerPressed(int playerID) @extern("button_right_trigger_pressed");
fn int buttonRightTriggerPeleased(int playerID) @extern("button_right_trigger_released");
fn int buttonRightTriggerHeld(int playerID) @extern("button_right_trigger_held");
fn int analogLeftX(int playerID) @extern("analog_left_x");
fn int analogLeftY(int playerID) @extern("analog_left_y");
fn int analogRightX(int playerID) @extern("analog_right_x");
fn int analogRightY(int playerID) @extern("analog_right_y");
fn int triggerLeft(int playerID) @extern("trigger_left");
fn int triggerRight(int playerID) @extern("trigger_right");
fn int rawInputState(int playerID) @extern("raw_input_state");

// Multiplayer
fn int numPlayers() @extern("num_players");

fn int isLocalPlayer(int playerID) @extern("is_local_player");
fn int isRemotePlayer(int playerID) @extern("is_remote_player");
