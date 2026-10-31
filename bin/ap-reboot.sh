#!/bin/sh
set -e

BASE_URL='http://192.168.1.2/'

security_encode() {
  local password_alphabet='yLwVl0zKqws7LgKPRQ84Mdt708T1qQ3Ha7xv3H7NyU84p21BriUWBU43odz3iP4rBL3cD02KZciXTysVXiV8ngg6vL48rPJyAUw0HurW20xqxv9aYb4M9wK1Ae0wlro510qXeU07kV57fQMc8L6aLgMLwygtc0F10a0Dg70TOoouyFhdysuRMO51yY5ZlOZZLEal1h0t9YQW0Ko7oBwmCAHoic4HYbUyVeU3sfQ1xtXcPcf1aT303wAQhv66qzW'

  printf '%s\n%s\n%s\n' "$1" "$2" "${3:-$password_alphabet}" | awk -v url_encode="${4:-0}" '
    BEGIN {
      for (char_index = 32; char_index < 127; char_index++) {
        ascii_code[sprintf("%c", char_index)] = char_index
      }
    }

    NR == 1 { input_text = $0 }
    NR == 2 { key_text = $0 }
    NR == 3 { alphabet = $0 }

    function bitwise_xor(left_value, right_value, xor_result, bit_value) {
      xor_result = 0
      bit_value = 1

      while (left_value + right_value > 0) {
        if (left_value % 2 != right_value % 2) {
          xor_result += bit_value
        }
        left_value = int(left_value / 2)
        right_value = int(right_value / 2)
        bit_value *= 2
      }

      return xor_result
    }

    END {
      output_length = length(input_text) > length(key_text) ? length(input_text) : length(key_text)

      for (char_index = 1; char_index <= output_length; char_index++) {
        input_code = char_index <= length(input_text) ? ascii_code[substr(input_text, char_index, 1)] : 187
        key_code = char_index <= length(key_text) ? ascii_code[substr(key_text, char_index, 1)] : 187
        encoded_char = substr(alphabet, bitwise_xor(input_code, key_code) % length(alphabet) + 1, 1)

        if (url_encode) {
          if (encoded_char !~ /^[A-Za-z0-9_.~-]$/) {
            printf "%%%02X", ascii_code[encoded_char]
            continue
          }
        }
        printf "%s", encoded_char
      }
    }
  '
}

post_request() {
  local response_body

  if ! response_body=$(curl -q -sS --connect-timeout 5 --max-time 20 \
    -e "$BASE_URL" -H 'Content-Type: text/plain;charset=UTF-8' \
    --data "$2" \
    "$BASE_URL?code=$1&asyn=${3:-0}${session_id:+&id=$session_id}"); then
    return 1
  fi

  printf '%s\n' "$response_body" | tr -d '\r'
}

login() {
  local response challenge challenge_alphabet encoded_password

  response=$(post_request 2 0)
  if [ "$(printf '%s\n' "$response" | sed -n '1p')" != 00007 ]; then
    echo 'Unexpected login response' >&2
    exit 1
  fi

  challenge=$(printf '%s\n' "$response" | sed -n '4p')
  challenge_alphabet=$(printf '%s\n' "$response" | sed -n '5p')
  if [ -z "$challenge" ]; then
    echo 'Missing login challenge' >&2
    exit 1
  fi
  if [ -z "$challenge_alphabet" ]; then
    echo 'Missing login challenge' >&2
    exit 1
  fi

  encoded_password=$(security_encode "$PASSWORD" 'RDpbLfCPsJZ7fiv')
  session_id=$(security_encode "$challenge" "$encoded_password" "$challenge_alphabet" 1)

  response=$(post_request 7 '')
  if [ "$(printf '%s\n' "$response" | sed -n '1p')" != 00000 ]; then
    echo 'Login failed' >&2
    exit 1
  fi
}

reboot_ap() {
  local response

  if ! response=$(post_request 6 '' 1); then
    echo 'Reboot result uncertain; not retrying' >&2
    exit 1
  fi
  if [ "$(printf '%s\n' "$response" | sed -n '1p')" != 00000 ]; then
    echo 'Reboot not acknowledged' >&2
    exit 1
  fi

  echo 'Reboot request accepted'
}

main() {
  if [ -z "$PASSWORD" ]; then
    echo 'Usage: PASSWORD=xxxxxxxx ./ap-reboot.sh' >&2
    exit 1
  fi

  export LC_ALL=C

  login
  reboot_ap
}

main
