module gamercade::gc;

// Audio
extern fn void play_bgm(int bgm_index) @extern("play_bgm");
extern fn void play_sfx(int sfx_index, int channel) @extern("play_sfx");
extern fn void stop_bgm() @extern("stop_bgm");
extern fn void stop_channel(int channel) @extern("stop_channel");
extern fn void play_note(int note_id, int instrument_index, int channel) @extern("play_note");
extern fn void play_frequency(float frequency, int instrument_index, int channel) @extern("play_frequency");

// Data
extern fn int height() @extern("height");
extern fn int width() @extern("width");
extern fn int fps() @extern("fps");
extern fn int frame_time() @extern("frame_time");
extern fn int sprite_sheet_count() @extern("sprite_sheet_count");
extern fn int palette_count() @extern("palette_count");
extern fn int sprite_height(int sprite_sheet) @extern("sprite_height");
extern fn int sprite_width(int sprite_sheet) @extern("sprite_width");
extern fn int sprite_count(int sprite_sheet) @extern("sprite_count");
extern fn int bgm_length_secs(int bgm_index) @extern("bgm_length_secs");
extern fn int bgm_length_frames(int bgm_index) @extern("bgm_length_frames");
extern fn int sfx_length_secs(int sfx_index) @extern("sfx_length_secs");
extern fn int sfx_length_frames(int sfx_index) @extern("sfx_length_frames");


// Graphics Params
extern fn int palette_index(int palette_index) @extern("palette_index");
extern fn int sprite_sheet_index(int sprite_sheet_index) @extern("sprite_sheet_index");
extern fn int sprite_index(int sprite_index) @extern("sprite_index");
extern fn int color_index(int colorIndex) @extern("color_index");
extern fn int flipX(int flip_x) @extern("flip_x");
extern fn int flipY(int flip_y) @extern("flip_y");
extern fn int graphics_parameters(int palette_index, int sprite_sheet_index, int sprite_index, int color_index, int flip_x, int flip_y) @extern("graphics_parameters");

// Draw
extern fn void clear_screen(int graphics_parameters) @extern("clear_screen");
extern fn void set_pixel(int graphics_parameters, int x, int y) @extern("set_pixel");
extern fn void circle(int graphics_parameters, int x, int y, int radius) @extern("circle");
extern fn void rect(int graphics_parameters, int x, int y, int width, int height) @extern("rect");
extern fn void rect_filled(int graphics_parameters, int x, int y, int width, int height) @extern("rect_filled");
extern fn void line(int graphics_parameters, int x0, int y0, int x1, int y1) @extern("line");
extern fn void sprite(int graphics_parameters, long transparency_mask, int x, int y) @extern("sprite");

// Text
extern fn void console_log(char* text, usz len) @extern("console_log");
macro void console_log_string(String text) => console_log(text, text.len); // Helper function to simply pass string.
extern fn void console_log_utf16(char* text, usz len) @extern("console_log_utf16");
macro void console_log_utf16_string(String text) => console_log_utf16(text, text.len); // Helper function to simply pass string.

// Random
extern fn void set_seed(int set_seed) @extern("set_seed");
extern fn int random_int_range(int min, int max) @extern("random_int_range");
extern fn float random_float() @extern("random_float");
extern fn float random_float_range(float min, float max) @extern("random_float_range");

// Input
extern fn int button_a_pressed(int player_id) @extern("button_a_pressed");
extern fn int button_a_released (int player_id) @extern("button_a_released");
extern fn int button_a_held(int player_id) @extern("button_a_held");
extern fn int button_b_pressed(int player_id) @extern("button_b_pressed");
extern fn int button_b_released(int player_id) @extern("button_b_released");
extern fn int button_b_held(int player_id) @extern("button_b_held");
extern fn int button_c_pressed(int player_id) @extern("button_c_pressed");
extern fn int button_c_released(int player_id) @extern("button_c_released");
extern fn int button_c_held(int player_id) @extern("button_c_held");
extern fn int button_d_pressed(int player_id) @extern("button_d_pressed");
extern fn int button_d_released(int player_id) @extern("button_d_released");
extern fn int button_d_held(int player_id) @extern("button_d_held");
extern fn int button_up_pressed(int player_id) @extern("button_up_pressed");
extern fn int button_up_released(int player_id) @extern("button_up_released");
extern fn int button_up_held(int player_id) @extern("button_up_held");
extern fn int button_down_pressed(int player_id) @extern("button_down_pressed");
extern fn int button_down_released(int player_id) @extern("button_down_released");
extern fn int button_down_held(int player_id) @extern("button_down_held");
extern fn int button_left_pressed(int player_id) @extern("button_left_pressed");
extern fn int button_left_released(int player_id) @extern("button_left_released");
extern fn int button_left_held(int player_id) @extern("button_left_held");
extern fn int button_right_pressed(int player_id) @extern("button_right_pressed");
extern fn int button_right_released(int player_id) @extern("button_right_released");
extern fn int button_right_held(int player_id) @extern("button_right_held");
extern fn int button_start_pressed(int player_id) @extern("button_start_pressed");
extern fn int button_start_released(int player_id) @extern("button_start_released");
extern fn int button_start_held(int player_id) @extern("button_start_held");
extern fn int button_select_pressed(int player_id) @extern("button_select_pressed");
extern fn int button_select_released(int player_id) @extern("button_select_released");
extern fn int button_select_held(int player_id) @extern("button_select_held");
extern fn int button_left_shoulder_pressed(int player_id) @extern("button_left_shoulder_pressed");
extern fn int button_left_shoulder_released(int player_id) @extern("button_left_shoulder_released");
extern fn int button_left_shoulder_held(int player_id) @extern("button_left_shoulder_held");
extern fn int button_right_shoulder_pressed(int player_id) @extern("button_right_shoulder_pressed");
extern fn int button_right_shoulder_held(int player_id) @extern("button_right_shoulder_held");
extern fn int button_left_stick_pressed(int player_id) @extern("button_left_stick_pressed");
extern fn int button_left_stick_released(int player_id) @extern("button_left_stick_released");
extern fn int button_left_stick_held(int player_id) @extern("button_left_stick_held");
extern fn int button_right_stick_pressed(int player_id) @extern("button_right_stick_pressed");
extern fn int button_right_stick_released(int player_id) @extern("button_right_stick_released");
extern fn int button_right_stick_held(int player_id) @extern("button_right_stick_held");
extern fn int button_left_trigger_pressed(int player_id) @extern("button_left_trigger_pressed");
extern fn int button_left_trigger_released(int player_id) @extern("button_left_trigger_released");
extern fn int button_left_trigger_held(int player_id) @extern("button_left_trigger_held");
extern fn int button_right_trigger_pressed(int player_id) @extern("button_right_trigger_pressed");
extern fn int button_right_trigger_released(int player_id) @extern("button_right_trigger_released");
extern fn int button_right_trigger_held(int player_id) @extern("button_right_trigger_held");
extern fn int analog_left_x(int player_id) @extern("analog_left_x");
extern fn int analog_left_y(int player_id) @extern("analog_left_y");
extern fn int analog_right_x(int player_id) @extern("analog_right_x");
extern fn int analog_right_y(int player_id) @extern("analog_right_y");
extern fn int trigger_left(int player_id) @extern("trigger_left");
extern fn int trigger_right(int player_id) @extern("trigger_right");
extern fn int raw_input_state(int player_id) @extern("raw_input_state");

// Multiplayer
extern fn int num_players() @extern("num_players");

extern fn int is_local_player(int player_id) @extern("is_local_player");
extern fn int is_remote_player(int player_id) @extern("is_remote_player");