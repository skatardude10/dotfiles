#include "amj40.h"

// Each layer gets a name for readability, which is then used in the keymap matrix below.
// The underscores don't mean anything - you can have a layer called STUFF or any other name.
// Layer names don't all need to be of the same length, obviously, and you can also skip them
// entirely and just use numbers.
#define _QWERTY 0
#define _LOWER 1
#define _RAISE 2
#define _ADJUST 3

enum custom_keycodes {
  QWERTY = SAFE_RANGE,
  LOWER,
  RAISE,
  ADJUST,
};

// increase readability 
#define _______ KC_TRNS
#define XXXXXXX KC_NO

const uint16_t PROGMEM keymaps[][MATRIX_ROWS][MATRIX_COLS] = {

    [_QWERTY] = KEYMAP( \
        KC_ESC,  KC_Q,   KC_W,   KC_E,   KC_R,   KC_T,   KC_Y,   KC_U,   KC_I,    KC_O,    KC_P,   KC_BSPC,\
        KC_TAB,  KC_A,   KC_S,   KC_D,   KC_F,   KC_G,   KC_H,   KC_J,   KC_K,    KC_L,    KC_ENT,\
        KC_LSFT, KC_Z,   KC_X,   KC_C,   KC_V,   KC_B,   KC_N,   KC_M,   KC_COMM, KC_DOT,  KC_RSFT,\
        KC_LCTL, KC_LALT, KC_LGUI,          F(0),           F(1),        F(2), RALT(KC_GRAVE), KC_RCTL \
		),

    [_LOWER] = KEYMAP( \
        KC_F1, KC_F2, KC_F3, KC_F4, KC_F5, KC_F6, KC_F7, KC_F8, KC_F9, KC_F10, KC_F11, KC_F12, \
		KC_1, KC_2, KC_3, KC_4, KC_5, KC_6, KC_7, KC_8, KC_9, KC_0, KC_MINUS, \
		_______, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, KC_QUOTE, KC_SLASH, KC_LBRACKET, KC_RBRACKET, KC_BSLASH, KC_EQUAL, \
		_______, _______, _______, _______, _______, _______, _______, _______ \
		),
	
    [_RAISE] = KEYMAP( \
        KC_GRAVE, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, KC_PGDOWN, KC_UP, KC_PGUP, KC_PSCREEN, KC_DEL, \
		_______, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, KC_HOME, KC_LEFT, KC_DOWN, KC_RIGHT, KC_SCOLON, \
		_______, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, KC_END, XXXXXXX, XXXXXXX, XXXXXXX, _______, \
		_______, _______, _______, _______, _______, _______, _______, _______ \
		),
	
    [_ADJUST] = KEYMAP( \
        RGB_TOG, KC_WH_L, KC_MS_U, KC_WH_R, RGB_MOD, RGB_HUI, RGB_HUD, RGB_SAI, RGB_SAD, RGB_VAI, RGB_VAD, KC_PAUS, \
		KC_BTN3, KC_MS_L, KC_MS_D, KC_MS_R, KC_WH_U, XXXXXXX, XXXXXXX, KC_PGUP, KC_PGDOWN, XXXXXXX,  XXXXXXX,  \
		KC_LGUI, XXXXXXX, XXXXXXX, KC_WH_D,  XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, BL_TOGG, BL_INC, \
		_______, _______, _______, KC_BTN1, KC_BTN2, _______, BL_TOGG, BL_DEC \
		),

};

enum function_id {
    LAUNCH,
    RGBLED_TOGGLE,
};

const uint16_t PROGMEM fn_actions[] = {
	[0]  = ACTION_LAYER_TAP_KEY(_LOWER, KC_SPC),
	[1]  = ACTION_LAYER_TAP_KEY(_RAISE, KC_SPC),
	[2]  = ACTION_LAYER_TAP_KEY(_ADJUST, XXXXXXX),

};

const macro_t *action_get_macro(keyrecord_t *record, uint8_t id, uint8_t opt)
{
    // MACRODOWN only works in this function
   
    return MACRO_NONE;
};

bool process_record_user(uint16_t keycode, keyrecord_t *record) {
 
  switch (keycode) {
    
    case LOWER:
      if (record->event.pressed) {
        layer_on(_LOWER);
        update_tri_layer(_LOWER, _RAISE, _ADJUST);
      } else {
        layer_off(_LOWER);
        update_tri_layer(_LOWER, _RAISE, _ADJUST);
      }
      return false;
      break;
    case RAISE:
      if (record->event.pressed) {
        layer_on(_RAISE);
        update_tri_layer(_LOWER, _RAISE, _ADJUST);
      } else {
        layer_off(_RAISE);
        update_tri_layer(_LOWER, _RAISE, _ADJUST);
      }
      return false;
      break;
    case ADJUST:
      if (record->event.pressed) {
        layer_on(_ADJUST);
      } else {
        layer_off(_ADJUST);
      }
      return false;
      break;
  }
  return true;
}
