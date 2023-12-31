/* Copyright 2021 jurassic73 */

/* This program is free software: you can redistribute it and/or modify */
/* it under the terms of the GNU General Public License as published by */
/* the Free Software Foundation, either version 2 of the License, or */
/* (at your option) any later version. */

/* This program is distributed in the hope that it will be useful, */
/* but WITHOUT ANY WARRANTY; without even the implied warranty of */
/* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the */
/* GNU General Public License for more details. */

/* You should have received a copy of the GNU General Public License */
/* along with this program.  If not, see <http://www.gnu.org/licenses/>. */

#include QMK_KEYBOARD_H

#define _LAYER0 0
#define _LAYER1 1

enum custom_keycodes {
    LAYER0,
    LAYER1,
};

const uint16_t PROGMEM keymaps[][MATRIX_ROWS][MATRIX_COLS] = {

    [_LAYER0] = LAYOUT(KC_ESC, KC_F1, KC_F2, KC_BRIU, KC_BRID, KC_F5, KC_MPRV, KC_MNXT, KC_MPLY, KC_VOLD, KC_VOLU, KC_MUTE, KC_F12, KC_PSCR, KC_SLCK, KC_PAUS,
                       KC_GRV, KC_1, KC_2, KC_3, KC_4, KC_5, KC_6, KC_7, KC_8, KC_9, KC_0, KC_MINS, KC_EQL, KC_BSPC, KC_INS, KC_HOME, KC_PGUP,
                       KC_TAB, KC_Q, KC_W, KC_E, KC_R, KC_T, KC_U, KC_I, KC_O, KC_P, KC_LBRC, KC_RBRC, KC_BSLS, KC_DEL, KC_END, KC_PGDN,
                       KC_ESC, KC_A, KC_S, KC_D, KC_F, KC_G, KC_Y, KC_J, KC_K, KC_L, KC_SCLN, KC_QUOT, KC_ENT,
                       KC_LSFT, KC_Z, KC_X, KC_C, KC_V, KC_B, KC_H, KC_M, KC_COMM, KC_DOT, KC_SLSH, KC_RSFT, KC_UP,
                       KC_LCTL, LT(1,KC_CAPS), KC_LALT, KC_LGUI, LT(1,KC_SPC), KC_N, LT(1,KC_SPC), KC_RGUI, KC_RALT, KC_APP, KC_RCTL, KC_LEFT, KC_DOWN, KC_RGHT),

    [_LAYER1] = LAYOUT(KC_NO, KC_F1, KC_F2, KC_F3, KC_F4, KC_F5, KC_F6, KC_F7, KC_F8, KC_F9, KC_F10, KC_F11, KC_F12, KC_NO, KC_NO, KC_NO,
                       KC_NO, KC_NO, KC_NO, KC_NO, KC_END, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO,
                       KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_UNDO, KC_HOME, KC_NO, KC_PSTE, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO,
                       KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_COPY, KC_DOWN, KC_UP, KC_RGHT, KC_NO, KC_NO, KC_ENT,
                       KC_NO, KC_NO, KC_BSPC, KC_NO, KC_NO, KC_NO, KC_LEFT, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO,
                       KC_NO, KC_NO, KC_NO, KC_NO, KC_ENT, KC_NO, KC_BSPC, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO, KC_NO),

};
