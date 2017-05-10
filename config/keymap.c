#include "amj40.h"

// Each layer gets a name for readability, which is then used in the keymap matrix below.
// The underscores don't mean anything - you can have a layer called STUFF or any other name.
// Layer names don't all need to be of the same length, obviously, and you can also skip them
// entirely and just use numbers.
#define _QWERTY 0
#define _LOWER 1
#define _RAISE 2
#define _ADJUST 3
#define _WINMAN 4

enum custom_keycodes {
  QWERTY = SAFE_RANGE,
  LOWER,
  RAISE,
  ADJUST,
  WINMAN,
};

// increase readability 
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

#define MACRO_MOVE_WIN_LEFT             23
#define MACRO_MOVE_WIN_RIGHT            24
#define MACRO_MOVE_WIN_UP               25
#define MACRO_MOVE_WIN_DOWN             26

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

#define M_BRTOG             M(MACRO_BREATH_TOGGLE)
#define M_BSPDU             M(MACRO_BREATH_SPEED_INC)
#define M_BSPDD             M(MACRO_BREATH_SPEED_DEC)
#define M_BDFLT             M(MACRO_BREATH_DEFAULT)

#define M_WINL              M(MACRO_WIN_LEFT)
#define M_WINR              M(MACRO_WIN_RIGHT)
#define M_WINU              M(MACRO_WIN_UP)
#define M_WIND              M(MACRO_WIN_DOWN)

#define M_MOVL              M(MACRO_MOVE_WIN_LEFT)
#define M_MOVR              M(MACRO_MOVE_WIN_RIGHT)
#define M_MOVU              M(MACRO_MOVE_WIN_UP)
#define M_MOVD              M(MACRO_MOVE_WIN_DOWN)

#define M_GWSL              M(MACRO_GO_WORKSPACE_LEFT)
#define M_GWSR              M(MACRO_GO_WORKSPACE_RIGHT)
#define M_MWSL              M(MACRO_MOVE_WORKSPACE_LEFT)
#define M_MWSR              M(MACRO_MOVE_WORKSPACE_RIGHT)

#define M_KILL              M(MACRO_KILL)
#define M_RESZ              M(MACRO_RESIZE)

const uint16_t PROGMEM keymaps[][MATRIX_ROWS][MATRIX_COLS] = {

    [_QWERTY] = KEYMAP( \
        KC_ESC,  KC_Q,   KC_W,   KC_E,   KC_R,   KC_T,   KC_Y,   KC_U,   KC_I,    KC_O,    KC_P,   KC_BSPC,\
        KC_TAB,  KC_A,   KC_S,   KC_D,   KC_F,   KC_G,   KC_H,   KC_J,   KC_K,    KC_L,    F(3),\
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
		KC_CAPS, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, KC_HOME, KC_LEFT, KC_DOWN, KC_RIGHT, KC_SCOLON, \
		_______, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, KC_END, XXXXXXX, XXXXXXX, XXXXXXX, _______, \
		_______, _______, _______, _______, _______, _______, _______, _______ \
		),
	
    [_ADJUST] = KEYMAP( \
        RGB_TOG, KC_WH_L, KC_MS_U, KC_WH_R, RGB_MOD, RGB_HUI, RGB_HUD, RGB_SAI, RGB_SAD, RGB_VAI, RGB_VAD, KC_PAUS, \
		KC_BTN3, KC_MS_L, KC_MS_D, KC_MS_R, KC_WH_U, XXXXXXX, XXXXXXX, KC_PGUP, KC_PGDOWN, XXXXXXX,  XXXXXXX,  \
		KC_LGUI, XXXXXXX, XXXXXXX, KC_WH_D,  XXXXXXX, M_BRTOG, M_BSPDU, M_BSPDD, M_BDFLT, BL_TOGG, BL_INC, \
		_______, _______, _______, KC_BTN1, KC_BTN2, _______, BL_TOGG, BL_DEC \
		),

    [_WINMAN] = KEYMAP( \
        _______, M_KILL, M_WINU, XXXXXXX, M_RESZ, XXXXXXX, XXXXXXX, XXXXXXX, M_MOVU, M_GDEC, M_GINC, _______, \
    _______, M_WINL, M_WIND, M_WINR, M_FULS, XXXXXXX, M_HORZ, M_MOVL, M_MOVD, M_MOVR, _______, \
    _______, XXXXXXX, XXXXXXX, M_NET, M_VERT, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, _______, \
    _______, _______, M_MWSL, M_GWSL, M_GWSR, M_MWSR, _______, _______ \
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
  [3]  = ACTION_LAYER_TAP_KEY(_WINMAN, KC_ENT),
};

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
    case MACRO_BREATH_TOGGLE:
        if (record->event.pressed)
        {
            breathing_toggle();
        }
        break;

    case MACRO_BREATH_SPEED_INC:
        if (record->event.pressed)
        {
            breathing_speed_inc(1);
        }
        break;

    case MACRO_BREATH_SPEED_DEC:
        if (record->event.pressed)
        {
            breathing_speed_dec(1);
        }
        break;

    case MACRO_BREATH_DEFAULT:
        if (record->event.pressed)
        {
            breathing_defaults();
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

    case MACRO_MOVE_WIN_LEFT:
        if (record->event.pressed)
        {
            return MACRO( D(LSFT), D(LALT), T(LEFT), U(LALT), U(LSFT), END  );
        }
        break;

    case MACRO_MOVE_WIN_RIGHT:
        if (record->event.pressed)
        {
            return MACRO( D(LSFT), D(LALT), T(RIGHT), U(LALT), U(LSFT), END  );
        }
        break;

    case MACRO_MOVE_WIN_UP:
        if (record->event.pressed)
        {
            return MACRO( D(LSFT), D(LALT), T(UP), U(LALT), U(LSFT), END  );
        }
        break;

    case MACRO_MOVE_WIN_DOWN:
        if (record->event.pressed)
        {
            return MACRO( D(LSFT), D(LALT), T(DOWN), U(LALT), U(LSFT), END  );
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
    case WINMAN:
      if (record->event.pressed) {
        layer_on(_WINMAN);
      } else {
        layer_off(_WINMAN);
      }
      return false;
      break;
  }
  return true;
}
