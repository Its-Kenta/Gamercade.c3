module gamercade;

// Audio
extern fn void playBgm(int bgmIndex) @extern("play_bgm") @wasm;
extern fn void playSfx(int sfxIndex, int channel) @extern("play_sfx") @wasm;
extern fn void stopBgm() @extern("stop_bgm") @wasm;
extern fn void stopChannel(int channel) @extern("stop_channel") @wasm;
extern fn void playNote(int noteID, int instrumentIndex, int channel) @extern("play_note") @wasm;
extern fn void playFrequency(float frequency, int instrumentIndex, int channel) @extern("play_frequency") @wasm;

// Data
extern fn int height() @extern("height") @wasm;
extern fn int width() @extern("width") @wasm;
extern fn int fps() @extern("fps") @wasm;
extern fn int frameTime() @extern("frame_time") @wasm;
extern fn int spriteSheetCount() @extern("sprite_sheet_count") @wasm;
extern fn int paletteCount() @extern("palette_count") @wasm;
extern fn int spriteHeight(int spriteSheet) @extern("sprite_height") @wasm;
extern fn int spriteWidth(int spriteSheet) @extern("sprite_width") @wasm;
extern fn int spriteCount(int spriteSheet) @extern("sprite_count") @wasm;
extern fn int bgmLengthSecs(int bgmIndex) @extern("bgm_length_secs") @wasm;
extern fn int bgmLengthFrames(int bgmIndex) @extern("bgm_length_frames") @wasm;
extern fn int sfxLengthSecs(int sfxIndex) @extern("sfx_length_secs") @wasm;
extern fn int sfxLengthFrames(int sfxIndex) @extern("sfx_length_frames") @wasm;


// Graphics Params
extern fn int paletteIndex(int palette_index) @extern("palette_index") @wasm;
extern fn int spriteSheetIndex(int spriteSheetIndex) @extern("sprite_sheet_index") @wasm;
extern fn int spriteIndex(int spriteIndex) @extern("sprite_index") @wasm;
extern fn int colorIndex(int colorIndex) @extern("color_index") @wasm;
extern fn int flipX(int flipX) @extern("flip_x") @wasm;
extern fn int flipY(int flipY) @extern("flip_y") @wasm;
extern fn int graphicsParameters(int paletteIndex, int spriteSheetIndex, int spriteIndex, int colorIndex, int flipX, int flipY) @extname("graphics_parameters") @wasm;

// Draw
extern fn void clearScreen(int graphicsParameters) @extern("clear_screen") @wasm;
extern fn void setPixel(int graphicsParameters, int x, int y) @extern("set_pixel") @wasm;
extern fn void circle(int graphicsParameters, int x, int y, int radius) @extern("circle") @wasm;
extern fn void rect(int graphicsParameters, int x, int y, int width, int height) @extern("rect") @wasm;
extern fn void rectFilled(int graphicsParameters, int x, int y, int width, int height) @extern("rect_filled") @wasm;
extern fn void line(int graphicsParameters, int x0, int y0, int x1, int y1) @extern("line") @wasm;
extern fn void sprite(int graphicsParameters, long transparencyMask, int x, int y) @extern("sprite") @wasm;

// Text
extern fn void console_log(char* text, usz len) @wasm;
extern macro void consoleLog(String text) => console_log(text, text.len);

// Random
extern fn void setSeed(int setSeed) @extern("set_seed") @wasm;
extern fn int randomIntRange(int min, int max) @extern("random_int_range") @wasm;
extern fn float randomFloat() @extern("random_float") @wasm;
extern fn float randomFloatRange(float min, float max) @extern("random_float_range") @wasm;

// Input
extern fn int buttonAPressed(int playerID) @extern("button_a_pressed") @wasm;
extern fn int buttonAReleased (int playerID) @extern("button_a_released") @wasm;
extern fn int buttonAHeld(int playerID) @extern("button_a_held") @wasm;
extern fn int buttonBPressed(int playerID) @extern("button_b_pressed") @wasm;
extern fn int buttonBReleased(int playerID) @extern("button_b_released") @wasm;
extern fn int buttonBHeld(int playerID) @extern("button_b_held") @wasm;
extern fn int buttonCPressed(int playerID) @extern("button_c_pressed") @wasm;
extern fn int buttonCReleased(int playerID) @extern("button_c_released") @wasm;
extern fn int buttonCHeld(int playerID) @extern("button_c_held") @wasm;
extern fn int buttonDPressed(int playerID) @extern("button_d_pressed") @wasm;
extern fn int buttonDReleased(int playerID) @extern("button_d_released") @wasm;
extern fn int buttonDHeld(int playerID) @extern("button_d_held") @wasm;
extern fn int buttonUpPressed(int playerID) @extern("button_up_pressed") @wasm;
extern fn int buttonUpReleased(int playerID) @extern("button_up_released") @wasm;
extern fn int buttonUpHeld(int playerID) @extern("button_up_held") @wasm;
extern fn int buttonDownPressed(int playerID) @extern("button_down_pressed") @wasm;
extern fn int buttonDownReleased(int playerID) @extern("button_down_released") @wasm;
extern fn int buttonDownHeld(int playerID) @extern("button_down_held") @wasm;
extern fn int buttonLeftPressed(int playerID) @extern("button_left_pressed") @wasm;
extern fn int buttonLeftReleased(int playerID) @extern("button_left_released") @wasm;
extern fn int buttonLeftHeld(int playerID) @extern("button_left_held") @wasm;
extern fn int buttonRightPressed(int playerID) @extern("button_right_pressed") @wasm;
extern fn int buttonRightReleased(int playerID) @extern("button_right_released") @wasm;
extern fn int buttonRightHeld(int playerID) @extern("button_right_held") @wasm;
extern fn int buttonStartPressed(int playerID) @extern("button_start_pressed") @wasm;
extern fn int buttonStartReleased(int playerID) @extern("button_start_released") @wasm;
extern fn int buttonStartHeld(int playerID) @extern("button_start_held") @wasm;
extern fn int buttonSelectPressed(int playerID) @extern("button_select_pressed") @wasm;
extern fn int buttonSelectReleased(int playerID) @extern("button_select_released") @wasm;
extern fn int buttonSelectHeld(int playerID) @extern("button_select_held") @wasm;
extern fn int buttonLeftShoulderPressed(int playerID) @extern("button_left_shoulder_pressed") @wasm;
extern fn int buttonLeftShoulderReleased(int playerID) @extern("button_left_shoulder_released") @wasm;
extern fn int buttonLeftShoulder_Held(int playerID) @extern("button_left_shoulder_held") @wasm;
extern fn int buttonRightShoulderPressed(int playerID) @extern("button_right_shoulder_pressed") @wasm;
extern fn int buttonRightShoulderHeld(int playerID) @extern("button_right_shoulder_held") @wasm;
extern fn int buttonLeftStickPressed(int playerID) @extern("button_left_stick_pressed") @wasm;
extern fn int buttonLeftStickReleased(int playerID) @extern("button_left_stick_released") @wasm;
extern fn int buttonLeftStickHeld(int playerID) @extern("button_left_stick_held") @wasm;
extern fn int buttonRightStickPressed(int playerID) @extern("button_right_stick_pressed") @wasm;
extern fn int buttonRightStickReleased(int playerID) @extern("button_right_stick_released") @wasm;
extern fn int buttonRightStickHeld(int playerID) @extern("button_right_stick_held") @wasm;
extern fn int buttonLeftTriggerPressed(int playerID) @extern("button_left_trigger_pressed") @wasm;
extern fn int buttonLeftTriggerReleased(int playerID) @extern("button_left_trigger_released") @wasm;
extern fn int buttonLeftTriggerHeld(int playerID) @extern("button_left_trigger_held") @wasm;
extern fn int buttonRightTriggerPressed(int playerID) @extern("button_right_trigger_pressed") @wasm;
extern fn int buttonRightTriggerPeleased(int playerID) @extern("button_right_trigger_released") @wasm;
extern fn int buttonRightTriggerHeld(int playerID) @extern("button_right_trigger_held") @wasm;
extern fn int analogLeftX(int playerID) @extern("analog_left_x") @wasm;
extern fn int analogLeftY(int playerID) @extern("analog_left_y") @wasm;
extern fn int analogRightX(int playerID) @extern("analog_right_x") @wasm;
extern fn int analogRightY(int playerID) @extern("analog_right_y") @wasm;
extern fn int triggerLeft(int playerID) @extern("trigger_left") @wasm;
extern fn int triggerRight(int playerID) @extern("trigger_right") @wasm;
extern fn int rawInputState(int playerID) @extern("raw_input_state") @wasm;

// Multiplayer
extern fn int numPlayers() @extern("num_players") @wasm;

extern fn int isLocalPlayer(int playerID) @extern("is_local_player") @wasm;
extern fn int isRemotePlayer(int playerID) @extern("is_remote_player") @wasm;