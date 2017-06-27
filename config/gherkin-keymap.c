#include "gherkin.h"

extern rgblight_config_t rgblight_config;
extern keymap_config_t keymap_config;

//Friendly Layer Names
#define _QWERTY 0
#define _ZERO 1
#define _ONE 2
#define _TWO 3
#define _ADJUST 4
#define _WINMAN 5
#define _TOGGLE 6

enum custom_keycodes {
  QWERTY = SAFE_RANGE,
  ZERO,
  ONE,
  TWO,
  ADJUST,
  WINMAN,
  TOGGLE,
};

// Fillers to make layering more clear
#define _______ KC_TRNS
#define XXXXXXX KC_NO

#define MACRO_GAPS_INCREASE             9
#define MACRO_GAPS_DECREASE             10

#define MACRO_FULLSCREEN                11
#define MACRO_NET                       12
#define MACRO_VERTICAL                  13
#define MACRO_HORIZONTAL                14

#define MACRO_BREATH_TOGGLE             15
#define MACRO_BREATH_SPEED_INC          16
#define MACRO_BREATH_SPEED_DEC          17
#define MACRO_BREATH_DEFAULT            18

#define MACRO_WIN_LEFT                  19
#define MACRO_WIN_RIGHT                 20
#define MACRO_WIN_UP                    21
#define MACRO_WIN_DOWN                  22

#define MACRO_GO_WORKSPACE_LEFT         27
#define MACRO_GO_WORKSPACE_RIGHT        28
#define MACRO_MOVE_WORKSPACE_LEFT       29
#define MACRO_MOVE_WORKSPACE_RIGHT      30

#define MACRO_KILL                      31
#define MACRO_RESIZE                    32

#define M_GINC              M(MACRO_GAPS_INCREASE)
#define M_GDEC              M(MACRO_GAPS_DECREASE)

#define M_FULS              M(MACRO_FULLSCREEN)
#define M_NET               M(MACRO_NET)
#define M_VERT              M(MACRO_VERTICAL)
#define M_HORZ              M(MACRO_HORIZONTAL)

#define M_WINL              M(MACRO_WIN_LEFT)
#define M_WINR              M(MACRO_WIN_RIGHT)
#define M_WINU              M(MACRO_WIN_UP)
#define M_WIND              M(MACRO_WIN_DOWN)

#define M_GWSL              M(MACRO_GO_WORKSPACE_LEFT)
#define M_GWSR              M(MACRO_GO_WORKSPACE_RIGHT)
#define M_MWSL              M(MACRO_MOVE_WORKSPACE_LEFT)
#define M_MWSR              M(MACRO_MOVE_WORKSPACE_RIGHT)

#define M_KILL              M(MACRO_KILL)
#define M_RESZ              M(MACRO_RESIZE)

enum {
  TD_Q_ESC = 0,
  TD_SFT_CTL = 1,
  TD_A_TAB = 2, 
  TD_5_DOT = 3
};

//Tap Dance Definitions
qk_tap_dance_action_t tap_dance_actions[] = {
  //Tap once for Esc, twice for Caps Lock
  [TD_Q_ESC]  = ACTION_TAP_DANCE_DOUBLE(KC_Q, KC_ESC),
  [TD_SFT_CTL]  = ACTION_TAP_DANCE_DOUBLE(KC_RSFT, KC_LCTL),
  [TD_A_TAB]  = ACTION_TAP_DANCE_DOUBLE(KC_A, KC_TAB), 
  [TD_5_DOT]  = ACTION_TAP_DANCE_DOUBLE(KC_P5, KC_PDOT)
// Other declarations would go here, separated by commas, if you have them
};

const uint16_t PROGMEM keymaps[][MATRIX_ROWS][MATRIX_COLS] = {
  [_QWERTY] = KEYMAP(
    TD(0),    KC_W,     KC_E,     KC_R,     KC_T,     KC_Y,     KC_U,     KC_I,     KC_O,     KC_P,  
    TD(2),    KC_S,     KC_D,     KC_F,     KC_G,     KC_H,     KC_J,     KC_K,     XXXXXXX,     F(4),
    CTL_T(KC_Z), GUI_T(KC_X), ALT_T(KC_C), F(0), F(1), F(2),    F(3),     KC_M,     KC_L,    TD(1))
  ,
  [_ZERO] = KEYMAP(
    KC_1,     KC_2,     KC_3,     KC_4,     KC_5,     KC_6,     KC_7,     KC_8,     KC_9,     KC_0,
    KC_RSFT,  XXXXXXX,  XXXXXXX,  XXXXXXX,  XXXXXXX,  XXXXXXX,  XXXXXXX,  XXXXXXX,  XXXXXXX,  _______,
    _______,  _______,  _______,  _______,  XXXXXXX,  XXXXXXX,  XXXXXXX,  KC_COMM,  KC_DOT,   _______)
  ,
  [_ONE] = KEYMAP(
    XXXXXXX,  XXXXXXX,  XXXXXXX,  XXXXXXX,  XXXXXXX,  XXXXXXX,  XXXXXXX,  KC_EQL,   KC_DEL,   KC_BSPC,
    KC_RSFT,  XXXXXXX,  XXXXXXX,  XXXXXXX,  XXXXXXX,  KC_QUOT,  KC_GRV,   KC_SCLN,  XXXXXXX,  KC_MINS,
    _______,  _______,  _______,  XXXXXXX,  _______,  KC_SLSH,  KC_LBRC,  KC_RBRC,  KC_BSLS,  KC_RSFT)
  ,
  [_TWO] = KEYMAP(
    KC_CAPS,  KC_PGDOWN, KC_UP,   KC_PGUP,  XXXXXXX,  XXXXXXX,  XXXXXXX,  XXXXXXX,  KC_DEL,   KC_BSPC,
    _______,  KC_LEFT,  KC_DOWN,  KC_RIGHT,  KC_END,  KC_HOME,  XXXXXXX,  XXXXXXX,  XXXXXXX,  KC_PSCREEN,
    _______,  _______,  _______,  KC_HOME, RALT(KC_GRAVE), _______, KC_END, XXXXXXX, XXXXXXX, _______)
  ,
  [_ADJUST] = KEYMAP(
    RGB_TOG,  KC_WH_D,  KC_MS_U,  KC_WH_U,  RGB_HUI,  RGB_SAI,  RGB_VAI,  BL_INC,   BL_TOGG,  KC_PAUS,
    RGB_MOD,  KC_MS_L,  KC_MS_D,  KC_MS_R,  RGB_HUD,  RGB_SAD,  RGB_VAD,  BL_DEC,   XXXXXXX,  KC_BTN3,
    _______,  _______,  _______,  XXXXXXX,  KC_BTN1,  KC_BTN2,  _______,  XXXXXXX,  XXXXXXX,  _______)
  ,
  [_WINMAN] = KEYMAP(
    M_KILL,   XXXXXXX,  M_WINU,   M_FULS,  XXXXXXX,  XXXXXXX,  XXXXXXX,  XXXXXXX,   M_GDEC,   M_GINC,
    KC_RSFT,  M_WINL,   M_WIND,   M_WINR,  M_VERT,   M_HORZ,   XXXXXXX,  XXXXXXX,   XXXXXXX,  _______,
    XXXXXXX,  XXXXXXX,  M_NET,    M_MWSL,  M_GWSL,   M_GWSR,   M_MWSR,   XXXXXXX,   XXXXXXX,  TG(_TOGGLE))
  ,
  [_TOGGLE] = KEYMAP(
    KC_PAST,  KC_P7,  KC_P8,  KC_P9,  KC_PMNS,  XXXXXXX,  XXXXXXX,  XXXXXXX,  XXXXXXX,  KC_NLCK,
    KC_PSLS,  KC_P4,  TD(3),  KC_P6,  KC_PPLS,  XXXXXXX,  XXXXXXX,  XXXXXXX,  XXXXXXX,  XXXXXXX,
    KC_P0,    KC_P1,  KC_P2,  KC_P3,  KC_PENT,  XXXXXXX,  XXXXXXX,  XXXXXXX,  XXXXXXX,  TO(_QWERTY))
}; 

enum function_id {
    LAUNCH,
    RGBLED_TOGGLE,
};

// define variables for reactive RGB
bool RGB_INIT = false;
bool TOG_STATUS = false;
bool NUMLAY_STATUS = false; // this can be named for any toggle layer
int RGB_current_mode;

const uint16_t PROGMEM fn_actions[] = {
  [0]  = ACTION_LAYER_TAP_KEY(_ZERO, KC_V),
  [1]  = ACTION_LAYER_TAP_KEY(_ONE, KC_B),
  [2]  = ACTION_LAYER_TAP_KEY(_TWO, KC_SPC),
  [3]  = ACTION_LAYER_TAP_KEY(_ADJUST, KC_N),
  [4]  = ACTION_LAYER_TAP_KEY(_WINMAN, KC_ENT),
};

bool process_record_user(uint16_t keycode, keyrecord_t *record) {
 
  switch (keycode) {
    case RGB_MOD:
      //led operations - RGB mode change now updates the RGB_current_mode to allow the right RGB mode to be set after reactive keys are released
      if (record->event.pressed) {
        rgblight_mode(RGB_current_mode);
        rgblight_step();
        RGB_current_mode = rgblight_config.mode;
      }
      return false;
      break;
  }
  return true;
}

const macro_t *action_get_macro(keyrecord_t *record, uint8_t id, uint8_t opt)
{
  switch(id) {
    case MACRO_GAPS_INCREASE:
        if (record->event.pressed)
        {
            return MACRO( D(LCTL), D(LALT), T(P), U(LALT), U(LCTL), END  );
        }
        break;
    case MACRO_GAPS_DECREASE:
        if (record->event.pressed)
        {
            return MACRO( D(LCTL), D(LALT), T(O), U(LALT), U(LCTL), END  );
        }
        break;
    case MACRO_FULLSCREEN:
        if (record->event.pressed)
        {
            return MACRO( D(LALT), T(F), U(LALT), END  ); 
        }
        break;
    case MACRO_NET:
        if (record->event.pressed)
        {
            return MACRO( D(LALT), T(C), U(LALT), END  );
        }
        break;
    case MACRO_VERTICAL:
        if (record->event.pressed)
        {
            return MACRO( D(LALT), T(V), U(LALT), END  );
        }
        break;
    case MACRO_HORIZONTAL:
        if (record->event.pressed)
        {
            return MACRO( D(LALT), T(H), U(LALT), END  );
        }
        break;
    case MACRO_WIN_LEFT:
        if (record->event.pressed)
        {
            return MACRO( D(LALT), T(LEFT), U(LALT), END  );
        }
        break;

    case MACRO_WIN_RIGHT:
        if (record->event.pressed)
        {
            return MACRO( D(LALT), T(RIGHT), U(LALT), END  );
        }
        break;

    case MACRO_WIN_UP:
        if (record->event.pressed)
        {
            return MACRO( D(LALT), T(UP), U(LALT), END  );
        }
        break;

    case MACRO_WIN_DOWN:
        if (record->event.pressed)
        {
            return MACRO( D(LALT), T(DOWN), U(LALT), END  );
        }
        break;

    case MACRO_GO_WORKSPACE_LEFT:
        if (record->event.pressed)
        {
            return MACRO( D(LCTL), D(LALT), T(LEFT), U(LALT), U(LCTL), END  );
        }
        break;

    case MACRO_GO_WORKSPACE_RIGHT:
        if (record->event.pressed)
        {
            return MACRO( D(LCTL), D(LALT), T(RIGHT), U(LALT), U(LCTL), END  );
        }
        break;

    case MACRO_MOVE_WORKSPACE_LEFT:
        if (record->event.pressed)
        {
            return MACRO( D(LSFT), D(LCTL), D(LALT), T(LEFT), U(LALT), U(LCTL), U(LSFT), END  );
        }
        break;

    case MACRO_MOVE_WORKSPACE_RIGHT:
        if (record->event.pressed)
        {
            return MACRO( D(LSFT), D(LCTL), D(LALT), T(RIGHT), U(LALT), U(LCTL), U(LSFT), END  );
        }
        break;

    case MACRO_KILL:
        if (record->event.pressed)
        {
            return MACRO( D(LSFT), D(LALT), T(Q), U(LALT), U(LSFT), END  );
        }
        break;

    case MACRO_RESIZE:
        if (record->event.pressed)
        {
            return MACRO( D(LALT), T(R), U(LALT), END  );
        }
        break;
  }
    return MACRO_NONE;
};

void matrix_scan_user(void) {
  uint8_t layer = biton32(layer_state);
  switch (layer) {
    case _ZERO:
        if (RGB_INIT) {} else {
          RGB_current_mode = rgblight_config.mode;
          RGB_INIT = true;
        }
        if (TOG_STATUS) { //TOG_STATUS checks is another reactive key currently pressed, only changes RGB mode if returns false
        } else {
          TOG_STATUS = !TOG_STATUS;
          rgblight_mode(4);
        }
        break;
    case _ONE:
        if (RGB_INIT) {} else {
          RGB_current_mode = rgblight_config.mode;
          RGB_INIT = true;
        }
        if (TOG_STATUS) { //TOG_STATUS checks is another reactive key currently pressed, only changes RGB mode if returns false
        } else {
          TOG_STATUS = !TOG_STATUS;
          rgblight_mode(5);
        }
        break;
    case _TWO:
        if (RGB_INIT) {} else {
          RGB_current_mode = rgblight_config.mode;
          RGB_INIT = true;
        }
        if (TOG_STATUS) { //TOG_STATUS checks is another reactive key currently pressed, only changes RGB mode if returns false
        } else {
          TOG_STATUS = !TOG_STATUS;
          rgblight_mode(26);
        }
        break;
    case _WINMAN:
        if (RGB_INIT) {} else {
          RGB_current_mode = rgblight_config.mode;
          RGB_INIT = true;
        }
        if (TOG_STATUS) { //TOG_STATUS checks is another reactive key currently pressed, only changes RGB mode if returns false
        } else {
          TOG_STATUS = !TOG_STATUS;
          rgblight_mode(29);
        }
        break;
    case _ADJUST:
       if (RGB_INIT) {} else {
          RGB_current_mode = rgblight_config.mode;
          RGB_INIT = true;
        }
        if (TOG_STATUS) { //TOG_STATUS checks is another reactive key currently pressed, only changes RGB mode if returns false
        } else {
          TOG_STATUS = !TOG_STATUS;
          rgblight_mode(25);
        }
        break;
    case _TOGGLE:
        rgblight_mode(20);
        break;
    case _QWERTY:
        if (RGB_INIT) {} else {
          RGB_current_mode = rgblight_config.mode;
          RGB_INIT = true;
        }
        rgblight_mode(RGB_current_mode);   // revert RGB to initial mode prior to RGB mode change
        TOG_STATUS = false;
        break;
  }
};
