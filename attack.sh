#!/bin/bash
source ./getExt.sh

LIB_NAME="./bin/libmyLib_c.${DL_EXT}"
ATTACK_LIB_NAME="./bin/libmyAttackedLib_c.so"
ORIG_HEX_FILE="./bin/hex_dump.hex" # Store the original hex dump for reference
PATCH_FILE_NAME="./bin/changes.patch"
ATTACK_HEX_FILE="./bin/bad_hex_dump.hex"
# case sensitive btw
# OLD_HEX="48656c6c6f204920616d20612043206c696272617279" # REPLACE WITH YOUR ACTUAL ORIGINAL HEX
# NEW_HEX="41545441434b2054484520202043206c696272617279" # Replace with your actual new hex

# --- Backup the original library ---
cp "$LIB_NAME" "${LIB_NAME}.bak"
echo "Backed up $LIB_NAME to ${LIB_NAME}.bak"

# dump the binary to a plain hex representation
xxd -p $LIB_NAME > $ORIG_HEX_FILE 
xxd -p $ATTACK_LIB_NAME > $ATTACK_HEX_FILE 

diff -u $ORIG_HEX_FILE $ATTACK_HEX_FILE > $PATCH_FILE_NAME
# cp $ORIG_HEX_FILE "$ORIG_HEX_FILE.bak"
patch $ORIG_HEX_FILE < $PATCH_FILE_NAME
# get load the hex content as a single line so our content doesn't get broken up
# HEX_CONTENT=$(tr -d '\n' < $ORIG_HEX_FILE)
HEX_CONTENT=$(tr -d '\n' < $ORIG_HEX_FILE)
# replace the desired content with our evil message
# PATCHED_HEX_CONTENT=$(echo "$HEX_CONTENT" | sed "s/$OLD_HEX/$NEW_HEX/")

# --- Convert the modified single-line hex back to binary ---
echo "$HEX_CONTENT" | xxd -r -p > "${LIB_NAME}.patched"

# --- Replace the original with the patched version ---
mv "${LIB_NAME}.patched" "$LIB_NAME"
echo "Successfully patched $LIB_NAME"

# --- Clean up temporary hex dump files ---
rm "$ORIG_HEX_FILE"
rm "$ATTACK_HEX_FILE"
