module gamercade::gc;

// Audio
extern fn void playBgm(int bgmIndex) @extern("play_bgm");
extern fn void playSfx(int sfxIndex, int channel) @extern("play_sfx");
extern fn void stopBgm() @extern("stop_bgm");
extern fn void stopChannel(int channel) @extern("stop_channel");
extern fn void playNote(int noteID, int instrumentIndex, int channel) @extern("play_note");
extern fn void playFrequency(float frequency, int instrumentIndex, int channel) @extern("play_frequency");

// Data
extern fn int height() @extern("height");
extern fn int width() @extern("width");
extern fn int fps() @extern("fps");
extern fn int frameTime() @extern("frame_time");
extern fn int spriteSheetCount() @extern("sprite_sheet_count");
extern fn int paletteCount() @extern("palette_count");
extern fn int spriteHeight(int spriteSheet) @extern("sprite_height");
extern fn int spriteWidth(int spriteSheet) @extern("sprite_width");
extern fn int spriteCount(int spriteSheet) @extern("sprite_count");
extern fn int bgmLengthSecs(int bgmIndex) @extern("bgm_length_secs");
extern fn int bgmLengthFrames(int bgmIndex) @extern("bgm_length_frames");
extern fn int sfxLengthSecs(int sfxIndex) @extern("sfx_length_secs");
extern fn int sfxLengthFrames(int sfxIndex) @extern("sfx_length_frames");


// Graphics Params
extern fn int paletteIndex(int palette_index) @extern("palette_index");
extern fn int spriteSheetIndex(int spriteSheetIndex) @extern("sprite_sheet_index");
extern fn int spriteIndex(int spriteIndex) @extern("sprite_index");
extern fn int colorIndex(int colorIndex) @extern("color_index");
extern fn int flipX(int flipX) @extern("flip_x");
extern fn int flipY(int flipY) @extern("flip_y");
extern fn int graphicsParameters(int paletteIndex, int spriteSheetIndex, int spriteIndex, int colorIndex, int flipX, int flipY) @extname("graphics_parameters");

// Draw
extern fn void clearScreen(int graphicsParameters) @extern("clear_screen");
extern fn void setPixel(int graphicsParameters, int x, int y) @extern("set_pixel");
extern fn void circle(int graphicsParameters, int x, int y, int radius) @extern("circle");
extern fn void rect(int graphicsParameters, int x, int y, int width, int height) @extern("rect");
extern fn void rectFilled(int graphicsParameters, int x, int y, int width, int height) @extern("rect_filled");
extern fn void line(int graphicsParameters, int x0, int y0, int x1, int y1) @extern("line");
extern fn void sprite(int graphicsParameters, long transparencyMask, int x, int y) @extern("sprite");

// Text
extern fn void console_log(char* text, usz len);
macro void consoleLog(String text) => console_log(text, text.len);

// Random
extern fn void setSeed(int setSeed) @extern("set_seed");
extern fn int randomIntRange(int min, int max) @extern("random_int_range");
extern fn float randomFloat() @extern("random_float");
extern fn float randomFloatRange(float min, float max) @extern("random_float_range");

// Input
extern fn int buttonAPressed(int playerID) @extern("button_a_pressed");
extern fn int buttonAReleased (int playerID) @extern("button_a_released");
extern fn int buttonAHeld(int playerID) @extern("button_a_held");
extern fn int buttonBPressed(int playerID) @extern("button_b_pressed");
extern fn int buttonBReleased(int playerID) @extern("button_b_released");
extern fn int buttonBHeld(int playerID) @extern("button_b_held");
extern fn int buttonCPressed(int playerID) @extern("button_c_pressed");
extern fn int buttonCReleased(int playerID) @extern("button_c_released");
extern fn int buttonCHeld(int playerID) @extern("button_c_held");
extern fn int buttonDPressed(int playerID) @extern("button_d_pressed");
extern fn int buttonDReleased(int playerID) @extern("button_d_released");
extern fn int buttonDHeld(int playerID) @extern("button_d_held");
extern fn int buttonUpPressed(int playerID) @extern("button_up_pressed");
extern fn int buttonUpReleased(int playerID) @extern("button_up_released");
extern fn int buttonUpHeld(int playerID) @extern("button_up_held");
extern fn int buttonDownPressed(int playerID) @extern("button_down_pressed");
extern fn int buttonDownReleased(int playerID) @extern("button_down_released");
extern fn int buttonDownHeld(int playerID) @extern("button_down_held");
extern fn int buttonLeftPressed(int playerID) @extern("button_left_pressed");
extern fn int buttonLeftReleased(int playerID) @extern("button_left_released");
extern fn int buttonLeftHeld(int playerID) @extern("button_left_held");
extern fn int buttonRightPressed(int playerID) @extern("button_right_pressed");
extern fn int buttonRightReleased(int playerID) @extern("button_right_released");
extern fn int buttonRightHeld(int playerID) @extern("button_right_held");
extern fn int buttonStartPressed(int playerID) @extern("button_start_pressed");
extern fn int buttonStartReleased(int playerID) @extern("button_start_released");
extern fn int buttonStartHeld(int playerID) @extern("button_start_held");
extern fn int buttonSelectPressed(int playerID) @extern("button_select_pressed");
extern fn int buttonSelectReleased(int playerID) @extern("button_select_released");
extern fn int buttonSelectHeld(int playerID) @extern("button_select_held");
extern fn int buttonLeftShoulderPressed(int playerID) @extern("button_left_shoulder_pressed");
extern fn int buttonLeftShoulderReleased(int playerID) @extern("button_left_shoulder_released");
extern fn int buttonLeftShoulder_Held(int playerID) @extern("button_left_shoulder_held");
extern fn int buttonRightShoulderPressed(int playerID) @extern("button_right_shoulder_pressed");
extern fn int buttonRightShoulderHeld(int playerID) @extern("button_right_shoulder_held");
extern fn int buttonLeftStickPressed(int playerID) @extern("button_left_stick_pressed");
extern fn int buttonLeftStickReleased(int playerID) @extern("button_left_stick_released");
extern fn int buttonLeftStickHeld(int playerID) @extern("button_left_stick_held");
extern fn int buttonRightStickPressed(int playerID) @extern("button_right_stick_pressed");
extern fn int buttonRightStickReleased(int playerID) @extern("button_right_stick_released");
extern fn int buttonRightStickHeld(int playerID) @extern("button_right_stick_held");
extern fn int buttonLeftTriggerPressed(int playerID) @extern("button_left_trigger_pressed");
extern fn int buttonLeftTriggerReleased(int playerID) @extern("button_left_trigger_released");
extern fn int buttonLeftTriggerHeld(int playerID) @extern("button_left_trigger_held");
extern fn int buttonRightTriggerPressed(int playerID) @extern("button_right_trigger_pressed");
extern fn int buttonRightTriggerPeleased(int playerID) @extern("button_right_trigger_released");
extern fn int buttonRightTriggerHeld(int playerID) @extern("button_right_trigger_held");
extern fn int analogLeftX(int playerID) @extern("analog_left_x");
extern fn int analogLeftY(int playerID) @extern("analog_left_y");
extern fn int analogRightX(int playerID) @extern("analog_right_x");
extern fn int analogRightY(int playerID) @extern("analog_right_y");
extern fn int triggerLeft(int playerID) @extern("trigger_left");
extern fn int triggerRight(int playerID) @extern("trigger_right");
extern fn int rawInputState(int playerID) @extern("raw_input_state");

// Multiplayer
extern fn int numPlayers() @extern("num_players");

extern fn int isLocalPlayer(int playerID) @extern("is_local_player");
extern fn int isRemotePlayer(int playerID) @extern("is_remote_player");
