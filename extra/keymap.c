#include "lets_split.h"
#include "action_layer.h"
#include "eeconfig.h"
#include "keymap_nordic.h"

extern keymap_config_t keymap_config;

// Each layer gets a name for readability, which is then used in the keymap matrix below.
// The underscores don't mean anything - you can have a layer called STUFF or any other name.
// Layer names don't all need to be of the same length, obviously, and you can also skip them
// entirely and just use numbers.
#define _QWERTY 0
#define _COLEMAK 1
#define _DVORAK 2
#define _LOWER 3
#define _RAISE 4
#define _ADJUST 16



enum custom_keycodes {
  QWERTY = SAFE_RANGE,
  COLEMAK,
  DVORAK,
  LOWER,
  RAISE,
  ADJUST,
};

enum {
  TD_MSK = 0,
  TD_ENG = 1,
  TD_CAPS = 2,
};


// Fillers to make layering more clear
#define _______ KC_TRNS
#define XXXXXXX KC_NO
#define KC_X0 LT(_COLEMAK, KC_ESC)
#define KC_X2 TO(_LOWER)
#define KC_X3 LALT(LCTL(KC_Y))
#define KC_X4 LALT(LCTL(KC_U))
#define KC_X5 LALT(LCTL(KC_I))
#define KC_X6 LALT(LCTL(KC_O))
#define KC_X7 LALT(LCTL(KC_P))
#define KC_X8 LALT(LCTL(KC_LBRC))
#define KC_X9 LALT(LCTL(KC_H))
#define KC_X10 LALT(LCTL(KC_J))
#define KC_X11 LALT(LCTL(KC_K))
#define KC_X12 LALT(LCTL(KC_L))
#define KC_X13 LALT(LCTL(KC_SCLN))
#define KC_X14 LALT(LCTL(KC_QUOT))
#define KC_X15 LALT(LCTL(KC_N))
#define KC_X16 LALT(LCTL(KC_M))
#define KC_X17 LALT(LCTL(KC_COMM))
#define KC_X18 LALT(LCTL(KC_DOT))
#define KC_X19 LALT(LCTL(KC_SLSH))


const uint16_t PROGMEM keymaps[][MATRIX_ROWS][MATRIX_COLS] = {

/* Qwerty
 * ,-----------------------------------------------------------------------------------.
 * | Tab  |   Q  |   W  |   E  |   R  |   T  |   Y  |   U  |   I  |   O  |   P  |  Å   |
 * |------+------+------+------+------+-------------+------+------+------+------+------|
 * |  Esc |   A  |   S  |   D  |   F  |   G  |   H  |   J  |   K  |   L  |   Ö  |  Ä   |
 * |------+------+------+------+------+------|------+------+------+------+------+------|
 * | Shift|   Z  |   X  |   C  |   V  |   B  |   N  |   M  |   ,  |   .  |   /  | Del  |
 * |------+------+------+------+------+------+------+------+------+------+------+------|
 * | Ctrl | GUI  | Next |  Alt |Lower |BSPC  |Space |Raise |AltGr | Play |Lower |Enter |
 * `-----------------------------------------------------------------------------------'
 */
[_QWERTY] = KEYMAP( \
  KC_TAB,  KC_Q,    KC_W,    KC_E,    KC_R,    KC_T,    KC_Y,    KC_U,    KC_I,    KC_O,    KC_P,    KC_LBRC, \
  KC_X0,  KC_A,    KC_S,    KC_D,    KC_F,    KC_G,    KC_H,    KC_J,    KC_K,    KC_L,    KC_SCLN, KC_QUOT, \
  TD(TD_CAPS), KC_Z,    KC_X,    KC_C,    KC_V,    KC_B,    KC_N,    KC_M,    KC_COMM, KC_DOT,  KC_SLSH, KC_DEL , \
  KC_LCTL, KC_LGUI, TD(TD_MSK), KC_LALT,  LOWER,   KC_BSPC,  KC_SPC,  RAISE,   KC_RALT, TD(TD_ENG), KC_X2,   KC_ENT \
),

/* Colemak
 * ,-----------------------------------------------------------------------------------.
 * |  Tab | PGUP |  UP  | PGDN | HOME |PrtScr|      |      |      |      |      |      |
 * |------+------+------+------+------+-------------+------+------+------+------+------|
 * |      | LEFT | DOWN | RGHT | END  |      |      |      |      |      |      |      |
 * |------+------+------+------+------+------|------+------+------+------+------+------|
 * | Shift| VOLD | VOLU | MUTE |      |Reset |      |      |      |      |      |      |
 * |------+------+------+------+------+------+------+------+------+------+------+------|
 * | Ctrl | GUI  | Next |  Alt |Lower |      |      |Raise |      |      |      |      |
 * `-----------------------------------------------------------------------------------'
 */
[_COLEMAK] = KEYMAP( \
  KC_TAB, KC_PGUP, KC_UP, KC_PGDN, KC_HOME, KC_PSCR, KC_X3, KC_X4, KC_X5, KC_X6, KC_X7, KC_X8, \
  _______, KC_LEFT,   KC_DOWN,   KC_RGHT, KC_END, _______, KC_X9, KC_X10, KC_X11, KC_X12, KC_X13, KC_X14, \
  TD(TD_CAPS), KC_VOLD, KC_VOLU, KC_MUTE, _______, RESET, KC_X15, KC_X16, KC_X17, KC_X18, KC_X19, _______, \
  KC_LCTL, KC_LGUI, TD(TD_MSK), KC_LALT, LOWER, _______, _______, RAISE, _______, _______, _______, _______ \
),

/* Dvorak
 * ,-----------------------------------------------------------------------------------.
 * | Tab  |   "  |   ,  |   .  |   P  |   Y  |   F  |   G  |   C  |   R  |   L  | Bksp |
 * |------+------+------+------+------+-------------+------+------+------+------+------|
 * | Esc  |   A  |   O  |   E  |   U  |   I  |   D  |   H  |   T  |   N  |   S  |  /   |
 * |------+------+------+------+------+------|------+------+------+------+------+------|
 * | Shift|   ;  |   Q  |   J  |   K  |   X  |   B  |   M  |   W  |   V  |   Z  |Enter |
 * |------+------+------+------+------+------+------+------+------+------+------+------|
 * |Adjust| Ctrl | Alt  | GUI  |Lower |Space |Space |Raise | Left | Down |  Up  |Right |
 * `-----------------------------------------------------------------------------------'
 */
[_DVORAK] = KEYMAP( \
  KC_TAB,  KC_QUOT, KC_COMM, KC_DOT,  KC_P,    KC_Y,    KC_F,    KC_G,    KC_C,    KC_R,    KC_L,    KC_BSPC, \
  KC_ESC,  KC_A,    KC_O,    KC_E,    KC_U,    KC_I,    KC_D,    KC_H,    KC_T,    KC_N,    KC_S,    KC_SLSH, \
  KC_LSFT, KC_SCLN, KC_Q,    KC_J,    KC_K,    KC_X,    KC_B,    KC_M,    KC_W,    KC_V,    KC_Z,    KC_ENT , \
  ADJUST,  KC_LCTL, KC_LALT, KC_LGUI, LOWER,   KC_SPC,  KC_SPC,  RAISE,   KC_LEFT, KC_DOWN, KC_UP,   KC_RGHT \
),

/* Lower
 * ,-----------------------------------------------------------------------------------.
 * |  @   |   1  |   2  |   3  |   4  |   5  |   6  |   7  |   8  |   9  |   0  |  ?   |
 * |------+------+------+------+------+-------------+------+------+------+------+------|
 * | Del  | VOLD |  UP  | VOLU | PGUP | HOME |   +  |   4  |   5  |   6  |   +  |  -   |
 * |------+------+------+------+------+------|------+------+------+------+------+------|
 * | Shift| LEFT | DOWN | RGHT | PGDN |  END |   \  |   1  |   2  |   3  |   *  |  /   |
 * |------+------+------+------+------+------+------+------+------+------+------+------|
 * | Ctrl | GUI  | Play |  Alt |Lower |             |Raise |   0  |   ,  |AltGr |Enter  
 * `-----------------------------------------------------------------------------------'
 */
[_LOWER] = KEYMAP( \
  NO_AT, KC_1,    KC_2,    KC_3,    KC_4,    KC_5,    KC_6,    KC_7,    KC_8,    KC_9,    KC_0,    KC_UNDS, \
  KC_DEL,  KC_VOLD,   KC_UP,   KC_VOLU,   KC_PGUP,   KC_HOME,   KC_PPLS, KC_4, KC_5, KC_6 , KC_PPLS, KC_PMNS,  \
  TD(TD_CAPS), KC_LEFT,   KC_DOWN,   KC_RGHT,   KC_PGDN,  KC_END, KC_BSLS, KC_1, KC_2, KC_3 , KC_PAST, KC_PSLS, \
  KC_LCTL, KC_LGUI, KC_MPLY, KC_LALT, LOWER, _______, _______, RAISE,  KC_0, KC_COMM, KC_RALT, KC_ENT \
),

/* Raise
 * ,-----------------------------------------------------------------------------------.
 * |   §  |   !  |   "  |   #  |   $  |   %  |   &  |   /  |   (  |   )  |   =  |  ?   |
 * |------+------+------+------+------+-------------+------+------+------+------+------|
 * | Del  |  F1  |  F2  |  F3  |  F4  |  F5  |  F6  |   `  |   ´  |      |   ^  |  '   |
 * |------+------+------+------+------+------|------+------+------+------+------+------|
 * | Shift|  F7  |  F8  |  F9  |  F10 |  F11 |  F12 |   *  |   <  |   >  |      |Close |
 * |------+------+------+------+------+------+------+------+------+------+------+------|
 * | Ctrl | GUI  |      |  Alt |Lower |             |Raise |AltGr | VOLD | VOLU |Enter |
 * `-----------------------------------------------------------------------------------'
 */
[_RAISE] = KEYMAP( \
  KC_GRV,  KC_EXLM, KC_AT,   KC_HASH, NO_DLR,  KC_PERC, KC_CIRC, KC_AMPR, KC_ASTR, KC_LPRN, KC_RPRN, KC_UNDS, \
  KC_DEL,  KC_F1,   KC_F2,   KC_F3,   KC_F4,   KC_F5,   KC_F6, KC_PLUS, KC_EQL, _______, KC_RCBR, KC_NUHS,  \
  TD(TD_CAPS), KC_F7,   KC_F8,   KC_F9,   KC_F10,  KC_F11,  KC_F12, S(KC_NUHS),KC_NUBS, S(KC_NUBS), _______, LALT(KC_F4),  \
  KC_LCTL, KC_LGUI, _______, KC_LALT, LOWER, _______, _______, RAISE, KC_RALT, KC_VOLD, KC_VOLU, KC_ENT \
),


/* Adjust (Lower + Raise)
 * ,-----------------------------------------------------------------------------------.
 * |  F11 |  F1  |  F2  |  F3  |  F4  |  F5  |  F6  |  F7  |  F8  |  F9  |  F10 |  F12 |
 * |------+------+------+------+------+-------------+------+------+------+------+------|
 * |      | Prev | Next |   €  |   £  |   [  |   ]  |RgbTog|RgbHui|RgbSai|RgbVai|Reset |
 * |------+------+------+------+------+------|------+------+------+------+------+------|
 * |      | VOLD | VOLU |      |   ¤  |   {  |   }  |RgbMod|RgbHud|RgbSad|RgbVad|AGnorm|
 * |------+------+------+------+------+------+------+------+------+------+------+------|
 * |      |      |      |      |      |             |      |      |      |      |AGswap| 
 * `-----------------------------------------------------------------------------------'
 */
[_ADJUST] =  KEYMAP( \
  KC_F11,  KC_F1,   KC_F2,   KC_F3,   KC_F4,   KC_F5,   KC_F6,  KC_F7,   KC_F8,   KC_F9,   KC_F10, KC_F12, \
  _______, KC_MPRV, KC_MNXT, NO_EURO, NO_PND,  NO_LBRC, NO_RBRC, RGB_TOG, RGB_HUI, RGB_SAI, RGB_VAI, RESET, \
  _______, KC_VOLD, KC_VOLU, _______, KC_DLR, NO_LCBR, NO_RCBR, RGB_MOD, RGB_HUD, RGB_SAD, RGB_VAD, AG_NORM, \
  _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, AG_SWAP \
)


};

#ifdef AUDIO_ENABLE
float tone_qwerty[][2]     = SONG(QWERTY_SOUND);
float tone_dvorak[][2]     = SONG(DVORAK_SOUND);
float tone_colemak[][2]    = SONG(COLEMAK_SOUND);
#endif

void persistant_default_layer_set(uint16_t default_layer) {
  eeconfig_update_default_layer(default_layer);
  default_layer_set(default_layer);
}

qk_tap_dance_action_t tap_dance_actions[] = {
  //Tap once for change track, twice for play
  [TD_MSK]  = ACTION_TAP_DANCE_DOUBLE(KC_MNXT, KC_MPLY),
  [TD_ENG]  = ACTION_TAP_DANCE_DOUBLE(KC_NUHS, S(KC_NUHS)),
  [TD_CAPS] = ACTION_TAP_DANCE_DOUBLE(KC_LSFT, KC_CAPS)

// Other declarations would go here, separated by commas, if you have them
};

bool process_record_user(uint16_t keycode, keyrecord_t *record) {
  switch (keycode) {
    case QWERTY:
      if (record->event.pressed) {
        #ifdef AUDIO_ENABLE
          PLAY_NOTE_ARRAY(tone_qwerty, false, 0);
        #endif
        persistant_default_layer_set(1UL<<_QWERTY);
      }
      return false;
      break;
    case COLEMAK:
      if (record->event.pressed) {
        #ifdef AUDIO_ENABLE
          PLAY_NOTE_ARRAY(tone_colemak, false, 0);
        #endif
        persistant_default_layer_set(1UL<<_COLEMAK);
      }
      return false;
      break;
    case DVORAK:
      if (record->event.pressed) {
        #ifdef AUDIO_ENABLE
          PLAY_NOTE_ARRAY(tone_dvorak, false, 0);
        #endif
        persistant_default_layer_set(1UL<<_DVORAK);
      }
      return false;
      break;
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
