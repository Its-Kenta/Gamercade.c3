module gamercade::gc;

// Audio
extern fn void play_bgm(int bgm_index) @wasm;
extern fn void play_sfx(int sfx_index, int channel) @wasm;
extern fn void stop_bgm() @wasm;
extern fn void stop_channel(int channel) @wasm;
extern fn void play_note(int note_id, int instrument_index, int channel) @wasm;
extern fn void play_frequency(float frequency, int instrument_index, int channel) @wasm;

// Data
extern fn int height() @wasm;
extern fn int width() @wasm;
extern fn int fps() @wasm;
extern fn int frame_time() @wasm;
extern fn int sprite_sheet_count() @wasm;
extern fn int palette_count() @wasm;
extern fn int sprite_height(int sprite_sheet) @wasm;
extern fn int sprite_width(int sprite_sheet) @wasm;
extern fn int sprite_count(int sprite_sheet) @wasm;
extern fn int bgm_length_secs(int bgm_index) @wasm;
extern fn int bgm_length_frames(int bgm_index) @wasm;
extern fn int sfx_length_secs(int sfx_index) @wasm;
extern fn int sfx_length_frames(int sfx_index) @wasm;


// Graphics Params
extern fn int palette_index(int palette_index) @wasm;
extern fn int sprite_sheet_index(int sprite_sheet_index) @wasm;
extern fn int sprite_index(int sprite_index) @wasm;
extern fn int color_index(int colorIndex) @wasm;
extern fn int flipX(int flip_x) @wasm;
extern fn int flipY(int flip_y) @wasm;
extern fn int graphics_parameters(int palette_index, int sprite_sheet_index, int sprite_index, int color_index, int flip_x, int flip_y) @wasm;

// Draw
extern fn void clear_screen(int graphics_parameters) @wasm;
extern fn void set_pixel(int graphics_parameters, int x, int y) @wasm;
extern fn void circle(int graphics_parameters, int x, int y, int radius) @wasm;
extern fn void rect(int graphics_parameters, int x, int y, int width, int height) @wasm;
extern fn void rect_filled(int graphics_parameters, int x, int y, int width, int height) @wasm;
extern fn void line(int graphics_parameters, int x0, int y0, int x1, int y1) @wasm;
extern fn void sprite(int graphics_parameters, long transparency_mask, int x, int y) @wasm;

// Text
extern fn void console_log(char* text, usz len) @wasm;
macro void console_log_string(String text) => console_log(text, text.len); // Helper function to simply pass string.
extern fn void console_log_utf16(char* text, usz len) @wasm;
macro void console_log_utf16_string(String text) => console_log_utf16(text, text.len); // Helper function to simply pass string.

// Random
extern fn void set_seed(int set_seed) @wasm;
extern fn int random_int_range(int min, int max) @wasm;
extern fn float random_float() @wasm;
extern fn float random_float_range(float min, float max) @wasm;

// Input
extern fn int button_a_pressed(int player_id) @wasm;
extern fn int button_a_released (int player_id) @wasm;
extern fn int button_a_held(int player_id) @wasm;
extern fn int button_b_pressed(int player_id) @wasm;
extern fn int button_b_released(int player_id) @wasm;
extern fn int button_b_held(int player_id) @wasm;
extern fn int button_c_pressed(int player_id) @wasm;
extern fn int button_c_released(int player_id) @wasm;
extern fn int button_c_held(int player_id) @wasm;
extern fn int button_d_pressed(int player_id) @wasm;
extern fn int button_d_released(int player_id) @wasm;
extern fn int button_d_held(int player_id) @wasm;
extern fn int button_up_pressed(int player_id) @wasm;
extern fn int button_up_released(int player_id) @wasm;
extern fn int button_up_held(int player_id) @wasm;
extern fn int button_down_pressed(int player_id) @wasm;
extern fn int button_down_released(int player_id) @wasm;
extern fn int button_down_held(int player_id) @wasm;
extern fn int button_left_pressed(int player_id) @wasm;
extern fn int button_left_released(int player_id) @wasm;
extern fn int button_left_held(int player_id) @wasm;
extern fn int button_right_pressed(int player_id) @wasm;
extern fn int button_right_released(int player_id) @wasm;
extern fn int button_right_held(int player_id) @wasm;
extern fn int button_start_pressed(int player_id) @wasm;
extern fn int button_start_released(int player_id) @wasm;
extern fn int button_start_held(int player_id) @wasm;
extern fn int button_select_pressed(int player_id) @wasm;
extern fn int button_select_released(int player_id) @wasm;
extern fn int button_select_held(int player_id) @wasm;
extern fn int button_left_shoulder_pressed(int player_id) @wasm;
extern fn int button_left_shoulder_released(int player_id) @wasm;
extern fn int button_left_shoulder_held(int player_id) @wasm;
extern fn int button_right_shoulder_pressed(int player_id) @wasm;
extern fn int button_right_shoulder_held(int player_id) @wasm;
extern fn int button_left_stick_pressed(int player_id) @wasm;
extern fn int button_left_stick_released(int player_id) @wasm;
extern fn int button_left_stick_held(int player_id) @wasm;
extern fn int button_right_stick_pressed(int player_id) @wasm;
extern fn int button_right_stick_released(int player_id) @wasm;
extern fn int button_right_stick_held(int player_id) @wasm;
extern fn int button_left_trigger_pressed(int player_id) @wasm;
extern fn int button_left_trigger_released(int player_id) @wasm;
extern fn int button_left_trigger_held(int player_id) @wasm;
extern fn int button_right_trigger_pressed(int player_id) @wasm;
extern fn int button_right_trigger_released(int player_id) @wasm;
extern fn int button_right_trigger_held(int player_id) @wasm;
extern fn int analog_left_x(int player_id) @wasm;
extern fn int analog_left_y(int player_id) @wasm;
extern fn int analog_right_x(int player_id) @wasm;
extern fn int analog_right_y(int player_id) @wasm;
extern fn int trigger_left(int player_id) @wasm;
extern fn int trigger_right(int player_id) @wasm;
extern fn int raw_input_state(int player_id) @wasm;

// Multiplayer
extern fn int num_players() @wasm;

extern fn int is_local_player(int player_id) @wasm;
extern fn int is_remote_player(int player_id)  @wasm;