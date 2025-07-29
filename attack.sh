#!/bin/bash
source ./getExt.sh

echo "Begining Malware lol"

LIB_NAME="./bin/libmyLib_c.${DL_EXT}"
ATTACK_LIB_NAME="./bin/libmyAttackedLib_c.${DL_EXT}"
ORIG_HEX_FILE="./bin/hex_dump.hex" # Store the original hex dump for reference
PATCH_FILE_NAME="./bin/changes.patch"
ATTACK_HEX_FILE="./bin/bad_hex_dump.hex"

echo "Converting lib binaries to hex"
# dump the binary to a plain hex representation
xxd -p $LIB_NAME > $ORIG_HEX_FILE 
xxd -p $ATTACK_LIB_NAME > $ATTACK_HEX_FILE 

echo "Diffing and creating patch..."
diff -u $ORIG_HEX_FILE $ATTACK_HEX_FILE > $PATCH_FILE_NAME
patch $ORIG_HEX_FILE < $PATCH_FILE_NAME
# get load the hex content as a single line so our content doesn't get broken up
HEX_CONTENT=$(tr -d '\n' < $ORIG_HEX_FILE)
# replace the desired content with our evil message
# PATCHED_HEX_CONTENT=$(echo "$HEX_CONTENT" | sed "s/$OLD_HEX/$NEW_HEX/")

echo "Applying patch..."
# --- Convert the modified single-line hex back to binary ---
echo "$HEX_CONTENT" | xxd -r -p > "${LIB_NAME}.patched"

# --- Replace the original with the patched version ---
mv "${LIB_NAME}.patched" "$LIB_NAME"
echo "Successfully patched $LIB_NAME"
echo "Planet hacked"

# --- Clean up temporary hex dump files ---
rm "$ORIG_HEX_FILE"
rm "$ATTACK_HEX_FILE"
