/*
This is the keymap for the keyboard

Copyright 2012 Jun Wako <wakojun@gmail.com>
Copyright 2015 Jack Humbert
Copyright 2017 Art Ortenburger

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 2 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/

#include "orthodox.h"
#include "action_layer.h"
#include "eeconfig.h"

extern keymap_config_t keymap_config;

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

// Fillers to make layering more clear
// increase readability 
#define _______ KC_TRNS
#define XXXXXXX KC_NO

#define MACRO_GAPS_INCREASE             9
#define MACRO_GAPS_DECREASE             10

#define MACRO_FULLSCREEN                11
#define MACRO_NET                       12
#define MACRO_VERTICAL                  13
#define MACRO_HORIZONTAL                14

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

//Tap Dance Definitions

const uint16_t PROGMEM keymaps[][MATRIX_ROWS][MATRIX_COLS] = {

[_QWERTY] = KEYMAP( \
  KC_ESC,  KC_Q,    KC_W,    KC_E,    KC_R,    KC_T,                                                               KC_Y,    KC_U,    KC_I,       KC_O,       KC_P,      KC_BSPC, \
  KC_TAB,  KC_A,    KC_S,    KC_D,    KC_F,    KC_G,    KC_LCTL, XXXXXXX, KC_LALT,     KC_LGUI, XXXXXXX, KC_RCTL,  KC_H,    KC_J,    KC_K,       KC_L,       KC_SCLN,   F(0), \
  KC_LSFT, KC_Z,    KC_X,    KC_C,    KC_V,    KC_B,    KC_SPC,   F(1), F(2),        KC_RCTL, F(3), KC_SPC,     KC_N,    KC_M,    KC_COMM,    KC_DOT,     RALT(KC_GRAVE),KC_RSFT \
),

[_LOWER] = KEYMAP( \
  KC_F1, KC_F2, KC_F3,   KC_F4, KC_F5,  KC_F6,                                                                     KC_F7,   KC_F8,   KC_F9,      KC_F10,     KC_F11,    KC_F12, \
  KC_1, KC_2, KC_3, KC_4, KC_5, KC_6,            _______, XXXXXXX, _______,          _______, XXXXXXX, _______,    KC_7,    KC_8,    KC_9,       KC_0,       KC_MINUS,  KC_EQUAL, \
  _______, KC_F7, KC_F8, KC_F9, KC_F10, KC_F11,  _______, _______, _______,          _______, _______, _______,    KC_QUOTE,KC_SLASH,KC_LBRACKET,KC_RBRACKET,KC_BSLASH, _______ \
),

[_RAISE] = KEYMAP( \
  KC_GRAVE, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX,                                                                  XXXXXXX, KC_PGDOWN, KC_UP, KC_PGUP,  KC_PSCREEN,KC_DEL, \
  KC_CAPS,  XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX,  _______, XXXXXXX, _______,          _______, XXXXXXX, _______,  KC_HOME, KC_LEFT, KC_DOWN, KC_RIGHT, XXXXXXX,   XXXXXXX, \
  _______, XXXXXXX,  XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX,  _______, _______, _______,          _______, _______, _______,  KC_END,  XXXXXXX, XXXXXXX, XXXXXXX,  XXXXXXX,   _______ \
),

[_ADJUST] =  KEYMAP( \
  _______, KC_WH_L, KC_MS_U, KC_WH_R, XXXXXXX, XXXXXXX,                                                                 XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX,  XXXXXXX, KC_PAUS,  \
  KC_BTN3, KC_MS_L, KC_MS_D, KC_MS_R, KC_WH_U,  XXXXXXX, _______, XXXXXXX, _______,          _______, XXXXXXX, _______, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, _______, \
  _______, XXXXXXX, XXXXXXX, XXXXXXX, KC_WH_D, XXXXXXX,  KC_BTN1, _______, _______,          _______, _______, KC_BTN2, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX,  _______, _______  \
),

[_WINMAN] =  KEYMAP( \
  RESET,  M_KILL,   M_WINU,  XXXXXXX, M_RESZ,  XXXXXXX,                                                                 XXXXXXX, XXXXXXX, M_MOVU,  M_GDEC,  M_GINC,  _______,  \
  _______, M_WINL,  M_WIND,  M_WINR,  M_FULS,  XXXXXXX,  _______, XXXXXXX, _______,          _______, XXXXXXX, _______, M_HORZ,  M_MOVL,  M_MOVD,  M_MOVR,  XXXXXXX, _______, \
  _______, XXXXXXX, XXXXXXX, M_NET,   M_VERT,  XXXXXXX,  M_MWSL,  M_GWSL,  _______,          _______, M_GWSR,  M_MWSR,  XXXXXXX, XXXXXXX, KC_MNXT, KC_VOLD, KC_VOLU, KC_MPLY  \
)


};

const uint16_t PROGMEM fn_actions[] = {
  [0]  = ACTION_LAYER_TAP_KEY(_WINMAN, KC_ENT),
  [1]  = ACTION_LAYER_TAP_KEY(_LOWER, KC_SPC),
  [2]  = ACTION_LAYER_TAP_KEY(_RAISE, KC_LCTL),
  [3]  = ACTION_LAYER_TAP_KEY(_ADJUST, KC_SPC),
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